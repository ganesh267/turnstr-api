module Comments
  extend ActiveSupport::Concern

  included do
    before_action :set_comment, only: [:show, :destroy]
  end

  def index
    comments = @comments.page current_page
    render_success data: {
        comments: ActiveModel::Serializer::CollectionSerializer.new(comments, serializer: CommentsSerializer),
        total_pages: comments.total_pages,
        current_page: comments.current_page,
        next_page: comments.next_page,
        prev_page: comments.prev_page,
        first_page: comments.first_page?,
        last_page: comments.last_page?
    }
  end

  def show
    render json: {success: true, data: { comment: CommentsSerializer.new(@comment) }}
  end


 

  
  def destroy
    if @comment.destroy
      render json: {success: true, message: 'Comment deleted successfully', data: { comment: CommentsSerializer.new(@comment) }}
    else
      render_unprocessable_entity message: comment.errors.full_messages.join(', ')
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = @comments.find(params[:id])
    end
end
