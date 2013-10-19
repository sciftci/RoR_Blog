# -*- encoding : utf-8 -*-
module CategoriesHelper

  def IdToTitle(id)
    @category = Categories.find(id)
    return @category.title
  end

  def CountPost(id)
    return Post.where("categories_id='#{id}'").count
  end

  def slugtitle(title)
    title.gsub! /['`]/,""

    # @ --> at, and & --> and
    title.gsub! /\s*@\s*/, " at "
    title.gsub! /\s*&\s*/, " and "
    title.downcase.gsub! /\s*[^A-Za-z0-9\.\-]\s*/, '_'
  end

end

