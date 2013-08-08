class AddColsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :project_name, :string
    add_column :projects, :project_description, :text
    add_column :projects, :project_category, :string
    add_column :projects, :project_special_requests, :text
    add_column :projects, :project_budget, :integer
    add_column :projects, :project_budget_explanation, :text
    add_column :projects, :project_start, :string
    add_column :projects, :project_git, :string
  end
end
