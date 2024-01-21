class CommentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

    def create
      @prototype = Prototype.find(params[:prototype_id])
      puts "Prototype found: #{@prototype.inspect}" # デバッグプリントを追加
      @comment = @prototype.comments.build(comment_params.merge(user_id: current_user.id))
      

      if @comment.save
        redirect_to prototype_path(@prototype)
      else
        puts "Comment not saved. Errors: #{@comment.errors.full_messages}" # エラー発生時にエラーメッセージを出力するデバッグプリントを追加
        render "prototypes/show"
      end
    end

    private

    def comment_params
        params.require(:comment).permit(:content)
    end

    def handle_record_not_found
      puts "Prototype not found! Params: #{params.inspect}"
      # 他に必要な処理があればここで追加
      render status: 404, plain: 'Prototype not found!'
    end
end
