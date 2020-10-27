class ItemsController < ApplicationController
  before_action :authenticate_user! [:new]

  def index
  end

  def new
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
