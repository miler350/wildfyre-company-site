class UploadsController < ApplicationController
   before_filter :load_uploadable
  
  def index
    @uploadable = Project.find(params[:project_id])
    @uploads = @uploadable.uploads
  end

  def create
    @upload = @uploadable.uploads.new(upload_params)
    @upload.save
    @upload.update_attributes(user_id: current_user.id)

    redirect_to project_path(@upload.uploadable)
  end
  
  private
  
  def load_uploadable
    resource, id = request.path.split('/')[1,2]
    @uploadable = resource.singularize.classify.constantize.find(id)
  end
  
  def upload_params
    params.require(:upload).permit(:name, :attachment, :user_id, :project_id)
  end
end


