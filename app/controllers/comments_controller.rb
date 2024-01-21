class CommentsController < ApplicationController

    def create
      @prototype = Prototype.find(params[:prototype_id])
      puts "Prototype found: #{@prototype.inspect}" # デバッグプリントを追加
      @comment = @prototype.comments.build(comment_params.merge(user_id: current_user.id, prototype_id: @prototype.id))
      

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
