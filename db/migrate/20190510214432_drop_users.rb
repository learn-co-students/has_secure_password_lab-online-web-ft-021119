class DropUsers < ActiveRecord::Migration[5.0]
  def change
    drop_table :users do |t|
      t.string :name
      t.string :password_digest
      t.timestamps null: false
    end
  end
end
