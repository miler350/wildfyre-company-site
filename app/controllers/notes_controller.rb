class NotesController < ApplicationController

  def index
    @project = Project.find(params[:project_id])
    @notes = @project.notes
    @note = Note.new
    @number = 100
    
  end
  
  def create
    @project = Project.find(params[:project_id])
    @note = @project.notes.build(note_params)
    if @note.save
      @note.update(user_id: current_user.id)
      flash[:notice] = "Note has been created."
      redirect_to project_notes_path
    else
      flash[:notice] = "Note has not been created."
      render @project.notes
    end
  end
  
  def show
     @project = Project.find(params[:project_id])
     @note = @project.notes.find(params[:id])
     
     
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    @project = Project.find(params[:project_id])
    @note = @project.notes.find(params[:id]).destroy
    redirect_to project_notes_path
   flash[:notice]= "Note has been deleted."
    
  end
  
  private
  
  def note_params
  params.require(:note).permit(:content)
  end
  
end
