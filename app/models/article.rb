#Placeholder for a model

class Article < ActiveRecord::Base
  
  def change 
    create_table :books do |t|
t.string :title
t.string :author
end
end
  
end