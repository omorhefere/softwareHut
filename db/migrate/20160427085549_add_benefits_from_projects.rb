class AddBenefitsFromProjects < ActiveRecord::Migration
  def change
    add_column :projects, :benefits, :string
    add_column :projects, :, :string
  end
end
