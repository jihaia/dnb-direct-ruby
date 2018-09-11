require 'virtus'

module DnB::Direct
  class Model
    include Virtus.model
    include Virtus::Equalizer.new(name || inspect)

    def inspect
      values = Hash[instance_variables.map { |name| [name, instance_variable_get(name)] } ]
      "<#{self.class.name} #{values}>"
    end # def inspect

  end
end
