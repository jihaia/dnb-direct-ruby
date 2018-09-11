class DnB::Direct::Exception::TpsExceededError < StandardError
  def initialize(msg="Transactions per second (TPS) has been reached.")
    super
  end
end
