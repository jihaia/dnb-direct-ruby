class DnB::Direct::Plus::Mappings::Organization < DnB::Direct::Mapping

  kartograph do
    mapping DnB::Direct::Plus::Organization
    root_key singular: 'organization', plural: 'organizations', scopes: [:read]

    scoped :read do

      # fields
      property :duns
      property :primaryName
      property :tradeStyleNames

      # has one
      property :dunsControlStatus, plural: false, include: DnB::Direct::Plus::Mappings::DunsControlStatus
      property :businessEntityType, plural: false, include: DnB::Direct::Plus::Mappings::BusinessEntityType
      property :primaryAddress, plural: false, include: DnB::Direct::Plus::Mappings::Address
      property :registeredAddress, plural: false, include: DnB::Direct::Plus::Mappings::Address
      property :mailingAddress, plural: false, include: DnB::Direct::Plus::Mappings::Address

      # has many
      property :industryCodes, plural: true, include: DnB::Direct::Plus::Mappings::IndustryCode
      property :registrationNumbers, plural: true, include: DnB::Direct::Plus::Mappings::RegistrationNumber
      property :telephone, plural: true, include: DnB::Direct::Plus::Mappings::Telephone
      property :fax, plural: true, include: DnB::Direct::Plus::Mappings::Telephone

    end # scoped :read


  end # kartograph

end # class
