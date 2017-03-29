

class FoldsController < ApplicationController
  def show
    @sentence = Sentence.new
    @sentence.words.build

    @current_fold = Fold.find(params[:id])
    user_id = @current_fold.user_id
    @user = User.find(user_id)

    usersentences = @current_fold.sentences.includes(:user).order("created_at DESC")
    sentences = []
    usersentences.each do |sentence|
      if sentence.likes.find_by(user_id: @user.id).present?
        sentences << sentence
      end
    end
    @sentences = Kaminari.paginate_array(sentences).page(params[:page]).per(20)


    @fold = Fold.new
    @folds = @user.folds
    if user_signed_in?
      @myfolds = current_user.folds
    end

    @fold_sentence = FoldSentence.new
  end

  def create
    a = Fold.create(create_params)
    redirect_to fold_path(a.id)
  end

  def update
    fold = Fold.find(params[:id])
    fold.update(update_params)
    redirect_to fold_path(fold.id)
  end

  private
  def create_params
    params.require(:fold).permit(:name).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:fold).permit(:name)
  end
end
