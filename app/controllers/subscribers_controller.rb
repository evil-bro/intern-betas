class SubscribersController < ApplicationController
	def index
		@page_title = 'Subscribers'
		@subscribers = Subscriber.order(:created_at => 'desc').paginate(:page => params[:page], :per_page => 10)

		render :layout => 'dashboard'
	end

	def create
		subscriber = Subscriber.new(subscriber_params)

		respond_to do |format|
			if subscriber.save
				format.json { head :no_content }
			else
				errors = subscriber.errors.full_messages
				alert_text = '<ul class="error-response">'
				alert_text = alert_text + errors.collect { |error| '<li>' + error + '</li>' }.join("\n")
				alert_text = alert_text + '</ul>'
				
				format.json { render json: alert_text, status: :unprocessable_entity }
			end
		end
	end

	def edit
		@page_title = 'Edit subscriber'
		@subscriber = Subscriber.find(params[:id])

		render :layout => 'dashboard'
	end

	def update
		@subscriber = Subscriber.find(params[:id])

		respond_to do |format|
			if @subscriber.update(subscriber_params)
				format.html { redirect_to dashboard_subscribers_path, notice: 'Subscriber was successfully updated.' }
				format.json { render :subscriber, status: :ok }
			else
				format.html { render :action => 'edit', :layout => 'dashboard' }
				format.json { render json: @subscriber.errors, status: :unprocessable_entity }
			end
		end
	end

	def delete
		subscriber = Subscriber.find(params[:id])
	end

	def destroy
		subscriber = Subscriber.find(params[:id])

		respond_to do |format|
			if subscriber.destroy
				format.html { redirect_to dashboard_subscribers_path, :notice => 'Subscriber was successfully deleted.' }
				format.json { render :json => { :result => true } }
			else
				format.html { render :action => "index", :layout => 'dashboard' }
				format.json { render json: subscriber.errors, status: :unprocessable_entity }
			end
		end
	end

	private
		def subscriber_params
			params.require(:subscriber).permit(:subscriber_name, :subscriber_email)
		end

end
