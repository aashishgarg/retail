class Api::V1::ProductsController < ApplicationController
  def index
    @products = Variant.search(params[:search])
  end

  def show
    Variant.find_by_id(params[:id])
  end
end
