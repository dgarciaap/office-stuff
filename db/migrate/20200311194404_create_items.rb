class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :category, null: false
      t.string :status, default: "Open"

      t.timestamps
    end
  end
end
