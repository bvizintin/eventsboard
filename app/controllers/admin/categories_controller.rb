class Admin::CategoriesController < Admin::ApplicationController

  before_action :set_category, only: [:edit, :update, :destroy]

  def index               #ova metoda je ovdje "definirana", ali zapravo da bi ona radila i bila skroz definirana, potrebno je kreirati index.html.erb metodu u views/admin/categories. To dvoje ide zajedno na neki način.
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "Category created."
      redirect_to admin_categories_path
    else
      flash[:alert] = "Unable to create category!"
      render "new"
    end

  end

  def edit

  end

  def update
    if @category.update(category_params)
      flash[:notice] = "Category updated."
      redirect_to admin_categories_path
    else
      flash.now[:alert] = "Unable to update category!"
      render "edit"
    end
  end

  def destroy
    @category.destroy
    flash[:notice] = "Category deleted!"
    redirect_to admin_categories_path
  end



  private

  def category_params
    params.require(:category).permit(:name, :summary)
  end


  def set_category
    @category = Category.find(params[:id])
  end

end
