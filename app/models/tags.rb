class Tags < ActiveRecord::Base
  attr_accessible :name

  =begin
def add(:tagname)
  	tag = Tags.find_by_name(:tagname)
  	if tag.nil?
  		tag = Tags.new([:name => :tagname])  	
  end=end


end
