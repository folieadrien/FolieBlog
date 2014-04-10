class AddTitleToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :title, :string, after: :locale
  end

  def self.down
    remove_column :pages, :title
  end
end
