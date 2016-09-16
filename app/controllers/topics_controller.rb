class TopicsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @topics = Topic.all.reverse
    @topic = Topic.new
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def create
    p params[:topic][:question]
    @topic = Topic.new(user: current_user, question: params[:topic][:question])
    if @topic.save
      respond_to do |format|
        # format.html (redirect_to topics_path)
        format.js
      end
    else
      respond_to do |format|
        format.html (render 'topics/index')
        format.js
      end
    end
  end
end
