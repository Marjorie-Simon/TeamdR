class CreateDailyStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_statuses do |t|
      t.string :title
      t.date :date
      t.references :user, null: false, foreign_key: true
      t.string :daily_goal

      t.timestamps
    end
  end
end
