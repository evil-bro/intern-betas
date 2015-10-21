class Candidate < ActiveRecord::Base
	validates :candidate_name, :presence => true
	validates :candidate_email, :presence => true
	validates :vacancy_id, :presence => true

	belongs_to :vacancy
end
