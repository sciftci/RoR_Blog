# -*- encoding : utf-8 -*-
class Categories < ActiveRecord::Base
  attr_accessible :title
  has_many :post
  validates_presence_of :title

  def slug
    title.gsub! /['`]/,""

    # @ --> at, and & --> and
    title.gsub! /\s*@\s*/, " at "
    title.gsub! /\s*&\s*/, " and "
    title.downcase.gsub! /\s*[^A-Za-z0-9\.\-]\s*/, '_'


  end

  def to_param
    "#{id}/#{slug}"
  end


end
