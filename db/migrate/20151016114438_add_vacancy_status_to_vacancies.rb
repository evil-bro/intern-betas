class AddVacancyStatusToVacancies < ActiveRecord::Migration
  def change
    add_column :vacancies, :vacancy_status, :boolean
  end
end
