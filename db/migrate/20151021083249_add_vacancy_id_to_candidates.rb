class AddVacancyIdToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :vacancy_id, :integer
  end
end
