class AddVacancytypeIdToVacancies < ActiveRecord::Migration
  def change
    add_column :vacancies, :vacancytype_id, :integer
  end
end
