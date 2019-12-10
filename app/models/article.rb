#Placeholder for a model

class Article < ActiveRecord::Base
  
    # def initialise(title,model)
    #     @title = title
    #     @model = model
    # end

    def delete
        Article.where(title: self.title).destroy_all
    end

    def update(id, title, content)
        attributes = {:title => title, :content => content}
        obj = Article.find_by_id(id)
        obj.update_attributes(attributes)
    end


end

