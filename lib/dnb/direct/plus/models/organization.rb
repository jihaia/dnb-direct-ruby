class DnB::Direct::Plus::Organization < DnB::Direct::Model

    attr_accessor :payload

    attribute :duns
    attribute :primaryName
    attribute :tradeStyleNames

    attribute :dunsControlStatus
    attribute :primaryAddress
    attribute :registeredAddress
    attribute :mailingAddress
    attribute :businessEntityType

    attribute :industryCodes
    attribute :registrationNumbers
    attribute :telephone
    attribute :fax

end
