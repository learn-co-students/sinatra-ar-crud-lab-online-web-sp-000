#Placeholder for a model
#4. create the model aka the key to the problem. 
# this creates the logic of the problem, reflect what the problem is and how it works, and thus help to solve a problem.
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

    def self.find_or_create_by(title:, content:)
        article = DB[:conn].execute("SELECT * FROM songs WHERE title = ? AND content = ?", title, content)
        if article.empty?
            article_data = article[0]
            article = Article.new(article_data[0], article_data[1], article_data[2])
        else
            article = self.create(title: title, content: content)
        end
        article
    end
end