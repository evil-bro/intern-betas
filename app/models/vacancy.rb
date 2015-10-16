class Vacancy < ActiveRecord::Base
	validates :vacancy_company_name, :presence => true
	validates :vacancy_title, :presence => true
	validates :vacancy_description, :presence => true
	validates :vacancy_instructions, :presence => true
	validates :vacancy_company_url, :presence => true

	mount_uploader :vacancy_company_logo, CompanylogoUploader
end
