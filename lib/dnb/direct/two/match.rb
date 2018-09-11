class DnB::Direct::Two::Match

    def self.identity_resolution(params = {})
        started_at = Time.now

        max = params[:CandidateMaximumQuantity] || 1

        response = DnB::Direct::Two.connection.get do |req|
            # base url
            url = '/V6.0/organizations?cleansematch=true'

            params[:country_code] ||= 'US'
            params[:max_match] ||= 1

            # CandidateMaximumQuantity
            unless params[:max_match].nil?
              url << "&CandidateMaximumQuantity=#{params[:name]}"
            end

            # name lookup
            unless params[:name].nil?
                url << "&SubjectName=#{params[:name]}"
            end

            # street address lookup
            unless params[:street_address].nil?
                url << "&StreetAddressLine-1=#{params[:street_address]}"
            end

            # city lookup
            unless params[:city].nil?
                url << "&PrimaryTownName=#{params[:city]}"
            end

            # state lookup
            unless params[:state].nil?
                url << "&TerritoryName=#{params[:state]}"
            end

            # country lookup
            unless params[:country_code].nil?
                url << "&CountryISOAlpha2Code=#{params[:country_code]}"
            end

            # postal code lookup
            unless params[:postal_code].nil?
                url << "&FullPostalCode=#{params[:postal_code]}"
            end

            # telephone lookup
            unless params[:telephone].nil?
                url << "&TelephoneNumber=#{params[:telephone]}"
            end

            # registration number lookup
            unless params[:registration_number].nil?
                url << "&OrganizationIdentificationNumber=#{params[:registration_number]}"
            end

            # DUNS number lookup
            unless params[:duns].nil?
                url << "&DUNSNumber=#{params[:duns]}"
            end

            req.url url
            req.headers[:Authorization] = DnB::Direct::Two.api_token
        end
        puts "== [MATCH IdentityResolution] Completed in #{((Time.now - started_at) * 1000).round}ms".cyan.bold if $LOG_DNB
        response.body
    end # def self.identity_resolution
end # class DnB::Direct::Two::Match
