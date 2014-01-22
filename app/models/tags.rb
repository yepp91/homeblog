class Tags < ActiveRecord::Base
  attr_accessible :name

  def self.add(tagname)
    tagname = tagname.strip
    tagname = tagname.downcase
  	@tag_f = Tags.find_by_name(tagname)
  	if @tag_f.blank?
  		@tag_f = Tags.new({:name => tagname})
  		@tag_f.save()
  		return @tag_f
  	else
  		return @tag_f
  	end
  end

  def self.get(tagname)
    Tags.find_by_name(tagname)
  end
end
