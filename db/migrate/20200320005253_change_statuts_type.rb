class ChangeStatutsType < ActiveRecord::Migration[6.0]
  def up
    change_column :items, :status, :integer, default: 0
  end

  def down
    change_column :items, :status, :integer
  end
end
