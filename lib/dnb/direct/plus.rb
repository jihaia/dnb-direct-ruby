require 'base64'
require 'faraday'

module DnB
    module Direct
        class Plus
            BASE_URL = 'https://plus.dnb.com'.freeze
            class << self
              attr_accessor :api_key, :api_secret, :token, :api_base_url, :conn

              # Constructs the authorization key by encoding {{api_key}}:{{api_secret}}
              # to a base64 encoded string. Both required attributes must be set prior
              # to generating the key.
              def api_auth
                  raise ArgumentError, 'api_key is missing' if api_key.blank?
                  raise ArgumentError, 'api_secret is missing' if api_secret.blank?
                  Base64.strict_encode64(api_key + ':' + api_secret)
              end # def api_auth

              def use_credentials key, secret
                @api_key = key
                @api_secret = secret
                true
              end

              # Fetches the token from the authorization service.
              def api_token
                  if @token.nil?
                      response = connection.post do |req|
                          req.url '/v2/token'
                          req.headers[:authorization] = "Basic #{api_auth}"
                          req.body = '{ "grant_type" : "client_credentials" }'
                      end
                      @token = JSON.parse(response.body)['access_token']
                  end
                  token
              end # def api_token

              def connection
                  @conn ||= Faraday.new(connection_options) do |faraday|
                      faraday.request :url_encoded # form-encode POST params
                      faraday.response(:logger) if $LOG_DNB
                      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
                  end
              end

                private

              def connection_options
                  {
                      url: BASE_URL,
                      headers: {
                          content_type: 'application/json'
                      }
                  }
              end
            end
        end
    end
end
