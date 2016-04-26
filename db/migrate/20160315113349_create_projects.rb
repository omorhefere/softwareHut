class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_number
      t.string :priority_duration
      t.string :project_title
      t.string :aims
      t.string :why_important
      t.string :would_do_project
      t.string :funding
      t.string :time_scale
      t.string :benefits
      t.string :methodology
      t.string :stage
      t.string :volunteers

      t.timestamps null: false
    end
  end
end
