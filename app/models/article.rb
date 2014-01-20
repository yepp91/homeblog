class Article < ActiveRecord::Base
  attr_accessible :text, :title
  attr_accessor :tags
end
