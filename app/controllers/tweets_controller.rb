class TweetsController < ApplicationController
def index
  @tweet = Tweet.order('created_at DESC')
end
def new
  @tweet = Tweet.new
end
def create
  # binding.pry
  @tweet = Tweet.new(tweets_params)
  if @tweet.valid?
    @tweet.save
    redirect_to root_path
  else

    render :new
  end
end


private
def tweets_params
  params.require(:tweet).permit(:memo).merge(user_id: current_user.id)
end
end
