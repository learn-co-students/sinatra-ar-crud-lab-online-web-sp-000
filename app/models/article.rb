#Placeholder for a model

class Article < ActiveRecord::Base
    attr_reader :title, :content

    @@all = []

    def initialize(params)
        @title = params[:title]
        @content = params[:content]
    end

    def self.all
        @@all
    end
end