class CreateInternusrsTags < ActiveRecord::Migration
	def self.up
		create_table :internusrs_tags, :id => false do |t|
			t.references :internusr
			t.references :tag
		end
		add_index :internusrs_tags, [:internusr_id, :tag_id]
		add_index :internusrs_tags, :internusr_id
	end

	def self.down
		drop_table :internusrs_tags
	end
end