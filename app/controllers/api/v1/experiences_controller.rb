class Api::V1::ExperiencesController < ApplicationController
  def create
    author = User.find(params[:user_id])
    experience = author.experiences.new(experience_params)
    if experience.save
      render json: experience, status: :created
    else
      render json: experience.errors, status: :unprocessable_entity
    end
  end

  def index
    experiences = experience.where(user_id: params[:user_id])

    if experiences.empty?
      render json: 'user without experience'
    else
      render json: experiences
    end
  end

  def show
    experience = Experience.find(params[:id])
    render json: experience
  end

  def destroy
    experience = Experience.find(params[:id])
    experience.destroy
    render json: { message: 'experience successfully destroyed' }, status: :ok
  end

  private

  def experience_params
    params.require(:experience).permit(:position, :society, :period, :type, :logo)
  end
end
