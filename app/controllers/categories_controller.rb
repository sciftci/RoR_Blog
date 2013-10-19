# -*- encoding : utf-8 -*-
class CategoriesController < ApplicationController
  def index
  end

  def show
    @posts = Post.where("categories_id='#{params[:id]}'").order("id DESC")
    @cat = Categories.find(params[:id])
    respond_to do |format|
      format.html
    end
  end
end
