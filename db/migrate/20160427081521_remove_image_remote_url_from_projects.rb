class RemoveImageRemoteUrlFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :image_remote_url, :string
  end
end
