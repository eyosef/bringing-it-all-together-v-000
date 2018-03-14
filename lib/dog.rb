require 'pry'

class Dog

  attr_accessor :name, :breed, :id

  def initialize(hash, id = nil)
    @name = hash[:name]
    @breed = hash[:breed]
    @id = id
  end

  def self.create_table
    sql=<<-SQL
    CREATE TABLE IF NOT EXISTS dogs(
      id INTEGER PRIMARY KEY,
      name TEXT,
      breed TEXT
    )
    SQL

    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql=<<-SQL
    SQL
  end

end
