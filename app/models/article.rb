class Article < ActiveRecord::Base
  attr_accessible :text, :title  
  
  has_many :tag2articles  
  has_many :tags, through: :tag2articles  

  def self.getByTag(tagname)  	    
  	Article.joins(:tags).where('tags.name' => tagname).all()
  end

  def self.getAll()
  	Article.joins(:tags).all().uniq
  end

end
