class DnB::Direct::Plus::Search


    def self.typeahead(params = {})
        started_at = Time.now
        country_code = params[:country] || 'US'
        response = DnB::Direct::Plus.connection.get do |req|
            url = "/v1/search/typeahead?searchTerm=#{params[:term]}&countryISOAlpha2Code=#{country_code}"
            req.url url
            req.headers[:authorization] = "Bearer #{DnB::Direct::Plus.api_token}"
        end
        puts "== [TYPEAHEAD] Completed in #{((Time.now - started_at)*1000).round}ms".cyan.bold if $LOG_DNB

        JSON.parse(response.body)
    end # def self.typeahead


    def self.domain(domain, params = {})
        started_at = Time.now
        response = DnB::Direct::Plus.connection.get do |req|
            url = "/v1/duns-search/domain/" + ERB::Util.url_encode(domain)
            req.url url
            p "== [DOMAIN] URL - #{}ms".cyan.bold if $LOG_DNB
            req.headers[:authorization] = "Bearer #{DnB::Direct::Plus.api_token}"
        end
        p "== [DOMAIN] Completed in #{((Time.now - started_at)*1000).round}ms".cyan.bold if $LOG_DNB

        JSON.parse(response.body)
    end # def self.typeahead


    def self.ip(ip_address, params={})
      started_at = Time.now
      response = DnB::Direct::Plus.connection.get do |req|
          url = "/v1/duns-search/ipresource/#{ip_address}?ipDomainType=biz&view=standard"
          req.url url
          p "== [DOMAIN] URL - #{}ms".cyan.bold if $LOG_DNB
          req.headers[:authorization] = "Bearer #{DnB::Direct::Plus.api_token}"
      end
      p "== [DOMAIN] Completed in #{((Time.now - started_at)*1000).round}ms".cyan.bold if $LOG_DNB

      JSON.parse(response.body)
    end # def self.ip




end # class
