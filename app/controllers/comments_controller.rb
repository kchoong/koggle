class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  # POST /comments or /comments.json
  def create
    @comment = Comment.new(comment_params)

    if params[:worker_id] then @entity = Worker.find(params[:worker_id])
    elsif params[:office_id] then @entity = Office.find(params[:office_id])
    elsif params[:shift_id] then @entity = Shift.find(params[:shift_id])
    elsif params[:vacation_id] then @entity = Vacation.find(params[:vacation_id])
    else raise t("crud.controller.error.no_entity", name: Comment.model_name.human)
    end

    @comment = Comment.new(comment_params.merge(commentable: @entity))

    if @comment.save
      redirect_to @entity, success: t("crud.controller.success.created", name: Comment.model_name.human)
    else
      redirect_to @entity, notice: t("crud.controller.error.created", name: Comment.model_name.human)
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
      params.require(:comment).permit(:author, :text, :commentable_id, :commentable_type)
    end
end
