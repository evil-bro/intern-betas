class PagesController < ApplicationController
	def index
		@page_title = 'Intern Betas'
		@types = ['', 'Acct/Finance', 'Dev', 'Design', 'Engineer', 'Life/Science', 'Marketing']

		@vacancies = Vacancy.order(:created_at => 'DESC').limit(10)

		render :layout => 'page'
	end

	def privacy
		@page_title = 'Intern Betas | Privacy'

		render :layout => 'page'
	end

	def team
		@page_title = 'Intern Betas | Team'

		render :layout => 'page'
	end
end
