class AdminsController < ApplicationController

  before_filter :authenticate_admin!

  respond_to :json


  def edit_video
    if admin_signed_in? and current_admin.approved?
      @video = Video.find(params[:id])
      respond_to do |format|
        format.html   { render  :html => @video,:template => "videos/edit" }
      end
    end
  end

  def admins
    @deleted  = params[:deleted]
    @access = params[:access]
    if admin_signed_in? and current_admin.approved?
      @approved_admins = Admin.where(:approved => true).select{|i| i.id != current_admin.id}.sort_by{|i| i.created_at.to_i}
      @denied_admins   = Admin.where(:approved => false).sort_by{|i| i.created_at.to_i}
    else
      redirect_to "/admin/locked_out"
    end
  end

  def update
    if admin_signed_in? and current_admin.approved?
      @admin = Admin.find(params[:id])
      @admin.update_attributes(:approved => (!@admin.approved))
      redirect_to(admin_admins_path( :access => {:approved => true, :name => @admin.name}))
    else
      redirect_to "/admin/locked_out"
    end
  end

  def index
    if admin_signed_in? and current_admin.approved?
      @videos = Video.all.sort_by{|i| i.created_at.to_i}
      render :template => "admins/admin_sessions"
    else
      redirect_to "/admin/locked_out"
    end
  end

  def locked_out
    sign_out @admin
  end

  def exit
    sign_out @admin
    redirect_to "/"
  end

  def delete
    if admin_signed_in? and current_admin.approved?
      @admin = Admin.find(params[:id])
      name = @admin.name
      @admin.destroy
    else
      name = nil
    end
    redirect_to(admin_admins_path( :deleted => name))
  end
end


