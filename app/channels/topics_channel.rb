class TopicsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'topics'
  end
end
