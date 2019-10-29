#Placeholder for a model

class Article < ActiveRecord::Base
  @@all = []
  attr_accessor :title, :content, :id


  def initialize(hash)
    @title = hash[:title]
    @content = hash[:content]

    @@all << self
    self
  end


  def self.all
    @@all
  end


  def self.create(hash)
    #@id = hash[:id]
    @title = hash[:title]
    @content = hash[:content]

    @@all << self

  end

  def self.fetch_value(id)
    @@all.select {|article|
      article.id == id
    }
  end



end
