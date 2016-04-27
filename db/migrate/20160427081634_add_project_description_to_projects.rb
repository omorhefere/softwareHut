class AddProjectDescriptionToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :project_description, :string
  end
end
