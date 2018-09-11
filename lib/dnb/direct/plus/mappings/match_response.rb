class DnB::Direct::Plus::Mappings::MatchResponse < DnB::Direct::Mapping

  kartograph do
    mapping DnB::Direct::Plus::MatchResponse

    scoped :read do

      # fields
      property :candidatesMatchedQuantity
      property :matchDataCriteria

      # has one

      # has many
      property :matchCandidates, plural: true, include: DnB::Direct::Plus::Mappings::MatchCandidate

    end # scoped :read


  end # kartograph

end # class
