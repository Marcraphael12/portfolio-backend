class Api::V1::ProjectsController < ApplicationController
  def create
    @project = Project.new(project_params)
    if @project.save
      # session[:project_id] = @project.id
      render json: @project, status: :created
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end


  private

  def project_params
    params.require(:project).permit(:name, :github, :live, :description, :likes)
  end
end
