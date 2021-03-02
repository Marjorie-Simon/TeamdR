class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :content
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :invitee, null: false, foreign_key: false
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
