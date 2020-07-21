require './app/forms/customer_bottle_form'

class BottleController < ApplicationController

  def index
    @new_bottle = CustomerBottleForm.new
    @kinds = KindOfAlchol.pluck(:name,:id)
  end

  def create
    @new_bottle = CustomerBottleForm.new(new_bottle_params)
    if @new_bottle.save
       redirect_to '/'
    else
      flash.now[:alert] = '登録に失敗しました'
      redirect_to '/'
    end
  end

  def get_search_nickname
    keyword = "#{params[:keyword]}%"
    if @search_nickname_info = Customer.eager_load(:bottles,:nicknames,:customer_bottles).order("customers.status DESC").where('nicknames.furigana collate utf8_unicode_ci Like(?) OR nicknames.name collate utf8_unicode_ci Like(?)',keyword,keyword)
      respond_to do |format|
        format.html
        format.json
      end
    end
  end

  def get_local_number
    if params[:alcholId].to_i
      @local_number_plus = Bottle.eager_load(:kind_of_alchol).where(kind_of_alchol_id: KindOfAlchol.find(params[:alcholId])).select(:local_number).order(local_number: :desc).first.local_number+1
      respond_to do |format|
        format.html
        format.json
      end
    end
  end

  private

  def twod_array_nickname_furigana(nickname=params["customer_bottle_form"]["nickname"],furigana=params["customer_bottle_form"]["furigana"]) 
    if nickname&&furigana
      nickname_val = nickname.values
      furigana_val = furigana.values
      return nickname_val.zip(furigana_val)
    end
  end

  def convert_to_array(params)
    if params
      return params.values
    end
  end

  def new_bottle_params
    params.require(:customer_bottle_form)
      .permit(:local_number,:kind_of_alchol_id,
              :liquid_level,:karaoke,
              :existed_customer_new_nickname
              )
      .merge(status: 1,new_nickname_furigana: twod_array_nickname_furigana,
             insert_existed_customer_id: convert_to_array(params[:customer_bottle_form][:insert_existed_customer_id]),
              )
  end

end
