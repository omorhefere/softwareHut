class RemoveBenifitsFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :benifits, :string
    remove_column :projects, :, :string
  end
end
