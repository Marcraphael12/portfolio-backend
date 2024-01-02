# frozen_string_literal: true

module Api
  module V1
    class JobDescriptionsController < ApplicationController
      def create
        description = Experience.find(params[:experience_id])
        job_description = description.job_descriptions.new(job_description_params)
        if job_description.save
          render json: job_description, status: :created
        else
          render json: job_description.errors, status: :unprocessable_entity
        end
      end

      def index
        job_descriptions = JobDescription.where(experience_id: params[:experience_id])

        if job_descriptions.empty?
          render json: 'experience without job description'
        else
          render json: job_descriptions
        end
      end

      def show
        job_description = JobDescription.find(params[:id])
        render json: job_description
      end

      def destroy
        job_description = JobDescription.find(params[:id])
        job_description.destroy
        render json: { message: 'job description successfully destroyed' }, status: :ok
      end

      private

      def job_description_params
        params.require(:job_description).permit(:text)
      end
    end
  end
end
