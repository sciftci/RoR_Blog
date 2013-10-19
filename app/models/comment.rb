# -*- encoding : utf-8 -*-
class Comment < ActiveRecord::Base
  attr_accessible :comment, :email, :name, :status, :website, :content_id

  validates_presence_of :comment, :email, :name, :content_id

end
