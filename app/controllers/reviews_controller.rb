class ReviewsController < ApplicationController
  def index
    # @number = rand(100)
    @price = params[:price]
    @cuisine = params[:cuisine]
    @location = params[:location]

    @reviews = Review.all

    @reviews = @reviews.where(price: @price) if @price.present?

    @reviews = @reviews.where(cuisine: @cuisine) if @cuisine.present?

    @reviews = @reviews.near(@location) if @location.present?
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(form_params)
    if @review.save
      flash[:success] = 'Object successfully created'
      redirect_to root_path
    else
      flash[:error] = 'Something went wrong'
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      flash[:success] = 'Object was successfully deleted.'
    else
      flash[:error] = 'Something went wrong'
    end
    redirect_to reviews_url
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(form_params)
      flash[:success] = 'Object was successfully updated'
      redirect_to @review
    else
      flash[:error] = 'Something went wrong'
      render 'new', status: :unprocessable_entity
    end
  end

  def form_params
    params.require(:review).permit(:title, :restaurant, :body, :score, :ambiance, :cuisine, :price, :address)
  end
end
