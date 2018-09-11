class DnB::Direct::One::Company < DnB::Direct::Model

  attr_accessor :payload

  attribute :duns
  attribute :name
  attribute :parentName
  attribute :yearFounded
  attribute :fein
  attribute :companyType
  attribute :legalStatus

end
