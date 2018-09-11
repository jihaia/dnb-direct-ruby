class DnB::Direct::Plus::Mappings::MatchCandidate < DnB::Direct::Mapping

  kartograph do
    mapping DnB::Direct::Plus::MatchCandidate

    scoped :read do

      # fields
      property :displaySequence
      property :matchQualityInformation

      # has one
      property :organization, plural: false, include: DnB::Direct::Plus::Mappings::Organization

      # has many

    end # scoped :read

  end # kartograph

end # class
