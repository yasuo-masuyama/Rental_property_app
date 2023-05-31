class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy ]

  def index
    @properties = Property.all
  end

  def show
  end

  def new
    @property = Property.new
    2.times { @property.nearest_stations.build }
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to properties_path, notice: "物件を登録したよ"
    else
      render :new
    end
  end

  def confirm
    @property = Property.new(property_params)
    render :new if @property.invalid?
  end

  def edit
    @property.nearest_stations.build
  end

  def update
    if @property.update(property_params)
      redirect_to properties_path, notice: "物件を編集したよ"
    else
      render :edit
    end
  end

  def destroy
    @property.destroy
    redirect_to properties_path, notice: "物件を削除したよ"
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end
  
  def property_params
    params.require(:property).permit(:property_name, :rent, :address, :age, :remarks, 
                                     nearest_stations_attributes: [:id, :route_name, :station_name, :walking_minutes ])
  end
end
