class DnB::Direct::One::Mappings::Company < DnB::Direct::Mapping

  kartograph do
    mapping DnB::Direct::One::Company

    scoped :read do

      # fields
      property :duns
      property :name
      property :parentName
      property :yearFounded
      property :fein
      property :companyType
      property :legalStatus

    end # scoped :read


  end # kartograph

end # class
