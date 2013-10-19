# -*- encoding : utf-8 -*-
class Post < ActiveRecord::Base
  attr_accessible :body, :title, :categories_id

  belongs_to :categories

  validates_presence_of :body, :title, :categories_id, :author, :summary

  def slug(title)


    title.downcase.gsub("Ü","u").gsub("Ğ","g").gsub("Ş","s").gsub("İ","i").gsub("Ç","c").gsub("Ç","c").gsub("Ö","o").gsub("ü","u").gsub("ş","s").gsub("ç","c").gsub("ğ","g").gsub("İ","i").gsub("ö","o").strip.downcase.gsub(/[\s\.\/\\]/, '-').gsub(/[^\w-]/, '').gsub(/[-_]{2,}/, '-').gsub(/^[-_]/, '').gsub(/[-_]$/, '')
    #title.strip.downcase.gsub(/[\s\.\/\\]/, '-').gsub(/[^\w-]/, '').gsub(/[-_]{2,}/, '-').gsub(/^[-_]/, '').gsub(/[-_]$/, '')
=begin    
   title.gsub! /['`]/,""

    # @ --> at, and & --> and
    title.gsub! /\s*@\s*/, " at "
    title.gsub! /\s*&\s*/, " and "
    title.downcase.gsub! /\s*[^A-Za-z0-9\.\-]\s*/, '_'
=end
  end

  def to_param
    "#{id}/#{slug(title)}"
  end

end
