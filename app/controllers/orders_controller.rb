class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  def index
    @ship_record = ShipRecord.new
  end

  def create
    @ship_record = ShipRecord.new(ship_record_params.merge(user_id: current_user.id, item_id: @item.id))
    if @ship_record.valid?
      @ship_record.save
    # 保存が成功した場合の処理
      redirect_to root_path
    else
    # 保存に失敗した場合の処理
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def ship_record_params
    params.require(:ship_record).permit(:post_code, :region_id, :city, :house_number, :building, :tel)
  end
end
