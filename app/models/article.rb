#Placeholder for a model

class Article < ActiveRecord::Base
  attr_accessor :title, :content
  
  attr_reader :id
  
  @@all = []
  
  def initialize(params)
    @id = params[:id]
    @title = params[:title]
    @content = params[:content]
    @@all << self
  end
  
  def self.all
    @@all
  end
  
end