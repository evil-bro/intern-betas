class CreateTagsVacancies < ActiveRecord::Migration
	def self.up
		create_table :tags_vacancies, :id => false do |t|
			t.references :tag
			t.references :vacancy
		end
		add_index :tags_vacancies, [:tag_id, :vacancy_id]
		add_index :tags_vacancies, :vacancy_id
	end

	def self.down
		drop_table :tags_vacancies
	end
end
