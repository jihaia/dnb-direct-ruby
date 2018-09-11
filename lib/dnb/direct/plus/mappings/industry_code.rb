class DnB::Direct::Plus::Mappings::IndustryCode < DnB::Direct::Mapping

  kartograph do
    mapping DnB::Direct::Plus::IndustryCode

    scoped :read do
      property :code
      property :decription
      property :typeDescription
      property :typeDnBCode
      property :priority
    end # scoped :read

  end # kartograph

end # class
