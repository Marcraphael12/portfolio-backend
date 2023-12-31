class Api::V1::VideosController < ApplicationController
  def create
    author = User.find(params[:user_id])
    video = author.videos.new(video_params)
    # video = video.new(video_params)
    if video.save
      # session[:video_id] = @video.id
      render json: video, status: :created
    else
      render json: video.errors, status: :unprocessable_entity
    end
  end

  def index
    videos = Video.where(user_id: params[:user_id])

    if videos.empty?
      render json: 'user without video'
    else
      render json: videos
    end
  end

  def show
    video = Video.find(params[:id])
    render json: video
  end

  def destroy
    video = Video.find(params[:id])
    video.destroy
    render json: { message: 'video successfully destroyed' }, status: :ok
  end

  private

  def video_params
    params.require(:video).permit(:link, :title)
  end
end
