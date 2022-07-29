class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end


  private

  def category_params
    params.require(:category).permit(
      :name,
    )
  end


  # def destroy
  #   @category = category.find params[:id]
  #   @category.destroy
  #   redirect_to [:admin, :products], notice: 'Product deleted!'
  # end
end
