module Api 
    class PlatesController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :set_plate, only: %i[ show edit update destroy ]
  
      def index
        @plates = Plate.all
      end
  
      def show
      end
  
      def new
        @plate = Plate.new
      end
  
      def edit
      end
  
      def create
        @plate = Plate.new(plate_params)
  
  
          if @plate.save
            render 'api/plates/show', status: :created
          else
            render json: @plate.errors, status: :unprocessable_entity
          end
        
      end
  
      def update
        if @plate.update(plate_params)
          render 'api/plates/show', status: :ok, location: @plate
        else
          render json: @plate.errors, status: :unprocessable_entity
        end
      end
  
      def destroy
        @plate.destroy
  
          render 'api/plates/index', status: :ok
      end
    
  
      private
        def set_plate
          @plate = Plate.find(params[:id])
        end
  
        def plate_params
            params.require(:plate).permit(:name, :description, :price, :picture, :order_id)
        end
    end
  end