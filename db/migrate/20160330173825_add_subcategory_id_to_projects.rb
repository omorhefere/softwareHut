class AddSubcategoryIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :subcategory_id, :integer
  end
end
