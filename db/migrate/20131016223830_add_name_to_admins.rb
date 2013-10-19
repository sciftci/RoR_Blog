# -*- encoding : utf-8 -*-
class AddNameToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :name, :string
    add_column :admins, :about, :text
    add_column :admins, :image, :string
  end
end
