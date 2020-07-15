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

  def search
    @nicknames = Nickname.where('name Like(?)',"%#{params[:keyword]}%").limit(10)
  if @nicknames
    respond_to do |format|
      format.html
      format.json
    end
  end
  end

  private

  def nicknames
    nicknames = []
    if params["customer_bottle_form"]["nickname"]
      params["customer_bottle_form"]["nickname"].each do |n|
        nicknames << n[1]
      end
    end
    return nicknames
  end

  def new_bottle_params
    params.require(:customer_bottle_form).permit(:local_number,:kind_of_alchol_id,:liquid_level,:karaoke).merge(status: 1,nicknames: nicknames)
  end

end
