require 'pry'

class Dog

  attr_accessor :name, :breed

  def initialize(hash)
    binding.pry
    @name = hash[:name]
    @breed = hash[:breed]
  end
end
