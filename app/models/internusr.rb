class Internusr < ActiveRecord::Base
	validates :intern_name, :presence => true
	validates :intern_email, :presence => true
	
	has_and_belongs_to_many :tags

	def tag_list
		self.tags.map { |t| t.tag_title }.join(", ")
	end

	def tag_list=(new_value)
		tag_names = new_value.split(/,\s+/)
		self.tags = tag_names.map { |tag| Tag.where('tag_title = ?', tag).first or Tag.create(:tag_title => tag) }
	end
end
