# -*- encoding : utf-8 -*-
class Admin::CommentsController < ApplicationController
  # To change this template use File | Settings | File Templates.
  def index
    @comments_approved = Comment.where("status='1'")
    @comments_not_approved = Comment.where("status='0'")
    render :layout => 'admin'
  end

  def pro
    if params[:pro].present?
      case params[:pro]

        when 'approved'
          if params[:id].nil?
            flash[:status] = FALSE
            flash[:notice] = "#{t :txt_parameter_error}"
          else
            @comment = Comment.find(params[:id])
            @comment.status='1'
            if @comment.save
              flash[:status] = TRUE
              flash[:notice] = "#{t :txt_comment_approved}"
            else
              flash[:status] = FALSE
              flash[:notice] = "#{t :txt_unknown_error}"
            end
          end

        when 'unapproved'
          if params[:id].nil?
            flash[:status] = FALSE
            flash[:notice] = "#{t :txt_parameter_error}"
          else
            @comment = Comment.find(params[:id])
            @comment.status='NULL'
            if @comment.save
              flash[:status] = TRUE
              flash[:notice] = "#{t :txt_comment_unapproved}"
            else
              flash[:status] = FALSE
              flash[:notice] = "#{t :txt_unknown_error}"
            end
          end


        when 'delete'
          if params[:id].nil?
            flash[:status] = FALSE
            flash[:notice] = "#{t :txt_parameter_error}"
          else
            if Comment.destroy(params[:id])
              flash[:status] = TRUE
              flash[:notice] = "#{t :txt_comment_deleted}"
            else
              flash[:status] = FALSE
              flash[:notice] = "#{t :txt_unknown_error}"
            end
          end
      end
    end
    redirect_to "/admin/comments"
  end
end
