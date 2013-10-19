# -*- encoding : utf-8 -*-
class AddTwitterToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :twitter, :string
    add_column :admins, :facebook, :string
  end
end
