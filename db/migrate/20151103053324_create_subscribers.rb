class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :subscriber_name
      t.string :subscriber_email

      t.timestamps null: false
    end
  end
end
