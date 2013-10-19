# -*- encoding : utf-8 -*-
class Admin::PostController < ApplicationController

  before_filter :check_admin

  def index

    @posts = Post.all
    render :layout => 'admin'

  end


  def new
    @post = Post.new
    @categories = Categories.all
    render :layout => 'admin'
  end

  def create
    @post = Post.new
    @post.title = params[:post][:title]
    @post.summary = params[:post][:summary]
    @post.body = params[:post][:body]
    @post.tags = params[:post][:tags]
    @post.categories_id = params[:post][:categories_id]
    @post.author = session[:user_id]
    @post.meta_keyword = params[:post][:meta_keyword]
    @post.meta_description = params[:post][:meta_description]
    if @post.save
      flash[:status] = true
      flash[:notice] = "#{t :txt_content_create_ok}"
      redirect_to "/admin"
    else
      flash[:status] = false
      if @post.errors.full_messages.length > 0
        flash[:notice] = @post.errors.full_messages
      else
        flash[:notice] = "#{t :txt_content_create_error}"
      end
      redirect_to "/admin/post/new"
    end
  end

  def edit
    @post = Post.find(params[:id])
    @categories = Categories.all
    render :layout => 'admin'
  end

  def delete
    if Post.destroy(params[:id])
      flash[:status] = TRUE
      flash[:notice] = "#{t :txt_deleted_ok}"
    else
      flash[:status] = FALSE
      flash[:notice] = "#{t :txt_deleted_error}"
    end

    redirect_to "/admin"

  end

  def edit_post
    @post = Post.find(params[:id])
    @post.title = params[:post][:title]
    @post.summary = params[:post][:summary]
    @post.body = params[:post][:body]
    @post.tags = params[:post][:tags]
    @post.categories_id = params[:post][:categories_id]
    @post.author = session[:user_id]
    @post.meta_keyword = params[:post][:meta_keyword]
    @post.meta_description = params[:post][:meta_description]
    if @post.save
      flash[:status] = true
      flash[:notice] = "#{t :txt_content_update_ok}"
      redirect_to "/admin"
    else
      flash[:status] = false

      if @post.errors.full_messages.length > 0
        flash[:notice] = @post.errors.full_messages
      else
        flash[:notice] = "#{t :txt_content_update_error}"
      end
      redirect_to "/admin/post/edit/#{params[:id]}"
    end
  end



end
