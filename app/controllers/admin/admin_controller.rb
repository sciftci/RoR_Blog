# -*- encoding : utf-8 -*-
class Admin::AdminController < ApplicationController
  # To change this template use File | Settings | File Templates.

  before_filter :check_admin

  def index
    @posts = Post.order("id desc")
    render :layout => 'admin'
  end


end
