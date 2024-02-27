class AdminController < ApplicationController
  layout "admin"
  before_action :authenticate_admin!

  def index
    @orders = Orders.where(fulfilled: false).order(created_at: :desc).take(5)
    @quick_stats = {
      sales: Order.where(created_at: Time.now.midnight .. Time.now).count,
      avg_sales: Order.where(created_at: Time.now.midnight .. Time.now).average(:total).round(),
      per_sale: OrderProduct.joins(:order).where(orders: {created_at: Time.now.midnight .. Time.now }).average(:quantity)
    }
  end
end
