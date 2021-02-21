require 'pry'
class Owner
  attr_reader :species, :name
  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end
  def say_species
    "I am a #{@species}."
  end
  def self.all
    @@all
  end
  def self.count
    self.all.count
  end
  def self.reset_all
    @@all = []
  end
  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end
  def dogs
    Dog.all.select do |cat|
    cat.owner == self
    end
  end
  def buy_cat(name)
    Cat.new(name, self)

  end
  def buy_dog(name)
    Dog.new(name, self)

  end
  def walk_dogs
    Dog.all.select do |dog|
       dog.mood = "happy"
    end
  end
  def feed_cats
    Cat.all.select do |cat|
      cat.mood = "happy"
    end
  end
  def sell_pets
    all_pets = []
    ownerless_pets = []
    self.dogs.each do |dog|
      dog.mood = "nervous"
    end
    # binding.pry
    self.cats.each do |cat|
      cat.mood = "nervous"
    end

    @cats ||= self.cats
    @dogs ||= self.dogs

    # stupid_cats = self.cats
    # stupid_dogs = self.dogs 

    all_pets.push(cats)
    all_pets.push(dogs)
    all_pets = all_pets.flatten
    # all_pets << self.dogs
    # all_pets << self.cats
    ownerless_pets = all_pets.collect do |pet|
      # binding.pry
      pet.owner = nil
    end
    ownerless_pets
  end
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end