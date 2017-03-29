require 'ruby-pinyin'
class SentencesController < ApplicationController
  def index
    @sentences = Sentence.includes(:user).order("created_at DESC").page(params[:page]).per(20)
    @num = Sentence.count
    if user_signed_in?
      @myfolds = current_user.folds
    end
  end

  def edit
    @sentence = Sentence.new
    @sentence.words.build

    @originalSen = Sentence.find(params[:id])
    @user = @originalSen.user
  end

  def create
    newsenten = Sentence.create(sentence_params)
    a = word_params
    a.each do |x|
      Word.create("ja"=>x[:ja], "ch"=>x[:ch], "pin"=>x[:pin], "sentence_id"=>x[:sentence_id])
    end
    Like.create(like_params)
    FoldSentence.create(fold_sentence_params)
    redirect_to fold_path(params[:sentence][:fold_sentence][:fold_id]) and return
  end


  private
  def sentence_params
    pin = PinYin.of_string(params[:sentence][:ch], :unicode)
    if pin.count == 1
      pinyin = pin.first
    else
      pinyin = ""
      pin.each do |p|
        pinyin += "#{p} "
      end
    end
    params.require(:sentence).permit(:ja, :ch).merge(user_id: current_user.id, pin: pinyin)
  end

  def word_params
    arrayedwords = []
    id = Sentence.last.id
    params[:sentence][:words_attributes].each do |key,value|
      if value["ja"].present? && value["ch"].present?
        value[:sentence_id] = id
        pin = PinYin.of_string(value[:ch], :unicode)
        if pin.count == 1
          pinyin = pin.first
        else
          pinyin = ""
          pin.each do |p|
            pinyin += "#{p} "
          end
        end
        value[:pin] = pinyin
        arrayedwords << value
      else
        next
      end
    end
    return arrayedwords
  end

  def like_params
    id = Sentence.last.id
    params.require(:sentence)[:like].permit(:user_id).merge(sentence_id: id)
  end

  def fold_sentence_params
    id = Sentence.last.id
    params.require(:sentence)[:fold_sentence].permit(:fold_id).merge(sentence_id: id)
  end
end
