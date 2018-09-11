require 'faraday'

module DnB
    module Direct
        class Two
            BASE_URL = 'https://direct.dnb.com'.freeze
            class << self
              attr_accessor :username, :password, :token, :api_base_url, :conn

              # Fetches the token from the authorization service.
              def api_token
                if @token.nil?
                    raise ArgumentError, 'username is missing' if username.blank?
                    raise ArgumentError, 'password is missing' if password.blank?
                    response = connection.post do |req|
                        req.url '/Authentication/V2.0'
                        req.headers['x-dnb-user'] = username
                        req.headers['x-dnb-pwd'] = password
                    end
                    @token = response.headers['Authorization']
                end
                @token
              end

              def use_credentials username, password
                @username = username
                @password = password
                true
              end


              def connection
                  @conn ||= Faraday.new(connection_options) do |faraday|
                      faraday.request :url_encoded # form-encode POST params
                      faraday.response :logger if $LOG_DNB                # log requests to STDOUT
                      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
                  end
              end

              private

              def connection_options
                  {
                      url: BASE_URL,
                      headers: {
                          content_type: 'application/json',
                          accept: 'application/json'
                      }
                  }
              end
            end
        end
    end
end
