class CreateMilestones < ActiveRecord::Migration[6.0]
  def change
    create_table :milestones do |t|
      t.date :dateOf
      t.decimal :weight
      t.text :note

      t.timestamps
    end
  end
end
