class Blog < ActiveRecord::Base
  attr_accessible :date_created, :text, :title
end
