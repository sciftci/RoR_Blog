# -*- encoding : utf-8 -*-
class AuthorController < ApplicationController
  include UserHelper
  # To change this template use File | Settings | File Templates.
  before_filter :check_admin_site, :except => [:show, :profile]

  def show
    if params[:username].nil?
      redirect_to "/"
    else
      @user_id = username_to_user_id(params[:username])
      @posts = Post.where("author='#{@user_id}'").order("id DESC")
      @admin = Admins.find_by_username(params[:username])
      respond_to do |format|
        format.html
      end
    end
  end

  def my_posts
    if session[:user_id].nil?
      flash[:status] = FALSE
      flash[:notice] = "#{t :txt_admin_logged_please}"
      redirect_to "/"
    else
      @posts = Post.where("author='#{session[:user_id]}'").order("id DESC")
      @admin = Admins.find(session[:user_id])
      respond_to do |format|
        format.html
      end
    end
  end

  def profile
    if session[:user_id].nil?
      flash[:status] = FALSE
      flash[:notice] = "#{t :txt_admin_logged_please}"
      redirect_to "/"
    else
      @profile = Admins.find(session[:user_id])
      respond_to do |format|
        format.html
      end
    end
  end

  def profile_update
    if session[:user_id].nil?
      redirect_to "/"
    else
      @profile = Admins.find(session[:user_id])
=begin
      @profile.password = @old_password
      @profile.name = params[:profile][:name]
      @profile.about = params[:profile][:about]
      @profile.email = params[:profile][:email]
      @profile.website = params[:profile][:website]
      @profile.twitter = params[:profile][:twitter]
      @profile.facebook = params[:profile][:facebook]

=end

      if @profile.update_attributes(params[:profile])

        flash[:status] = TRUE
        flash[:notice] = "#{t :txt_profile_updated_ok}"

      else
        flash[:status] = FALSE

        if @profile.errors.full_messages > 0
          flash[:notice] = @profile.errors.full_messages
        else
          flash[:notice] = "#{txt_profile_updated_error}"
        end
      end


      redirect_to "/profile/update"
    end

  end

end
