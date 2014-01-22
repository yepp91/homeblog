module ArticleHelper
	def formatTextCutted(text)
		truncate_html(text, :length => 200).html_safe
	end
end
