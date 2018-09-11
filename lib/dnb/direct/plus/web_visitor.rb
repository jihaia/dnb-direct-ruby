class DnB::Direct::Plus::WebVisitor


    def self.ip_resource_linkage(params = {})
        started_at = Time.now
        first = true

        response = DnB::Direct::Plus.connection.get do |req|
            domain_type = params[:domain_type] || "any"
            # base url
            url = "/v1/duns-search/ipresource/#{params[:ip_address]}?view=linkage&ipDomainType=#{domain_type}"

            req.url url
            req.headers[:authorization] = "Bearer #{DnB::Direct::Plus.api_token}"
        end
        puts "== [MATCH IdentityResolution] Completed in #{((Time.now - started_at) * 1000).round}ms".cyan.bold if $LOG_DNB

        raise DnB::Direct::Exception::TpsExceededError.new if response.status == 429
        res = DnB::Direct::Plus::Mappings::MatchResponse.extract_single(response.body, :read)
        res.payload = response.body if !res.nil? && res.respond_to?(:payload)

        res
    end # def self.ip_resource_linkage
end # class DnB::Direct::Plus::WebVisitor
