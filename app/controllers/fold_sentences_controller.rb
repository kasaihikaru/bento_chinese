class FoldSentencesController < ApplicationController
  def create
    FoldSentence.create(create_params)
  end

  def destroy
    fold_sentence = FoldSentence.find(params[:id])
    fold_sentence.destroy
    @sentence = Sentence.includes(:user).find(params[:sentence_id])
  end

  private
  def create_params
    params.permit(:sentence_id, :fold_id)
  end
end
