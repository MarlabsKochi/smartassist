class FloorPointsController < ApplicationController
  before_action :set_floor_map, only: [:show, :edit, :update, :destroy]
   respond_to :js,:html
  # GET /floor_maps
  # GET /floor_maps.json
  def index
    @floor_points = FloorPoint.all
  end

  def draw_canvas
  end

  def dummy
  end

  # GET /floor_maps/1
  # GET /floor_maps/1.json
  def show
  end

  # GET /floor_maps/new
  def new
    @floor_point = FloorPoint.new
  end

  # GET /floor_maps/1/edit
  def edit
  end

  # POST /floor_maps
  # POST /floor_maps.json
  def create
    p "@@@@@@@@@@@@@"
    p JSON.parse(params[:floor_point][:floor_coordinates])
    @floor_point = FloorPoint.new(floor_map_params)
    @floor_point.floor_coordinates = JSON.parse(params[:floor_point][:floor_coordinates])
    @floor_point.save!
    respond_to do |format|
      format.js
    end
  end

  # PATCH/PUT /floor_maps/1
  # PATCH/PUT /floor_maps/1.json
  def update
    respond_to do |format|
      if @floor_point.update(floor_map_params)
        format.html { redirect_to @floor_point, notice: 'Floor map was successfully updated.' }
        format.json { render :show, status: :ok, location: @floor_map }
      else
        format.html { render :edit }
        format.json { render json: @floor_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /floor_maps/1
  # DELETE /floor_maps/1.json
  def destroy
    @floor_map.destroy
    respond_to do |format|
      format.html { redirect_to @floor_point_url, notice: 'Floor map was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_floor_map
      @floor_map = FloorPoint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def floor_map_params
      params.require(:floor_point).permit(:floor_coordinates)
    end
end
