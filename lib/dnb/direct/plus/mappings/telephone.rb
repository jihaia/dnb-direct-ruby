class DnB::Direct::Plus::Mappings::Telephone < DnB::Direct::Mapping

  kartograph do
    mapping DnB::Direct::Plus::Telephone

    scoped :read do
      property :telephoneNumber
      property :isdCode
      property :isUnreachable
    end # scoped :read


  end # kartograph

end # class
