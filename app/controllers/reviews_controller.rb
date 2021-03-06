class ReviewsController < ApplicationController
    def index
        @reviews = Review.all
    end
     
    def show
        @review = Review.find(params[:id])
    end
     

    def new
    end

    def create
        @review = Review.new(review_params)
        @review.user_id = current_user.id
 
        @review.save
        redirect_to @review
    end

    private
    def review_params
        params.require(:review).permit(:title, :text, :stars)
    end
end
