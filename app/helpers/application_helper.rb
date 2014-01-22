module ApplicationHelper
	def title(page_title) #set page title
  		content_for(:title) { page_title }
	end
	def keywords(page_keywords) #set page title
  		content_for(:keywords) { page_keywords } 
	end

	def description(text)
		content_for(:description) { strip_tags(truncate_html(text, :length => 200).html_safe)}
	end
end
