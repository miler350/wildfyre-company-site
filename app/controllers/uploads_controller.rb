class UploadsController < ApplicationController
  
  def index
    @project = Project.find(params[:project_id])
    @uploads = @project.uploads
  end

  def create
     @project = Project.find(params[:project_id])    #added
     @upload = @project.uploads.new(upload_params)
     if @upload.save
        @upload.update_attributes(user_id: current_user.id)
        redirect_to projects_path
     else
       flash[:notice] = "File has not been uploaded."
       redirect_to project_path(@project.uploads)
     end
  end
  
  private
  
  def upload_params
    params.require(:upload).permit(:name, :attachment, :user_id, :project_id)
  end
end


