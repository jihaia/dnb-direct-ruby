class DnB::Direct::Two::Content

    def self.dcp_prem(params = {})
        started_at = Time.now
        first = true

        response = DnB::Direct::Two.connection.get do |req|
            # base url
            url = '/V6.1/organizations/' + params[:duns] + "/products/DCP_PREM"

            req.url url
            req.headers[:Authorization] = DnB::Direct::Two.api_token

        end
        puts "== [CONTECT DC_PREM] Completed in #{((Time.now - started_at) * 1000).round}ms".cyan.bold if $LOG_DNB
        response.body
    end # def self.identity_resolution
end # class DnB::Direct::Two::Match
