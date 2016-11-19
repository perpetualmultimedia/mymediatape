class AddAdminFieldsToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :public, :boolean
    add_column :articles, :flag, :boolean
  end
end
