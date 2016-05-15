class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  def index
    @products = Product.all
  end

  def show
    flash.now[:notice] = @product["error"]["message"] if @product["error"] && @product["error"]["message"]
  end

  private

    def set_product
      @product = JSON.parse(Net::HTTP.get(URI(Product::BASE_URI + params[:id])))
    end
end
