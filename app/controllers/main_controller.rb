# coding: utf-8
require 'net/http'
require 'json'

class MainController < ApplicationController
	def index
	end
	def feedback #обратная связь
	end

	def how_time
		now = Time.new
		work_end = Time.mktime(now.year,now.month,now.day,15,0,0)		
		@diff_hour = ((work_end.to_i - now.to_i)/3600).abs
		@diff_mins = ((work_end.to_i - now.to_i)%3600)/60
		if (now.hour >= 6 and now.hour <= 11 )
			@mess = "Скоро обед, крепись..."		
		end
		if (now.hour == 11 and now.min >= 0 and now.min <= 45)
			@mess = "Какго хера ты еще не на обеде?"
		end
		if ( (now.hour == 11 and now.min > 45) or (now.hour > 11) )
			@mess = "Скоро домой, соберись."		
		end

		if (now.hour >= 15)
			@mess = "Домой! &_&"
		end

		@work_end = work_end
		@now = now 
		begin
			@advise = JSON.parse Net::HTTP.get('fucking-great-advice.ru', '/api/random_by_tag/%D0%BA%D0%BE%D0%B4%D0%B5%D1%80%D1%83')
		rescue
			@advise = 'fucking advise is down...';
		end		

	end

end
