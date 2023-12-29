class Api::V1::ProjectsController < ApplicationController
  def create
    project = Project.new(project_params)
    if project.save
      # session[:project_id] = @project.id
      render json: project, status: :created
    else
      render json: project.errors, status: :unprocessable_entity
    end
  end

  def index
    projects = Project.where(user_id: params[:user_id])

    if projects.empty?
      render json: 'user without project'
    else
      render json: projects
    end
  end

  def show
    project = Project.find(params[:id])
    render json: project
  end

  def destroy
    project = Project.find(params[:id])
    project.destroy
    render json: { message: 'Project successfully destroyed' }, status: :ok
  end

  private

  def project_params
    params.require(:project).permit(:name, :github, :live, :description, :user_id)
  end
end
