require 'base64'
require 'faraday'

module DnB
    module Direct
        class One
            BASE_URL = 'http://dnbdirect-api.dnb.com'.freeze
            class << self
              attr_accessor :api_key, :api_secret, :token, :api_base_url, :conn

              def use_credentials username, password, key
                @api_username = username
                @api_password = password
                @api_key = key
              end


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
                          content_type: 'application/json',
                          username: @api_username,
                          password: @api_password,
                          "API-KEY": @api_key
                      }
                  }
              end
            end
        end
    end
end
