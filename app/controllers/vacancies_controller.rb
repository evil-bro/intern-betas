class VacanciesController < ApplicationController
	def index
		@page_title = 'Intern Betas'
		@types = ['', 'Acct/Finance', 'Dev', 'Design', 'Engineer', 'Life/Science', 'Marketing']
		
		if params[:type] == 'acct_finance'
			@vacancies = Vacancy.where(:vacancytype_id => 1).order(:created_at => 'DESC').limit(10)
		elsif params[:type] == 'dev'
			@vacancies = Vacancy.where(:vacancytype_id => 2).order(:created_at => 'DESC').limit(10)
		elsif params[:type] == 'design'
			@vacancies = Vacancy.where(:vacancytype_id => 3).order(:created_at => 'DESC').limit(10)
		elsif params[:type] == 'engineer'
			@vacancies = Vacancy.where(:vacancytype_id => 4).order(:created_at => 'DESC').limit(10)
		elsif params[:type] == 'life_science'
			@vacancies = Vacancy.where(:vacancytype_id => 5).order(:created_at => 'DESC').limit(10)
		elsif params[:type] == 'marketing'
			@vacancies = Vacancy.where(:vacancytype_id => 6).order(:created_at => 'DESC').limit(10)
		else
			@vacancies = Vacancy.order(:created_at => 'DESC').limit(10)
		end

		
		render :layout => 'page'
	end

	def browse
		@page_title = 'Intern Betas'
		@types = ['', 'Acct/Finance', 'Dev', 'Design', 'Engineer', 'Life/Science', 'Marketing']
		
		if params[:type] == 'acct_finance'
			@vacancies = Vacancy.where(:vacancytype_id => 1).order(:created_at => 'DESC').limit(10)
		elsif params[:type] == 'dev'
			@vacancies = Vacancy.where(:vacancytype_id => 2).order(:created_at => 'DESC').limit(10)
		elsif params[:type] == 'design'
			@vacancies = Vacancy.where(:vacancytype_id => 3).order(:created_at => 'DESC').limit(10)
		elsif params[:type] == 'engineer'
			@vacancies = Vacancy.where(:vacancytype_id => 4).order(:created_at => 'DESC').limit(10)
		elsif params[:type] == 'life_science'
			@vacancies = Vacancy.where(:vacancytype_id => 5).order(:created_at => 'DESC').limit(10)
		elsif params[:type] == 'marketing'
			@vacancies = Vacancy.where(:vacancytype_id => 6).order(:created_at => 'DESC').limit(10)
		else
			@vacancies = Vacancy.order(:created_at => 'DESC').limit(10)
		end

		render :layout => 'page'
	end

	def new
		@page_title = 'New vacancy'
		@vacancy = Vacancy.new

		render :layout => 'dashboard'
	end

	def create
		@vacancy = Vacancy.new(vacancy_params)

		respond_to do |format|
			if @vacancy.save
				format.html { redirect_to dashboard_vacancies_path, notice: 'Vacancy was successfully created.' }
				format.json { render :vacancies, status: :created }
			else
				format.html { render :action => 'new', :layout => 'dashboard' }
				format.json { render json: @vacancy.errors, status: :unprocessable_entity }
			end
		end
	end

	def edit
		@page_title = 'Edit vacancy'
		@vacancy = Vacancy.find(params[:id])

		render :layout => 'dashboard'
	end

	def update
		@vacancy = Vacancy.find(params[:id])

		respond_to do |format|
			if @vacancy.update(vacancy_params)
				format.html { redirect_to dashboard_vacancies_path, notice: 'Vacancy was successfully updated.' }
				format.json { render :vacancies, status: :ok }
			else
				format.html { render :action => 'edit', :layout => 'dashboard' }
				format.json { render json: @vacancy.errors, status: :unprocessable_entity }
			end
		end
	end

	def delete
		vacancy = Vacancy.find(params[:id])
	end

	def destroy
		vacancy = Vacancy.find(params[:id])

		respond_to do |format|
			if vacancy.destroy
				format.html { redirect_to dashboard_vacancies_path, :notice => 'Vacancy was successfully deleted.' }
				format.json { render :json => { :result => true } }
			else
				format.html { render :action => "vacancies", :layout => 'dashboard' }
				format.json { render json: vacancy.errors, status: :unprocessable_entity }
			end
		end
	end

	private
		def vacancy_params
			params.require(:vacancy).permit(:vacancy_company_name, :vacancy_title, :vacancy_description, :vacancy_instructions, :vacancy_url, :vacancy_salary, :vacancy_company_email, :vacancy_company_logo, :vacancy_company_url, :vacancy_status, :tag_list, :vacancytype_id)
		end

end
