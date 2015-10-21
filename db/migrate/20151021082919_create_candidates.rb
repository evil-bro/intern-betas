class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :candidate_name
      t.string :candidate_email
      t.string :candidate_phone
      t.text :candidate_about

      t.timestamps null: false
    end
  end
end
