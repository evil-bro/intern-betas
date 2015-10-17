class CreateInternusrs < ActiveRecord::Migration
  def change
    create_table :internusrs do |t|
      t.string :intern_name
      t.text :intern_about
      t.string :intern_email
      t.string :intern_phone
      t.string :intern_salary

      t.timestamps null: false
    end
  end
end
