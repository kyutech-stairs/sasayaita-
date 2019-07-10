class TweetsController < ApplicationController
    #Tweetテーブルからすべてのデータを持ってくる
    def index
        @tweets = Tweet.all
        @tweet = Tweet.new
    end
    #idからデータを探して取得
    def show
        @tweet = Tweet.find_by(id: params[:id])
    end
    
    def new 
        @tweet = Tweet.new
    end

    def create
        @tweet = Tweet.new(tweet_params)
        if @tweet.save
          redirect_to tweets_path
        else
          render :new
        end
    end
    
    private
      def tweet_params
        params.require(:tweet).permit(:body)
      end
end
