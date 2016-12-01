class CouponsController < ApplicationController
  def index
    @coupons = Coupon.ransack(params[:q]).results.paginate(page: params[:page] || 1, per_page: params[:per_page] || 12)
  end
end
