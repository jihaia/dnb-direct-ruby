require "dnb/direct/version"
require 'active_support/all'
require 'colored'
require 'kartograph'

module DnB
  module Direct

    # General
    autoload :Model, 'dnb/direct/model'
    autoload :Mapping, 'dnb/direct/mapping'

    # Direct+, Direct 1.x, Direct 2.x
    autoload :Plus, 'dnb/direct/plus'
    autoload :One, 'dnb/direct/one'
    autoload :Two, 'dnb/direct/two'

    autoload :Consumer, 'dnb/direct/consumer'

    module Exception
      autoload :TokenExpiredError, 'dnb/direct/exception/token_expired_error'
      autoload :TpsExceededError, 'dnb/direct/exception/tps_exceeded_error'
    end

    class Plus

      ## Services
      autoload :Content, 'dnb/direct/plus/content'
      autoload :Search,  'dnb/direct/plus/search'
      autoload :Match, 'dnb/direct/plus/match'
      autoload :MultiProcess, 'dnb/direct/plus/multi_process'
      autoload :WebVisitor, 'dnb/direct/plus/web_visitor'

      ## Models
      autoload :Organization, 'dnb/direct/plus/models/organization'
      autoload :DunsControlStatus, 'dnb/direct/plus/models/duns_control_status'
      autoload :IndustryCode, 'dnb/direct/plus/models/industry_code'
      autoload :RegistrationNumber, 'dnb/direct/plus/models/registration_number'
      autoload :Telephone, 'dnb/direct/plus/models/telephone'
      autoload :Address, 'dnb/direct/plus/models/address'
      autoload :BusinessEntityType, 'dnb/direct/plus/models/business_entity_type'
      autoload :MatchResponse, 'dnb/direct/plus/models/match_response'
      autoload :MatchCandidate, 'dnb/direct/plus/models/match_candidate'

      module Mappings
        autoload :Organization, 'dnb/direct/plus/mappings/organization'
        autoload :DunsControlStatus, 'dnb/direct/plus/mappings/duns_control_status'
        autoload :IndustryCode, 'dnb/direct/plus/mappings/industry_code'
        autoload :RegistrationNumber, 'dnb/direct/plus/mappings/registration_number'
        autoload :Telephone, 'dnb/direct/plus/mappings/telephone'
        autoload :Address, 'dnb/direct/plus/mappings/address'
        autoload :BusinessEntityType, 'dnb/direct/plus/mappings/business_entity_type'
        autoload :MatchResponse, 'dnb/direct/plus/mappings/match_response'
        autoload :MatchCandidate, 'dnb/direct/plus/mappings/match_candidate'
      end

    end


    class One

      ## Services
      autoload :Content, 'dnb/direct/one/content'

      ## Models
      autoload :Company, 'dnb/direct/one/models/company'

      module Mappings
        autoload :Company, 'dnb/direct/one/mappings/company'
      end

    end


    class Two

      # Services
      autoload :Match, 'dnb/direct/two/match'
      autoload :Content, 'dnb/direct/two/content'

    end




  end
end
