class RecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @form = FormObject.new
    @user = @item.user
    if @user == current_user 
      redirect_to root_path 
    end
    if @form.item_id == nil
      redirect_to root_path
    end
  end

  def create
    @form = FormObject.new(form_params)
    @item = Item.find(params[:item_id])
    if @form.valid?
      pay_item
      @form.save
      redirect_to root_path
    else
      render action: :index
    end
  end


  private
  def form_params
    params.require(:form_object).permit(:post, :area_id, :city, :address, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: form_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end
end
