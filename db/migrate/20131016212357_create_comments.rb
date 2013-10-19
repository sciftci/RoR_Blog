# -*- encoding : utf-8 -*-
class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.string :email
      t.string :website
      t.text :comment
      t.integer :post_id
      t.integer :status

      t.timestamps
    end
  end
end
