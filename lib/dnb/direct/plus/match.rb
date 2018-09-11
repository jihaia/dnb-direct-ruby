class DnB::Direct::Plus::Match

    def self.extended_match(params={})
      started_at = Time.now
      first = true

      response = DnB::Direct::Plus.connection.get do |req|
          # base url
          url = '/v1/match/extendedMatch'

          # name lookup
          unless params[:name].nil?
              url << (first ? '?' : '&')
              url << "name=#{params[:name]}"
              first = false
          end

          # street address lookup
          unless params[:street_address].blank?
              url << (first ? '?' : '&')
              url << "streetAddressLine1=#{params[:street_address]}"
              first = false
          end

          # city lookup
          unless params[:city].blank?
              url << (first ? '?' : '&')
              url << "addressLocality=#{params[:city]}"
              first = false
          end

          # state lookup
          unless params[:state].blank?
              url << (first ? '?' : '&')
              url << "addressRegion=#{params[:state]}"
              first = false
          end

          # country lookup
          unless params[:country_code].blank?
              url << (first ? '?' : '&')
              url << "countryISOAlpha2Code=#{params[:country_code]}"
              first = false
          end

          # postal code lookup
          unless params[:postal_code].blank?
              url << (first ? '?' : '&')
              url << "postalCode=#{params[:postal_code]}"
              first = false
          end

          # telephone lookup
          unless params[:telephone].blank?
              url << (first ? '?' : '&')
              url << "telephoneNumber=#{params[:telephone]}"
              first = false
          end

          # registration number lookup
          unless params[:registration_number].blank?
              url << (first ? '?' : '&')
              url << "registrationNumber=#{params[:registration_number]}"
              first = false
          end

          # DUNS number lookup
          unless params[:duns].nil?
              url << (first ? '?' : '&')
              url << "duns=#{params[:duns]}"
              first = false
          end

          if params[:in_language].nil?
            url << (first ? '?' : '&')
            url << "inLanguage=en-US"
          else
            url << (first ? '?' : '&')
            url << "inLanguage=#{params[:in_language]}"
          end

          unless params[:candidate_maximum_quantity].nil?
            url << (first ? '?' : '&')
            url << "candidateMaximumQuantity=#{params[:candidate_maximum_quantity]}"
          end

          unless params[:min_confidence_code].nil?
            url << (first ? '?' : '&')
            url << "confidenceLowerLevelThresholdValue=#{params[:min_confidence_code]}"
          end

          unless params[:product_id].nil?
            url << (first ? '?' : '&')
            url << "productId=#{params[:product_id]}"
          end

          unless params[:version_id].nil?
            url << (first ? '?' : '&')
            url << "versionId=#{params[:version_id]}"
          end

          unless params[:customer_reference].nil?
            url << (first ? '?' : '&')
            url << "customerReference=#{params[:customer_reference]}"
          end

          req.url url
          p url if $LOG_DNB
          req.headers[:authorization] = "Bearer #{DnB::Direct::Plus.api_token}"
      end

      p response.status

      response.body
    end # def self.extended_match


    # $LOG_DNB = true
    # DnB::Direct::Plus::Match.identity_resolution(name: 'Costco', country_code: 'US')["matchCandidates"].first
    # DnB::Direct::Plus::Match.identity_resolution(name: 'Costco', country_code: 'US', street_address: '18414 Cottonwood Dr')["matchCandidates"].first
    # DnB::Direct::Plus::Match.identity_resolution(name: 'Costco', country_code: 'US', street_address: '18414 Cottonwood Dr', city: 'Parker')["matchCandidates"].first
    # DnB::Direct::Plus::Match.identity_resolution(name: 'Costco', country_code: 'US', street_address: '18414 Cottonwood Dr', city: 'Parker', state: 'CO')["matchCandidates"].first
    # DnB::Direct::Plus::Match.identity_resolution(name: 'Costco', country_code: 'US', street_address: '18414 Cottonwood Dr', city: 'Parker', state: 'CO', postalCode: '80138')["matchCandidates"].first
    # DnB::Direct::Plus::Match.identity_resolution(name: 'Costco', country_code: 'US', street_address: '18414 Cottonwood Dr', city: 'Parker', state: 'CO', postalCode: '80138', telephone: '9704166115')["matchCandidates"].first

    # DnB::Direct::Plus::Match.identity_resolution(name: 'Costco', country_code: 'US', street_address: '18414 Cottonwood Dr', city: 'Parker', state: 'CO', postalCode: '80138', telephone: '9704166115', duns: '010326869')
    # DnB::Direct::Plus::Match.identity_resolution(name: 'Costco', country_code: 'US', telephone: '9704166115')
    # DnB::Direct::Plus::Match.identity_resolution(country_code: 'US', telephone: '9704166115')
    # response = DnB::Direct::Plus::Match.identity_resolution(duns: '010326869')
    # res = DnB::Direct::Plus::Mappings::MatchResponse.extract_single(response.body, :read)
    def self.identity_resolution(params = {})
        started_at = Time.now
        first = true

        response = DnB::Direct::Plus.connection.get do |req|
            # base url
            url = '/v1/match/cleanseMatch'

            # name lookup
            unless params[:name].nil?
                url << (first ? '?' : '&')
                url << "name=#{params[:name]}"
                first = false
            end

            # street address lookup
            unless params[:street_address].blank?
                url << (first ? '?' : '&')
                url << "streetAddressLine1=#{params[:street_address]}"
                first = false
            end

            # city lookup
            unless params[:city].blank?
                url << (first ? '?' : '&')
                url << "addressLocality=#{params[:city]}"
                first = false
            end

            # state lookup
            unless params[:state].blank?
                url << (first ? '?' : '&')
                url << "addressRegion=#{params[:state]}"
                first = false
            end

            # country lookup
            unless params[:country_code].blank?
                url << (first ? '?' : '&')
                url << "countryISOAlpha2Code=#{params[:country_code]}"
                first = false
            end

            # postal code lookup
            unless params[:postal_code].blank?
                url << (first ? '?' : '&')
                url << "postalCode=#{params[:postal_code]}"
                first = false
            end

            # telephone lookup
            unless params[:telephone].blank?
                url << (first ? '?' : '&')
                url << "telephoneNumber=#{params[:telephone]}"
                first = false
            end

            # registration number lookup
            unless params[:registration_number].blank?
                url << (first ? '?' : '&')
                url << "registrationNumber=#{params[:registration_number]}"
                first = false
            end

            # DUNS number lookup
            unless params[:duns].nil?
                url << (first ? '?' : '&')
                url << "duns=#{params[:duns]}"
                first = false
            end

            if params[:in_language].nil?
              url << (first ? '?' : '&')
              url << "inLanguage=en-US"
            else
              url << (first ? '?' : '&')
              url << "inLanguage=#{params[:in_language]}"
            end

            unless params[:candidate_maximum_quantity].nil?
              url << (first ? '?' : '&')
              url << "candidateMaximumQuantity=#{params[:candidate_maximum_quantity]}"
            end

            req.url url
            req.headers[:authorization] = "Bearer #{DnB::Direct::Plus.api_token}"
        end
        puts "== [MATCH IdentityResolution] Completed in #{((Time.now - started_at) * 1000).round}ms".cyan.bold if $LOG_DNB

        raise DnB::Direct::Exception::TpsExceededError.new if response.status == 429
        res = DnB::Direct::Plus::Mappings::MatchResponse.extract_single(response.body, :read)
        res.payload = response.body if !res.nil? && res.respond_to?(:payload)

        res
    end # def self.identity_resolution
end # class DnB::Direct::Plus::Match
