# -*- encoding : utf-8 -*-
class AddWebsiteToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :website, :string
  end
end
