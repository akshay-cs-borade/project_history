class AddAssignmentsToProjects < ActiveRecord::Migration[7.1]
  def change
    add_column :projects, :manager_id, :integer
    add_column :projects, :developer_id, :integer
  end
end
