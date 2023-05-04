class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :created_at, :timestamp
  end
end
