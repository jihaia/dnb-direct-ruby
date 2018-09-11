class DnB::Direct::Plus::MultiProcess

    # Step One of the multi-process is to request a new job. The result is
    # a job identifier and an endpoint to where the file should be sent.
    # $LOG_DNB = true
    # DnB::Direct::Plus::MultiProcess.initiate_job :match, file_name: 'sample.csv'
    def self.initiate_job params = {}
        started_at = Time.now
        job_type = params[:job_type] || 'match'

        p "== [MULTI-PROCESS InitiateJob] Started"

        response = DnB::Direct::Plus.connection.get do |req|
            req.url "/v1/multiprocess/jobSubmission?processID=#{job_type.to_s}&processVersion=v1&inputFileName=#{params[:file_name]}"
            req.headers[:authorization] = "Bearer #{DnB::Direct::Plus.api_token}"
            req.headers[:origin] = 'www.dnb.com'
            req.headers['Customer-Key'] = DnB::Direct::Plus.api_key
        end

        job = JSON.parse(response.body)

        unless params[:file].nil?
          upload = self.post_file(job: job, file: params[:file])
          p upload
        end

        p "== [MULTI-PROCESS InitiateJob] Completed in #{((Time.now - started_at)*1000).round}ms".cyan.bold
    end # def self.initiate_job


    def self.post_file params={}

      details = params[:job]["jobSubmissionDetail"]
      content_url = details["contentURL"]

      encoded64_key = Base64.encode64(DnB::Direct::Plus.api_key)

      #hash = Digest::MD5.new
      #hash.update DnB::Direct::Plus.api_key

      md5_encoded = Digest::MD5.hexdigest(DnB::Direct::Plus.api_key)
      decoded64_md5 = Base64.decode64(md5_encoded)

      payload = { :file => Faraday::UploadIO.new(params[:file], 'text/plain') }
      connection = Faraday.new({ url: content_url}) do |builder|
        builder.request  :multipart
        builder.request  :url_encoded
        builder.adapter  :net_http
      end

      response = connection.put do |req|
          req.url URI::parse(content_url).query
          req.headers["x-amz-server-side-encryption-customer-algorithm"] = "AES256"
          req.headers["x-amz-server-side-encryption-customer-key"] = encoded64_key
          req.headers["x-amz-server-side-encryption-customer-key-MD5"] = decoded64_md5
          req.headers[:origin] = "www.dnb.com"
          req.body = payload
      end

      response.body
    end # def self.post_file

    def self.check_status job_id
      response = DnB::Direct::Plus.connection.get do |req|
          req.url "/v1/multiprocess/jobStatus/#{job_id}"
          req.headers[:authorization] = "Bearer #{DnB::Direct::Plus.api_token}"
          req.headers[:origin] = 'www.dnb.com'
          req.headers['Customer-Key'] = DnB::Direct::Plus.api_key
      end

      JSON.parse(response.body)
    end



end # class DnB::Direct::Plus::MultiProcess
