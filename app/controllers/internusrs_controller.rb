class InternusrsController < ApplicationController
	def index
	end

	def list
		@page_title = 'Interns'
		@interns = Internusr.order(:created_at => 'desc').paginate(:page => params[:page], :per_page => 10)

		render :layout => 'dashboard'
	end

	def why
		@page_title = 'Intern Betas | Interns'

		render :layout => 'page'
	end

	def new
		@page_title = 'New internship'
		@intern = Internusr.new

		render :layout => 'dashboard'
	end

	def create
		@intern = Internusr.new(intern_params)

		respond_to do |format|
			if @intern.save
				format.html { redirect_to dashboard_interns_path, notice: 'Internship was successfully created.' }
				format.json { render :interns, status: :created }
			else
				format.html { render :action => 'new', :layout => 'dashboard' }
				format.json { render json: @intern.errors, status: :unprocessable_entity }
			end
		end
	end

	def edit
		@page_title = 'Edit internship'
		@intern = Internusr.find(params[:id])

		render :layout => 'dashboard'
	end

	def update
		@intern = Internusr.find(params[:id])

		respond_to do |format|
			if @intern.update(intern_params)
				format.html { redirect_to dashboard_interns_path, notice: 'Internship was successfully updated.' }
				format.json { render :internusr, status: :ok }
			else
				format.html { render :action => 'edit', :layout => 'dashboard' }
				format.json { render json: @intern.errors, status: :unprocessable_entity }
			end
		end
	end

	def delete
		intern = Internusr.find(params[:id])
	end

	def destroy
		intern = Internusr.find(params[:id])

		respond_to do |format|
			if intern.destroy
				format.html { redirect_to dashboard_interns_path, :notice => 'Internship was successfully deleted.' }
				format.json { render :json => { :result => true } }
			else
				format.html { render :action => "list", :layout => 'dashboard' }
				format.json { render json: intern.errors, status: :unprocessable_entity }
			end
		end
	end

	private
		def intern_params
			params.require(:internusr).permit(:intern_name, :intern_about, :intern_email, :intern_phone, :intern_salary, :tag_list)
		end
end
