module Api
  class DriversController < ApplicationController
    before_action :set_driver, only: [:show, :update, :destroy]

    # GET /api/drivers
    def index
      @drivers = Driver.all

      render json: @drivers
    end

    # GET /api/drivers/1
    def show
      render json: @driver
    end

    # POST /api/drivers
    def create
      @driver = Driver.new(driver_params)

      if @driver.save
        render json: @driver, status: :created
      else
        render json: @driver.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /api/drivers/1
    def update
      if @driver.update(driver_params)
        render json: @driver
      else
        render json: @driver.errors, status: :unprocessable_entity
      end
    end

    # DELETE /api/drivers/1
    def destroy
      @driver.destroy
      render json: @driver
    end

    private

    def set_driver
      @driver = Driver.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def driver_params
      params.require(:driver).permit(:name, :tel, :car_number)
    end
  end
end
