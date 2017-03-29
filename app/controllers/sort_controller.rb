class SortController < ApplicationController
  def index
    @sentences = Sentence.includes(:user).order("likes_count DESC").page(params[:page]).per(20)
    @num = Sentence.count
    if user_signed_in?
      @myfolds = current_user.folds
    end
  end
end
