module ApplicationHelper
	def title(page_title) #set page title
  		content_for(:title) { page_title }
	end
	def keywords(page_keywords) #set page title
  		content_for(:keywords) { page_keywords } 
	end
end
