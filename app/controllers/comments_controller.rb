class CommentsController < ApplicationController

    def create
      @prototype = Prototype.find(params[:prototype_id])
      @comment = @prototype.comments.create(comment_params.merge(user_id: current_user.id, prototype_id: @prototype.id))
      puts "Params: #{params.inspect}" # デバッグ用のログ

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
