class Api::V1::PunkReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user, except: [:create]
  protect_from_forgery unless: -> { request.format.json? }
  
  def create
    review = PunkReview.new(review_params)
    beer = PunkBeer.find(params[:punk_beer_id])
    review.punk_beer = beer
    review.user = current_user

    if review.save
      render json: review
    else
      render json: { error: review.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    review = PunkReview.find(params[:id])
    review.destroy
    render json: { message: "removed" }, status: :ok
  end

  protected

  def review_params
    params.require(:punk_review).permit(:rating, :difficulty, :comment)
  end

  def authorize_user
    if !user_signed_in? || !(current_user.role == "admin")
      render json: { error: ["Only admins have access to this feature"] }
    end
  end
end