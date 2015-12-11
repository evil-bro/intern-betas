class Vacancy < ActiveRecord::Base
	validates :vacancy_company_name, :presence => true
	validates :vacancy_title, :presence => true
	validates :vacancy_description, :presence => true
	validates :vacancy_instructions, :presence => true
	validates :vacancy_company_url, :presence => true
	validates :vacancytype_id, :presence => true
	validates :vacancy_url, :presence => true

	mount_uploader :vacancy_company_logo, CompanylogoUploader

	has_and_belongs_to_many :tags

	def tag_list
		self.tags.map { |t| t.tag_title }.join(", ")
	end

	def tag_list=(new_value)
		tag_names = new_value.split(/,\s+/)
		self.tags = tag_names.map { |tag| Tag.where('tag_title = ?', tag).first or Tag.create(:tag_title => tag) }
	end

end
