require './app/forms/customer_bottle_form'

class BottleController < ApplicationController

  def index
    @bottle = Bottle.all.last(10)
    @new_bottle = CustomerBottleForm.new
    @kinds = KindOfAlchol.pluck(:name,:id)
  end

  def create
    @new_bottle = CustomerBottleForm.new(new_bottle_params)
    if @new_bottle.save
       redirect_to '/'
    else
      flash.now[:alert] = '登録に失敗しました'
    end
  end

  def get_search_nickname
    keyword = "#{params[:keyword]}%"
    if @get_search_nickname = Nickname.where('furigana collate utf8_unicode_ci Like(?) OR name collate utf8_unicode_ci Like(?)',keyword,keyword).limit(10)
      respond_to do |format|
        format.html
        format.json
      end
    end
  end

  def get_local_number
    if @local_number_plus = Bottle.where(kind_of_alchol_id: KindOfAlchol.find(params[:alcholId])).select(:local_number).order(local_number: :desc).first.local_number+1
      respond_to do |format|
        format.html
        format.json
      end
    end
  end

  private

    def twod_array_nickname_furigana(nickname=params["customer_bottle_form"]["nickname"],furigana=params["customer_bottle_form"]["furigana"]) 
      nickname_val = nickname.values
      furigana_val = furigana.values
      return nickname_val.zip(furigana_val)
    end

  def new_bottle_params
    params.require(:customer_bottle_form).permit(:local_number,:kind_of_alchol_id,:liquid_level,:karaoke).merge(status: 1,nicknames: twod_array_nickname_furigana)
  end

end
