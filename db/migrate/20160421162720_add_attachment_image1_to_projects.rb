class AddAttachmentImage1ToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.attachment :image1
    end
  end

  def self.down
    remove_attachment :projects, :image1
  end
end
