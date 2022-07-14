 module Api 
  class ClientsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_client, only: %i[ show edit update destroy ]

    # GET /clients or /clients.json
    def index
      @clients = Client.all
    end

    # GET /clients/1 or /clients/1.json
    def show
    end

    # GET /clients/new
    def new
      @client = Client.new
    end

    # GET /clients/1/edit
    def edit
    end

    # POST /clients or /clients.json
    def create
      @client = Client.new(client_params)


        if @client.save
          render 'api/clients/show', status: :created
        else
          render json: @client.errors, status: :unprocessable_entity
        end
      
    end

    # PATCH/PUT /clients/1 or /clients/1.json
    def update

        if @client.update(client_params)
          render 'api/clients/show', status: :created
        else
          render json: @client.errors, status: :unprocessable_entity
        end
      
    end

    # DELETE /clients/1 or /clients/1.json
    def destroy
      @client.destroy

        render 'api/clients/index', status: :ok
    end
  

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_client
        @client = Client.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def client_params
        params.require(:client).permit(:name, :email, :password, :direction)
      end
  end
end
