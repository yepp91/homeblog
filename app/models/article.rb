class Article < ActiveRecord::Base
  attr_accessible :text, :title
  attr_accessor :tags  
  attr_accessor :tagc


  after_find do |article|
    	logger.info 'set article tags'
    	article.tagc = Tag2article.getTags(article.id)
    end
end
