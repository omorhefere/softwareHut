class AddAttachmentImage3ToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.attachment :image3
    end
  end

  def self.down
    remove_attachment :projects, :image3
  end
end
