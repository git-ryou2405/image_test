class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit]
  
  def index
    @shops = Shop.all
  end
  
  def show
  end
  
  def new
    @shop = Shop.new
    @shop_file = @shop.shop_files.build
  end
  
  def create
    @shop = Shop.create(shop_params)
    
    # 投稿が成功した場合
    if @shop.save
      # 画像が投稿されていないパターンもあるので条件分岐
      if params[:shop_files].present?        
        params[:shop_files][:file].each do |file_url|
          
          @shop_file = @shop.shop_files.create!(file: file_url, shop_id: @shop.id)
        end
      end
      redirect_to shop_path(@shop.id)
      
      # 投稿が失敗した場合
    else
      flash[:danger] = "エラーが発生したため、投稿を中断しました。"
      redirect_to root_path
    end
  end
  
  def edit
  end
  
  def update
    @shop = Shop.update(shop_params)
    redirect_to shop_path(@shop.id)
  end
  
  private
  
  def shop_params
    params.require(:shop).permit(:name, shop_files_attributes: [:file, :id])
  end
  
  def set_shop
    @shop = Shop.find(params[:id])
  end
end
