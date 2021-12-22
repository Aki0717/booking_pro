class OrdersController < ApplicationController
  def index
    @book = Book.find(params[:book_id])
    @order = Order.new
    @price = 8000
  end
  
  def create
    @book = Book.find(params[:book_id])
    @price = 8000
    @order = Order.new(order_params)    
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end


  private

  def order_params
    params.permit(:name, :mail, :phone_number, :price).merge(book_id: params[:book_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] #payjpテスト秘密鍵
    Payjp::Charge.create(
      amount: @order.price, #金額
      card: params[:token], #トークン
      currency: 'jpy'
    )
  end
end
