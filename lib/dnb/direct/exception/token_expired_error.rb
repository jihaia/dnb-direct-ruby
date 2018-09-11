class DnB::Direct::Exception::TokenExpiredError < StandardError
  def initialize(msg="Token has expired.")
    super
  end
end
