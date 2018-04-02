class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]

  # GET news/news_id/comments
  def index
    @new = New.find(params[:news_id])
    @comments = @new.comments.all

    render json: @comments
  end

  # GET /comments/1
  def show
    @new = New.find(params[:news_id])
    @comment = @new.comments.find(params[:id])
    render json: @comment
  end

  # POST /comments
  def create
    @new = New.find(params[:news_id])
    @comment = @new.comments.new(comment_params)

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    @new = New.find(params[:news_id])
    @comment = @new.comments.find(params[:id])

    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @new = New.find(params[:news_id])
    @comment = @new.comments.find(params[:id])
    @mostrar = @new.comments.find(params[:id])
    @comment.destroy
    render json: @mostrar
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:author, :comment, :news_id)
    end
end
