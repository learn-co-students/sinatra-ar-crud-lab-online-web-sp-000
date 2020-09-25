class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :content

    end
  end
end
#this is where we create articles table withh two columns.
#we can also use a command rake db:create_migration NAME=articles and later fill it out