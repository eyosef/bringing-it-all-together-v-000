require 'pry'

class Dog

  attr_accessor :name, :breed, :id

  @@all = []

  def initialize(hash, id = nil)
    @name = hash[:name]
    @breed = hash[:breed]
    @id = id
    @@all << self
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
    DROP TABLE dogs
    SQL

    DB[:conn].execute(sql)
  end

  def save #FIX
      if self
        sql=<<-SQL
        INSERT INTO dogs (name, breed)
        VALUES (?, ?)
        SQL

        DB[:conn].execute(sql, self.name, self.breed)
        @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]

        self
      end
  end #save

  def self.create(hash)
    new_dog = self.new(hash)
    new_dog.save
  end

  def self.find_by_id(id)
    @@all.each { |instance| return instance if instance.id == id}
  end

  def self.find_or_create_by(hash)
    @@all.each do |instance|
      if instance.name != hash[:name] && instance.breed != hash[:breed]
        self.create(hash)
      else
        instance
      end #if statement
    end #each iteration
  end #method

  def self.new_from_db
  end

end #class
