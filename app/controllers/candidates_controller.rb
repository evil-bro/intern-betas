class CandidatesController < ApplicationController
	def index
	end

	def show
	end

	def new
	end

	def create
		candidate = Candidate.new(candidate_params)

		respond_to do |format|
			if candidate.save
				format.json { head :no_content }
			else
				errors = candidate.errors.full_messages
				alert_text = '<ul class="error-response">'
				alert_text = alert_text + errors.collect { |error| '<li>' + error + '</li>' }.join("\n")
				alert_text = alert_text + '</ul>'
				
				format.json { render json: alert_text, status: :unprocessable_entity }
			end
		end
	end

	def edit
	end

	def update
	end

	def delete
	end

	def destroy
	end

	private
		def candidate_params
			params.require(:candidate).permit(:candidate_name, :candidate_email, :candidate_phone, :candidate_about, :vacancy_id)
		end
end
