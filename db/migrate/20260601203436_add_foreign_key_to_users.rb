class AddForeignKeyToUsers < ActiveRecord::Migration[8.1]
  def change
    add_reference :users, :resume, null: false, foreign_key: true
  end
end
