class ReviewsController < ApplicationController
  def index
    @number = rand(100)

    @reviews = Review.all
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
      render 'new'
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to reviews_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to reviews_url
    end
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
      render 'edit'
    end
  end

  def form_params
    params.require(:review).permit(:title, :body, :score)
  end
end