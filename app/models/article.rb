#Placeholder for a model

class Article < ActiveRecord::Base
  attr_reader :title, :content
  @@all = []


  def initialize(article)
      # binding.pry
  @title = article[:title]
  @content = article[:content]

  save
  end

  def self.all
  @@all
  end

  def save
    @@all << self
  end

end
