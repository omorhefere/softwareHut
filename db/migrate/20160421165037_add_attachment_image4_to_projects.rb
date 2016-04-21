class AddAttachmentImage4ToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.attachment :image4
    end
  end

  def self.down
    remove_attachment :projects, :image4
  end
end
