class AddImageRemoteUrlToProject < ActiveRecord::Migration
  def change
    add_column :projects, :image_remote_url, :string
  end
end
