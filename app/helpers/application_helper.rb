module ApplicationHelper
	def title(page_title) #set page title
  		content_for(:title) { page_title }
	end
end
