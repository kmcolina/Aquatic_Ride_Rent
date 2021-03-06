class ReviewsController < ApplicationController

  # before_action :set_review, only: :create

  def create
    @objeto_acuatico = ObjetoAcuatico.find(params[:objeto_acuatico_id])
    authorize @objeto_acuatico
    @review = Review.new(review_params)
    @review.objeto_acuatico = @objeto_acuatico
    if @review.save
      redirect_to objeto_acuatico_path(@objeto_acuatico, anchor: "review-#{@review.id}")
    else
      render 'objeto_acuaticos/show'
    end
    # @review = Review.new(review_params)
    # @review = @objeto_acuatico.reviews.build(review_params)
    # if @review.save
    #   redirect_to objeto_acuatico_path(@objeto_acuatico)
    # else
    #   render 'objeto_acuaticos/show'
    # end
  end
  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

  def set_review
    @objeto_acuatico = ObjetoAcuatico.find(params[:objeto_acuatico_id])
  end
end
