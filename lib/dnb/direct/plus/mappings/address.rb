class DnB::Direct::Plus::Mappings::Address < DnB::Direct::Mapping

  kartograph do
    mapping DnB::Direct::Plus::Address

    scoped :read do
      property :postalCode
      property :streetNumber
      property :streetName
      property :isRegisteredAddress
      property :minorTownName

      property :language
      property :addressCountry
      property :continentalRegion
      property :addressLocality
      property :addressRegion
      property :addressCounty
      property :streetAddress
      property :postOfficeBox
    end # scoped :read


  end # kartograph

end # class
