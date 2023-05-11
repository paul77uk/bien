class ReviewsController < ApplicationController
  # check is logged in
  before_action :check_login, except: %i[index show]

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
    # take info from the form and add it to the model
    @review = Review.new(form_params)

    # and then associate it with a user
    @review.user = @current_user

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

    # destroy
    @review.destroy if @review.user == @current_user

    redirect_to root_path
  end

  def edit
    @review = Review.find(params[:id])

    redirect_to root_path if @review.user != @current_user
  end

  def update
    @review = Review.find(params[:id])

    redirect_to root_path if @review.user != @current_user

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
