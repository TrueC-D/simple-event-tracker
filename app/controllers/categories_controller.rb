class CategoriesController < ApplicationController
    # def index
    #     sessions controller needed -> check session for user id.
        # check if admin
        # check if valid
        # @categories = Category.all
    # end
    
    # def show
    #     sessions controller needed -> check session for user id.
        # check if admin
        # check if valid
        # find_category
    # end


    def new
        # sessions controller needed -> check session for user id.
        # check if admin
        # check if valid
        @category = Category.new        
    end

    def create
        # sessions controller needed -> check session for user id.
        # check if admin
        # check if valid
        @category = Category.create(category_params)
    end

    def edit
        # sessions controller needed -> check session for user id.
        # check if admin
        # check if valid
        find_category
    end

    def update
        # sessions controller needed -> check session for user id.
        # check if admin
        # check if valid
        @category = Category.update(category_params)
    end

    def destroy
        # sessions controller needed -> check session for user id.
        # check if admin
        # check if valid
        find_category
        @category.destroy
    end

    def find_category
        @category  = Category.find(id: params[:id])
    end

    private

    def category_params
        params.require(:category).permit(:name, :description)
        # params.permit(:name, :description)
    end
end
