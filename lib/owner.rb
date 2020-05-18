require'pry'
class Owner
attr_reader :name, :species
attr_accessor :cat, :dog
@@all_human = []
@@all_pets = []
  def initialize(name)
    @name = name
    @species = "human"
    @@all_human << self
  end

  def self.all 
    @@all_human
  end

  def self.count
    self.all.count 
  end

  def self.reset_all
    self.all.clear
  end

  def say_species
    "I am a #{species}."
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(cat)
    Cat.new(cat, self)
  end

  def buy_dog(dog)
    Dog.new(dog, self)
  end

  def walk_dogs
    dogs.map {|dog|dog.mood = "happy"}
  end

  def feed_cats
    cats.map {|cat|cat.mood = "happy"}
  end

  def sell_pets
    cats.map do |cat|
    cat.mood = "nervous" 
    cat.owner = nil
    end
    dogs.map do |dog|
    dog.mood = "nervous" 
    dog.owner = nil
    end
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

end