class Admin::CategoriesController < Admin::ApplicationController

  def index               #ova metoda je ovdje "definirana", ali zapravo da bi ona radila i bila skroz definirana, potrebno je kreirati index.html.erb metodu u views/admin/categories. To dvoje ide zajedno na neki način.

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

  end

  def destroy

  end



  private

  def category_params
    params.require(:category).permit(:name, :summary)
  end


end
