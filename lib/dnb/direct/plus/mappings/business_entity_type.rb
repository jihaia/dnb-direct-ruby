class DnB::Direct::Plus::Mappings::BusinessEntityType < DnB::Direct::Mapping

  kartograph do
    mapping DnB::Direct::Plus::BusinessEntityType

    scoped :read do
      property :description
      property :dnbCode
    end # scoped :read


  end # kartograph

end # class
