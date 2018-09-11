class DnB::Direct::Plus::Mappings::DunsControlStatus < DnB::Direct::Mapping

  kartograph do
    mapping DnB::Direct::Plus::DunsControlStatus

    scoped :read do
      property :isMarketable
      property :isMailUndeliverable
      property :isTelephoneDisconnected
      property :isDelisted
      property :fullReportDate
      property :operatingStatus
      property :subjectHandlingDetails
    end # scoped :read


  end # kartograph

end # class
