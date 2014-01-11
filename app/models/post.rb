class Post < ActiveRecord::Base
  attr_accessible :date_created, :text, :title
end
