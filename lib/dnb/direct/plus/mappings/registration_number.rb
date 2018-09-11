class DnB::Direct::Plus::Mappings::RegistrationNumber < DnB::Direct::Mapping

  kartograph do
    mapping DnB::Direct::Plus::RegistrationNumber

    scoped :read do
      property :registrationNumber
      property :typeDescription
      property :typeDnBCode
    end # scoped :read

  end # kartograph

end # class
