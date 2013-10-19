# -*- encoding : utf-8 -*-
class Admin::UserController < ApplicationController
  # To change this template use File | Settings | File Templates.

  def login
    render :layout => 'admin'
  end

  def logout
    reset_session
    redirect_to "/admin"
  end

  def logout_site
    reset_session
    redirect_to "/"
  end

  def profile
    @profile = Admins.find(session[:user_id])
    render :layout => 'admin'
  end


  def update_profile
    @profile = Admins.find(session[:user_id])
    @profile.name = params[:profile][:name]
    @profile.about = params[:profile][:about]
    @profile.email = params[:profile][:email]
    @profile.website = params[:profile][:website]
    @profile.twitter = params[:profile][:twitter]
    @profile.facebook = params[:profile][:facebook]


    if @profile.save

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


    redirect_to "/admin/user/profile"
  end

  def check_site_login
    @admin = Admins.validate_admin_login(params[:login][:username],params[:login  ][:password])

    if @admin.nil?

      flash[:status] = FALSE
      flash[:notice] = "#{t :txt_admin_user_failed}"

      redirect_to "/"

    else

      session[:is_admin] = true
      session[:username] = @admin.username
      session[:user_id]  = @admin.id
      session[:user] = @admin

      redirect_to "/"



    end
  end

  def check_user
      @admin = Admins.validate_admin_login(params[:admin][:username],params[:admin][:password])

      if @admin.nil?

        flash[:status] = FALSE
        flash[:notice] = "#{t :txt_admin_user_failed}"

        redirect_to "/admin/login"

      else

        session[:is_admin] = true
        session[:username] = @admin.username
        session[:user_id]  = @admin.id
        session[:user] = @admin

        redirect_to "/admin"



      end

  end

end
