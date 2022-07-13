class PlatesController < ApplicationController
  before_action :set_plate, only: %i[ show edit update destroy ]

  def index
    if require_user or authenticated_user
    else
    @plates = Plate.all
    end
  end

  def show
    if require_user or authenticated_user
    end
  end

  def new
    if require_user or authenticated_user
    else
    @plate = Plate.new
    end
  end

  def edit
    if require_user or authenticated_user
    end
  end

  def create
    if require_user or authenticated_user
    else
    @plate = Plate.new(plate_params)

    respond_to do |format|
      if @plate.save
        format.html { redirect_to plate_url(@plate), notice: "Plate was successfully created." }
        format.json { render :show, status: :created, location: @plate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @plate.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  def update
    if require_user or authenticated_user
    else
    respond_to do |format|
      if @plate.update(plate_params)
        format.html { redirect_to plate_url(@plate), notice: "Plate was successfully updated." }
        format.json { render :show, status: :ok, location: @plate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @plate.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  def destroy
    if require_user or authenticated_user
    else
    @plate.destroy

    respond_to do |format|
      format.html { redirect_to plates_url, notice: "Plate was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  end

  private
    def set_plate
      @plate = Plate.find(params[:id])
    end

    def plate_params
      params.require(:plate).permit(:name, :description, :price, :picture, :order_id)
    end
end
