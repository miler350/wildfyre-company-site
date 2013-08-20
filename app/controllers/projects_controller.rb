class ProjectsController < ApplicationController
  
  def index 
    @projects = current_user.projects
  end
  
  def new
    @project = current_user.projects.build
  end
  
  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      @project_id = @project.id
      @relationship = current_user.relationships.create!(user_id: current_user.id, project_id: @project_id)
      flash[:notice] = " #{@project.project_name}has been created."
      redirect_to projects_path
    else
      flash[:alert] = "Project has not been created."
      flash[:error] =@project.errors.full_messages
      render 'new'
    end
  end
  
  def show
    @project = current_user.projects.find(params[:id])
    @comment = Comment.new(user_id: current_user.id)
  end
  
  def edit
    @project = current_user.projects.find(params[:id])
  end
  
  def update
    @project = current_user.projects.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:notice] = "#{@project.project_name} been updated."
  		redirect_to projects_path
    else
      flash[:alert] = "Project has not been created."
      render 'edit'
    end
  end
  
  def destroy
    @project = current_user.projects.find(params[:id]).destroy
    redirect_to projects_path
   flash[:notice]= "#{@project.project_name} has been deleted."
  end
  
  private
  
  def project_params
    params.require(:project).permit(:project_name, :project_description, :project_category, :project_special_requests, :project_start_date, :project_end_date, :project_budget, :project_budget_explanation)
  end
  
  def relationships_params
    params.require(:project).permit(:user_id, :project_id)
  end
  
  
end
