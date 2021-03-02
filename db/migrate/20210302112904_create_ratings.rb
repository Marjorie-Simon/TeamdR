class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.references :daily_status, null: false, foreign_key: true
      t.integer :value_stars

      t.timestamps
    end
  end
end
