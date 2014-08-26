class StationsController < ApplicationController
  def index
    @stations = Station.all
    @data = Station.datamaker
  end

  def new
    @station = Station.new
  end

  def create
    @station = Station.new(station_params)
    if @station.save
      @station.line_ids = params[:station][:line_ids]
      flash[:notice] = "station created."
      redirect_to stations_path
    else
      render 'new'
    end
  end

  def show
    @station = Station.find(params[:id])
  end

  def edit
    @station = Station.find(params[:id])
  end

  def update
    @station = Station.find(params[:id])
    if @station.update(station_params)
      @station.line_ids = params[:station][:line_ids]
      flash[:notice] = "station updated."
      redirect_to station_path(@station)
    else
      render 'edit'
    end
  end

  def destroy
    @station = Station.find(params[:id])
    @station.destroy
    flash[:notice] = "station deleted."
    redirect_to stations_path
  end

  def graph
    render("stations/graph.html")
  end

  private
  def station_params
    params.require(:station).permit(:name, :line_id)
  end

end

#index, new, create, show, edit, update, and destroy
