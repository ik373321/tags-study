class TweetsController < ApplicationController
def index
  @tweet = Tweet.order('created_at DESC')
end
def new
  @tweet = Tweet.new
end
def create
  #  binding.pry
  @tweet = Tweet.new(tweets_params)
  tag_list = params[:tweet][:tag_name].split(",") #追加
  @tweet.tags_save(tag_list)
  if @tweet.valid?
    @tweet.save
    redirect_to root_path
  else

    render :new
  end
end
def tag
  @tag = Tag.all.order('created_at DESC')
end


private
def tweets_params
  params.require(:tweet).permit(:memo).merge(user_id: current_user.id)
end
end
