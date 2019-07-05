class TweetsController < ApplicationController
  # ------ start ------
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  # ------  end  ------

  def index 
    @tweets = Tweet.all
  end

  def show 
    # @tweet = Tweet.find_by(id: params[:id]) REMOVE
  end

  def new
    @tweet = Tweet.new
  end

  def create
    # @tweet = Tweet.find_by(id: params[:id]) REMOVE
    if @tweet.save
      redirect_to tweets_path
    else
      render :new
    end
  end

  def edit
    # @tweet = Tweet.find_by(id: params[:id]) REMOVE
  end

  def update
    # @tweet = Tweet.find_by(id: params[:id]) REMOVE
    if @tweet.update(tweet_params)
      redirect_to tweets_path
    else
      render :edit
    end
  end

  def destroy
    # @tweet = Tweet.find_by(id: params[:id]) REMOVE
    @tweet.destroy
    redirect_to tweets_path
  end

  private
    def tweet_params
      params.require(:tweet).permit(:body)
    end

    def set_tweet
      @tweet = Tweet.find_by(id: params[:id])
    end
end