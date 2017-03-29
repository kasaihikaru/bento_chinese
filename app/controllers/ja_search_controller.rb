class JaSearchController < ApplicationController
  def index
    @sentences = Sentence.where('ja LIKE(?)', "%#{params[:keyword]}%").order("created_at DESC").page(params[:page]).per(20)
    @num = Sentence.count
    if user_signed_in?
      @myfolds = current_user.folds
    end
  end
end
