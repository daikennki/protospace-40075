class CommentsController < ApplicationController
  def create
    @prototype = Prototype.find_by(id: params[:prototype_id])

    if @prototype
      @comment = @prototype.comments.build(comment_params.merge(user_id: current_user.id))

      if @comment.save
        redirect_to prototype_path(@prototype)
      else
        puts "Comment not saved. Errors: #{@comment.errors.full_messages}"
        render "prototypes/show"
      end
    else
      puts "Prototype not found! Params: #{params.inspect}"
      render "prototypes/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
