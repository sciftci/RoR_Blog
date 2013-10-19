# -*- encoding : utf-8 -*-
class Api::PostController < ApplicationController
  # To change this template use File | Settings | File Templates.

  http_basic_authenticate_with :name => "username", :password => "password"

  skip_before_filter :authenticate_user!

  before_filter :fetch_post, :except => [:index, :create]

  def fetch_post
    @post = Post.find_by_id(params[:id])
  end

  def index
    @posts  = Post.all
    respond_to do |format|
      format.json { render json: @posts }
      format.xml { render xml: @posts}
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @post }
      format.xml { render xml: @post }
    end
  end

  def create
    @post = Post.new(params[:post])
    respond_to do |format|
      if @post.save
        format.json { render json: @post, status: :created }
        format.xml { render xml: @post, status: :created }
      else
        format.json { render json: @post.errors, status: :unprocessable_entity }
        format.xml { render xml: @post.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.json { head :no_content, status: :ok }
        format.xml { head :no_content, status: :ok }
      else
        format.json { render json: @post.errors, status: :unprocessable_entity }
        format.xml { render xml: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @post.destroy
        format.json { head :no_content, status: :ok}
        format.xml { head :no_content, status: :ok}
      else
        format.json { render json: @post.errors, status: :unprocessable_entity }
        format.xml { render xml: @post.errors, status: :unprocessable_entity }
      end
    end
  end

end
