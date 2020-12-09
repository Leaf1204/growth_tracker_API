class AddForeignKeyToMilestones < ActiveRecord::Migration[6.0]
  def change
    add_column :milestones, :child_id, :integer
  end
end
