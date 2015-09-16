class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name , :string
    add_column :users, :gender, :integer
    add_column :users, :dob, :date
    add_column :users, :profession, :string
    add_column :users, :provider, :string
    add_column :users, :uid, :string
  end
end
