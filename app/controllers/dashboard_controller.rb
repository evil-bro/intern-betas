class DashboardController < ApplicationController
	before_action :authenticate_user!
	
	def vacancies
		if current_user.admin?
			@page_title = 'Vacancies'
			@vacancies = Vacancy.order(:created_at => 'desc').paginate(:page => params[:page], :per_page => 10)

			render :layout => 'dashboard'
		else
			redirect_to root_url
		end
	end
end
