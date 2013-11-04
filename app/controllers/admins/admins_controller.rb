class Admins::AdminsController < AdminsController

  def index
    @admins = Admin.find(:all, :conditions => ["id != ?", current_admin.id]).sort_by{|i| i.approved}
  end

  def update
    @admin = Admin.find(params[:id]).update_attributes(params[:admin])

    respond_to do |format|
      format.html { redirect_to admins_admins_url }
      format.json { head :no_content }
    end

  end

  def destroy
    @admin = Admin.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to admins_admins_url }
      format.json { head :no_content }
    end

  end

end


