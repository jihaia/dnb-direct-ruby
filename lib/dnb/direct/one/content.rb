class DnB::Direct::One::Content

    def self.company(params = {})
      start = Time.now
      puts "== Started company at #{start}" if $LOG_DNB
        response = DnB::Direct::One.connection.get do |req|
            req.url "/DnBAPI-17/rest/company/#{params[:duns]}"
        end
        puts "== Completed in #{Time.now - start}s" if $LOG_DNB
        company = DnB::Direct::One::Mappings::Company.extract_single(response.body, :read)
        company.payload = response.body if company.respond_to? :payload
        company
    end # def self.profile_with_linkage


end # class
