#Placeholder for a model

class Article < ActiveRecord::Base
	attr_accessor :title, :content

	def initialize(params)
		self.title = params[:title] 
		self.content = params[:content] 
	end
end