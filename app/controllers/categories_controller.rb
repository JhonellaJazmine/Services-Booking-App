class CategoriesController < ApplicationController
    def index
        @categories = Category.all.order(:created_at)
        
        # if session[:user_id]
        #     @user = User.find(session[:user_id])
        # end
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        if @category.save 
            redirect_to categories_path, notice: 'Category has been created successfully.'
        else
            render :new, status: 422
        end
    end

def show 
end

def edit 
    if @category.user != Current.user
        redirect_to services_path, notice: 'unauthorized access!'
     end
end

def update
    if @category.update(category_params)
        redirect_to categories_path, notice: 'Category has been updated successfully.'
    else
        render :edit, status: 422
    end
end

def destroy
    if @category.user != Current.user
        redirect_to categories_path, notice: 'unauthorized access!'
    else @category.destroy
    redirect_to categories_path, notice: 'Category has been deleted successfully.'
    end
end


private

    def category_params
        params.require(:category).permit(:name, :description, :admin_id)
    end

    def set_category
        @category = Category.find(params[:id])
    end

end
