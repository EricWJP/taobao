class CouponsController < ApplicationController
  def index
    # @coupons = Coupon.ransack(params[:q]).result.paginate(page: params[:page] || 1, per_page: params[:per_page] || 12)
    @coupons = Coupon.all
  end

  private
  def permitted_params
    params.require(:coupon).permit(symbol_params)
  end

  def attributes
    # symbol_params.map(&:to_s)
    %w(type name coupon_detail coupon_total coupon_remainder coupon_start_date, :coupon_end_date, :coupon_url  detail_url taobao_url price seller_ww seller_name coupon_total coupon_remainder)
  end

  def symbol_params
    # [:id, :taobao_id, :name, :cover_url, :cover_file_name, :cover_content_type, :cover_file_size, :cover_updated_at, :detail_url, :type, :taobao_url, :price, :monthsales, :income_rate, :commission, :seller_ww, :seller_id, :seller_name, :seller_type, :coupon_id, :coupon_total, :coupon_remainder, :coupon_detail, :coupon_start_date, :coupon_end_date, :coupon_url, :coupon_spread_url, :position, :status, :created_at, :updated_at]
    [:id, :taobao_id, :name, :cover_url, :detail_url, :type, :taobao_url, :price, :monthsales,
     :income_rate, :commission, :seller_ww, :seller_id, :seller_name, :seller_type, :coupon_id,
     :coupon_total, :coupon_remainder, :coupon_detail, :coupon_start_date, :coupon_end_date, :coupon_url,
     :coupon_spread_url, :position, :status, :created_at, :updated_at]

  end
end
