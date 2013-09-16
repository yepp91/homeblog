
class MainController < ApplicationController
	def index
	end
	def feedback #обратная связь
	end

	def how_time
		now = Time.new
		work_end = Time.local(now.year,now.month,now.day,3,0,0)		
		@diff = (work_end.to_i - now.to_i)/3600
		@work_end = work_end
		@now = now
	end

end
