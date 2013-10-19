# -*- encoding : utf-8 -*-
class PostController < ApplicationController

  include PostHelper
  include HomeHelper
  require 'digest/md5'

  def index

  end


  def add_post
    @categories = Categories.all
  end


  def show
    @post = Post.find(params[:id])
    @comments = Comment.where("content_id = '#{params[:id]}' and status='1'").order("id desc")
    @count_comments = @comments.count
    @admin = Admins.find(@post.author)

    respond_to do |format|
      format.html
      format.json { render json: @post}
    end

  end

  def add_comment
    @comment = Comment.new
    @comment.name = params[:comment][:name]
    @comment.email = params[:comment][:email]
    @comment.website = params[:comment][:website]
    @comment.comment = params[:comment][:comment_body]
    @comment.content_id = params[:comment][:content_id]
    @comment.status = '0'

    if @comment.save
      flash[:status] = true
      flash[:notice] = "#{t :txt_comment_ok}"
      # Add Session

      session[:comment_name] = params[:comment][:name]
      session[:comment_email] = params[:comment][:email]
      session[:comment_website] = params[:comment][:website]
      redirect_to "#{post_path(get_post(params[:comment][:content_id]))}#comment-#{@comment.id}"
    else
      flash[:status] = false
      if @comment.errors.full_messages.length > 0
        flash[:notice] = @comment.errors.full_messages
      else
        flash[:notice] = "#{t :txt_comment_error}"
      end
      redirect_to "#{post_path(get_post(params[:comment][:content_id]))}#reports"
    end





  end

  def search
    @posts = Post.joins(:categories).where("categories.title like '%#{params[:search][:keyword]}%' or
    posts.title like '%#{params[:search][:keyword]}%' or posts.body like '%#{params[:search][:keyword]}%'")
    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end


  def search_tag
    @posts = Post.where("tags like '%#{params[:tag]}%'")
    respond_to do |format|
      format.html
      format.json { render json: @post }
    end
  end

  def create
    @post = Post.new()
    @post.title = params[:post][:tite]
    @post.body = params[:post][:body]
    @post.categories_id = params[:post][:categories_id]
    if @post.save
      flash[:status] = TRUE
      flash[:notice] = "#{t :txt_post_created}"

    else
      flash[:status] = FALSE
      flash[:notice] = @post.errors.full_messages
    end

    redirect_to add_post_path
  end

  def tag

    @post = Post.where("tags like '%#{params[:tag]}%'")
    respond_to do |format|
      format.html
      format.json { render json: @post }
    end

  end

end
