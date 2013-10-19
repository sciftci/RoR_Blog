# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base

  helper :all
  protect_from_forgery

  $total_posts = Post.all.length
  $all_categories = Categories.all


  before_filter :set_locale

  private
  def set_locale
    I18n.locale = :en
  end

  private
  def get_user
    return Admins.find_by_id(session[:user_id])
  end

  private
  def check_admin
    if session[:is_admin] != true
      flash[:status] = FALSE
      flash[:notice] = "#{t :txt_admin_logged_please}"
      redirect_to "/admin/login"
    end
  end

  private
  def check_admin_site
    if session[:is_admin] != true
      flash[:status] = FALSE
      flash[:notice] = "#{t :txt_admin_logged_please}"
      redirect_to "/"
    end
  end

end
