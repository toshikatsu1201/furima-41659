class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index]
  
  def index
    redirect_to root_path if current_user == @item.user || @item.record.present?
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @ship_record = ShipRecord.new
  end

  def create
    @ship_record = ShipRecord.new(ship_record_params)
    if @ship_record.valid?
      pay_item
      @ship_record.save
    # 保存が成功した場合の処理
      redirect_to root_path
    else
    # 保存に失敗した場合の処理
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def ship_record_params
    params.require(:ship_record).permit(:post_code, :region_id, :city, :house_number, :building, :tel).merge(token: params[:token],user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: ship_record_params[:token],  # カードトークン
        currency: 'jpy'  # 通貨の種類（日本円）
      )
  end
end
