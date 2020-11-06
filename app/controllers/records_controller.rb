class RecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @form = FormObject.new
    @user = @item.user
    @record = Record.find_by(item_id: @item.id)
    redirect_to root_path if @user == current_user || !@record.nil?
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
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: form_params[:token],
      currency: 'jpy'
    )
  end
end
