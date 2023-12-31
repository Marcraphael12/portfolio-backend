class Api::V1::SkillsController < ApplicationController
  def create
    author = User.find(params[:user_id])
    skill = author.skills.new(skill_params)
    # skill = skill.new(skill_params)
    if skill.save
      # session[:skill_id] = @skill.id
      render json: skill, status: :created
    else
      render json: skill.errors, status: :unprocessable_entity
    end
  end

  def index
    skills = Skill.where(user_id: params[:user_id])

    if skills.empty?
      render json: 'user without skill'
    else
      render json: skills
    end
  end

  def show
    skill = Skill.find(params[:id])
    render json: skill
  end

  def destroy
    skill = Skill.find(params[:id])
    skill.destroy
    render json: { message: 'skill successfully destroyed' }, status: :ok
  end

  private

  def skill_params
    params.require(:skill).permit(:name)
  end
end
