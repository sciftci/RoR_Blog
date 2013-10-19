# -*- encoding : utf-8 -*-
class Admin::CategoryController < ApplicationController
  # To change this template use File | Settings | File Templates.

  include CategoriesHelper
  include ApplicationHelper


  before_filter :check_admin

  def index
    @categories = Categories.order("id desc")
    render :layout => 'admin'
  end

  def new
    @category = Categories.new
    render :layout => 'admin'
  end

  def edit
    @category = Categories.find(params[:id])

    render :layout => 'admin'
  end

  def do_edit

    @category = Categories.find(params[:id])
    @category.title = params[:category][:title]
    if @category.save
      flash[:status] = TRUE
      flash[:notice] = "#{t :txt_category_edited}"
      redirect_to "/admin/category/"
    else
      flash[:status] = FALSE
      if @category.errors.full_messages.length > 0
        flash[:notice] = @category.errors.full_messages
      else
        flash[:notice] = "#{t :txt_category_not_edited}"
      end
      redirect_to "/admin/category/edit/#{params[:id]}"
    end


  end


  def create

    @category = Categories.new
    @category.title = params[:category][:title]
    if @category.save
      flash[:status] = TRUE
      flash[:notice] = "#{t :txt_category_created}"
      redirect_to "/admin/category/"
    else
      flash[:status] = FALSE
      flash[:notice] = @category.errors.full_messages
      redirect_to "/admin/category/new"
    end


  end

  def delete
    @delete = Categories.destroy(params[:id])
    if @delete
      flash[:status] = TRUE
      flash[:notice] = "#{t :txt_category_deleted}"
    else
      flash[:status] = FALSE
      flash[:notice] = "#{t :txt_category_not_deleted}"
    end

    redirect_to "/admin/category/"

  end


  def render_layout
    render :layout => 'admin'
  end


end
