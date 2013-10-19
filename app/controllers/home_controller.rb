# -*- encoding : utf-8 -*-
class HomeController < ApplicationController

  include CategoriesHelper
  include ApplicationHelper
  include HomeHelper

  def index
    @posts = Post.order("id DESC")
    respond_to do |format|
      format.html
    end
  end

  def api
    @posts = Post.order("id DESC")
    respond_to do |format|
      format.json { render json: @posts }
    end
  end

end
