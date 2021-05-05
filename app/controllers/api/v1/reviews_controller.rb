class Api::V1::ReviewsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }
  def create
    review = Review.new(review_params)
    beer = Beer.find(params[:beer_id])
    review.beer = beer

    if review.save
      render json: review
    else
      render json: { error: review.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    render json: { message: "removed" }, status: :ok
  end

  private

  def review_params
    params.require(:review).permit(:rating, :difficulty, :comment)
  end
end