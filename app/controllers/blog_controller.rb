class BlogController < ApplicationController
	def index
		@page_title = 'Intern Betas | Blog'

		render :layout => 'page'
	end
end
