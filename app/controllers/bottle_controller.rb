require './app/forms/customer_bottle_form'

class BottleController < ApplicationController

  def index
    @new_bottle = CustomerBottleForm.new
    @kinds = KindOfAlchol.pluck(:name,:id)

    @get_bottle_id = 1
    respond_to do |format|
      format.html
      format.json
    end

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
    if @search_nickname = Nickname.eager_load(:customer).order("customers.status DESC").where('nicknames.furigana collate utf8_unicode_ci Like(?) OR nicknames.name collate utf8_unicode_ci Like(?)',keyword,keyword)
      respond_to do |format|
        format.html
        format.json
      end
    end
  end

  def get_local_number
    if params[:alcholId].to_i
      @local_number_plus = Bottle.where(kind_of_alchol_id: KindOfAlchol.find(params[:alcholId])).select(:local_number).order(local_number: :desc).first.local_number+1
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
    params.require(:customer_bottle_form).permit(:local_number,:kind_of_alchol_id,:liquid_level,:karaoke).merge(status: 1,nickname_furigana: twod_array_nickname_furigana)
  end

end
