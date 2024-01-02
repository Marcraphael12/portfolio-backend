# frozen_string_literal: true

module Api
  module V1
    class TestimonialsController < ApplicationController
      def create
        author = User.find(params[:user_id])
        testimonial = author.testimonials.new(testimonial_params)
        # testimonial = testimonial.new(testimonial_params)
        if testimonial.save
          # session[:testimonial_id] = @testimonial.id
          render json: testimonial, status: :created
        else
          render json: testimonial.errors, status: :unprocessable_entity
        end
      end

      def index
        testimonials = Testimonial.where(user_id: params[:user_id])

        if testimonials.empty?
          render json: 'user without testimonial'
        else
          render json: testimonials
        end
      end

      def show
        testimonial = Testimonial.find(params[:id])
        render json: testimonial
      end

      def destroy
        testimonial = Testimonial.find(params[:id])
        testimonial.destroy
        render json: { message: 'testimonial successfully destroyed' }, status: :ok
      end

      private

      def testimonial_params
        params.require(:testimonial).permit(:name, :messaage, :photo)
      end
    end
  end
end
