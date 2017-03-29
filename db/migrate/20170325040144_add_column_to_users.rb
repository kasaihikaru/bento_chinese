class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string
    add_column :users, :introduction, :text
    add_column :users, :blog, :text
  end
end