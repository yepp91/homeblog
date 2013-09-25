require 'net/http'
require 'json'

class MainController < ApplicationController
	def index
	end
	def feedback #обратная связь
	end

	def how_time
		now = Time.new
		work_end = Time.mktime(now.year,now.month,now.day,1,0,0)		
		@diff_hour = ((work_end.to_i - now.to_i)/3600).abs
		@diff_mins = ((work_end.to_i - now.to_i)%3600)/60
		@work_end = work_end
		@now = now
		@advise = JSON.parse Net::HTTP.get('fucking-great-advice.ru', '/api/random_by_tag/%D0%BA%D0%BE%D0%B4%D0%B5%D1%80%D1%83')

	end

end
