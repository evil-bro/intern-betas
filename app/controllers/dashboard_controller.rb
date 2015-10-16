class DashboardController < ApplicationController
	def vacancies
		@page_title = 'Vacancies'
		@vacancies = Vacancy.order(:created_at => 'desc').paginate(:page => params[:page], :per_page => 10)

		render :layout => 'dashboard'
	end
end
