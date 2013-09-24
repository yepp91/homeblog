
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
	end

end
