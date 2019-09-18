class AddDefaultsToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :frequent, :boolean, default: false
    add_column :tasks, :finished, :boolean, default: false
    add_column :tasks, :priority, :boolean, default: false
    add_column :tasks, :active, :boolean, default: false
  end
end
