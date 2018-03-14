require 'pry'

class Dog

  attr_accessor :name, :breed

  def initialize(hash)
    binding.pry
    @name = name
    @breed = breed
  end
end
