class Api::V1::ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user, except: [:create]
  protect_from_forgery unless: -> { request.format.json? }
  
  def create
    review = Review.new(review_params)
    beer = Beer.find(params[:beer_id])
    review.beer = beer
    review.user = current_user

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

  protected

  def review_params
    params.require(:review).permit(:rating, :difficulty, :comment)
  end

  def authorize_user
    if !user_signed_in? || !(current_user.role == "admin")
      render json: { error: ["Only admins have access to this feature"] }
    end
  end
end