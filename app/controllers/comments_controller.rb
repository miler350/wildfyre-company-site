class CommentsController < ApplicationController
  before_filter :load_commentable
  
  def index
    @commentable = Project.find(params[:project_id])
    @comments = @commentable.comments
  end
 
  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.save
    @comment.update_attributes(user_id: current_user.id)

    redirect_to project_path(@comment.commentable)
  end

  private
  
  def load_commentable
    resource, id = request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :commentable_id, :commentable_type)
  end
end
