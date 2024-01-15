class CommentsController < ApplicationController

    def create
      @prototype = Prototype.find_by(params[:prototype_id])
      @comment = @prototype.comments.build(comment_params.merge(user_id: current_user.id))

      if @comment.save
        redirect_to prototype_path(@prototype)
      else
        render "prototypes/show"
      end
    end

    private

    def comment_params
        params.require(:comment).permit(:content)
    end
end
