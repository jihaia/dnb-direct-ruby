require 'bunny'

class DnB::Direct::Consumer < Bunny::Consumer

  def initialize(channel, queue, consumer_tag = channel.generate_consumer_tag, no_ack = true, exclusive = false, arguments = {})
    super
    me = self
    me.on_delivery do |delivery_info, metadata, payload|
      me.process(delivery_info, metadata, payload)
    end

    queue.subscribe_with(me)
  end


end
