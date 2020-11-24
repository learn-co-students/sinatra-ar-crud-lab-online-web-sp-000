#Placeholder for a model

class Article < ActiveRecord::Base
    attr_accessor :title, :content

    @@all = []

    def initialize(args)
        @title = args[:title]
        @content = args[:content]
        @@all << self
    end

    def self.all
        @@all
    end

end