class CommentsController < ApplicationController
	before_action :load_link

	def create
		@comment = @link.comments.new(comment_params)
		@comment.user = current_user
		if @comment.save
			redirect_to @link
		else
			redirect_to @link, alert: 'Unable to add comment'
		end
	end

	def destroy
		@comment = @link.comments.find(params[:id])
		@comment.destroy
		redirect_to @link, notice: 'Comment deleted'
	end

	private
		def load_link
			@link = Link.find(params[:link_id])
		end

		def comment_params
			params.require(:comment).permit(:link_id, :body, :user_id)
		end
end
