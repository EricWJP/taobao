class CouponsController < ApplicationController
  before_action :set_query_params

  def index
    @coupons = Coupon.ransack(params[:q]).result.paginate(page: params[:page] || 1, per_page: params[:per_page] || 12)
    # @coupons = Coupon.all
  end

  def upload

  end


  def syn_db
    file_path = params[:file][:myfile].path
    # file_path = '/Users/adolphalex/Desktop/精选.xls'
    Spreadsheet.client_encoding = 'UTF-8'
    book = Spreadsheet.open(file_path)
    sheet = book.worksheet(0)
    row1 = sheet.row(0)
    head_column = {}
    row1.each_with_index do |k,v|
      head_column[k] = v
    end
    sheet.each do |row|
      next  if row[0] == "商品id"
      coupon = {}
      params_array.each_with_index do |key, i|
        coupon[key] = row[i]
      end
      # first_name = row[head_column["First Name"]] #First Name in excel header
      Coupon.create(coupon)
    end
    redirect_to upload_coupons_path, notice: "上传成功！"
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
    [:id, :taobao_id, :name, :cover_url, :detail_url, :category, :taobao_url, :price, :monthsales,
     :income_rate, :commission, :seller_ww, :seller_id, :scategoryeller_name, :seller_type, :coupon_id,
     :coupon_total, :coupon_remainder, :coupon_detail, :coupon_start_date, :coupon_end_date, :coupon_url,
     :coupon_spread_url, :position, :status, :created_at, :updated_at]

  end
  def params_array
    ["taobao_id", "name", "cover_url", "detail_url", "category", "taobao_url", "price", "monthsales", "income_rate", "commission", "seller_ww",
      "seller_id", "seller_name", "seller_type", "coupon_id", "coupon_total", "coupon_remainder", "coupon_detail",
      "coupon_start_date", "coupon_end_date", "coupon_url", "coupon_spread_url"]
  end

  def set_query_params
    params[:q] = {} if params[:q].blank?
    @q = Coupon.search(params[:q]) if Coupon.present?
  end
end
