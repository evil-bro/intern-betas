class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string :vacancy_company_name
      t.string :vacancy_title
      t.text :vacancy_description
      t.text :vacancy_instructions
      t.string :vacancy_url
      t.string :vacancy_salary
      t.string :vacancy_company_email
      t.string :vacancy_company_logo
      t.string :vacancy_company_url

      t.timestamps null: false
    end
  end
end
