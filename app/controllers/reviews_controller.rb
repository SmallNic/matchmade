class ReviewsController < ApplicationController
  before_action :set_review, only: [:update]

  def create
    begin
      @review = Review.create!(
        item_id: review_params[:item_id],
        user_id: current_user.id,
        is_interested: review_params[:is_interested]
      )
    rescue ActiveRecord::RecordNotSaved => e
      puts @review.errors.full_messages
    end
    redirect_to items_path
  end

  def update
    @review.update(is_interested: !@review.is_interested)
    redirect_to items_path
  end

  private

  def review_params
    params.permit(:item_id, :is_interested)
  end

  def set_review
    @review = Review.find(params[:id])
  end


end
