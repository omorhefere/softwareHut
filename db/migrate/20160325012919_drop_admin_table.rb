class DropAdminTable < ActiveRecord::Migration
  def up
    drop_table :Admins
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
