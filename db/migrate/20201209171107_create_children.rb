class CreateChildren < ActiveRecord::Migration[6.0]
  def change
    create_table :children do |t|
      t.string :name
      t.date :dob
      t.string :gender
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
