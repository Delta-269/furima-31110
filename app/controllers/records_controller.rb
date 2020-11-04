class RecordsController < ApplicationController

  def index
    @item = Item.find_by(params[:id])
    @form = FormObject
  end

  def create
    @form = FormObject.new(form_params)
    @item = Item.find_by(params[:id])
    if @form.valid?
      @form.save
      redirect_to root_path
    else
      render action: :index
    end
  end


  private
  def form_params
    params.require(:form_object).permit(:post, :area_id, :city, :address, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
