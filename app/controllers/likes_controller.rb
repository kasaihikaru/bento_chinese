class LikesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @likes = @user.likes
    sentences = []
    @likes.each do |like|
      sentence = like.sentence
      unless sentence.user_id == @user.id
      sentences << sentence
      end
    @fold = Fold.new
    @folds = @user.folds
    if user_signed_in?
      @myfolds = current_user.folds
    end

    @flag = 1
  end

    @sentences = Kaminari.paginate_array(sentences).page(params[:page]).per(20)
  end

  def create
    @like = Like.create(create_params)
    @sentence = Sentence.includes(:user).find(params[:sentence_id])
    @myfolds = current_user.folds
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    @sentence = Sentence.includes(:user).find(params[:sentence_id])
  end

  private
  def create_params
    params.permit(:sentence_id).merge(user_id: current_user.id)
  end
end
