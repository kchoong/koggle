class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  # POST /comments or /comments.json
  def create
    if params[:user_id] then @entity = User.find(params[:user_id])
    elsif params[:group_id] then @entity = Group.find(params[:group_id])
    else raise "Nothing to comment..."
    end

    @comment = Comment.new(comment_params.merge(commentable: @entity))

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @entity, success: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to @entity, danger: "Comment was not created." }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:name, :text)
    end
end
