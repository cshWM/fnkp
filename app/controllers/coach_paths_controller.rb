class CoachPathsController < ApplicationController
  before_action :set_coach_path, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user,     only: [:new, :index, :show, :edit, :update, :destroy]
  before_action :admin_user,     only: [:new, :index, :show, :edit, :update, :destroy]

  # GET /coach_paths
  # GET /coach_paths.json
  def index
    @coach_paths = CoachPath.all
  end

  # GET /coach_paths/1
  # GET /coach_paths/1.json
  def show
  end

  # GET /coach_paths/new
  def new
    @coach_path = CoachPath.new
  end

  # GET /coach_paths/1/edit
  def edit
  end

  # POST /coach_paths
  # POST /coach_paths.json
  def create
    @coach_path = CoachPath.new(coach_path_params)

    respond_to do |format|
      if @coach_path.save
        format.html { redirect_to @coach_path, notice: 'Coach path was successfully created.' }
        format.json { render action: 'show', status: :created, location: @coach_path }
      else
        format.html { render action: 'new' }
        format.json { render json: @coach_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coach_paths/1
  # PATCH/PUT /coach_paths/1.json
  def update
    respond_to do |format|
      if @coach_path.update(coach_path_params)
        format.html { redirect_to @coach_path, notice: 'Coach path was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @coach_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coach_paths/1
  # DELETE /coach_paths/1.json
  def destroy
    @coach_path.destroy
    respond_to do |format|
      format.html { redirect_to coach_paths_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coach_path
      @coach_path = CoachPath.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coach_path_params
      params.require(:coach_path).permit(:date_acomplished, :coach_category_id, :coach_id)
    end
end
