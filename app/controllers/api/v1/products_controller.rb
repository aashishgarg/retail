class Api::V1::ProductsController < ApplicationController
  def index
    @products = Variant.search(params[:search])
  end

  def show
    @product =Product.find_by_id(params[:id])
  end
end
