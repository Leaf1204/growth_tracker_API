class CreateWeights < ActiveRecord::Migration[6.0]
  def change
    create_table :weights do |t|
      t.date :dateOf
      t.decimal :value

      t.timestamps
    end
  end
end
