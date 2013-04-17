class StaticController < ApplicationController
	#methods for static pages like the FAQ and about
	def faq
		logger.info("got to the correct controller method")
	end

	def loginError
	end

end