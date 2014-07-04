class RefereePathsController < ApplicationController
  before_action :set_referee_path, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user,     only: [:new, :index, :show, :edit, :update, :destroy]
  before_action :admin_user,     only: [:new, :index, :show, :edit, :update, :destroy]

  # GET /referee_paths
  # GET /referee_paths.json
  def index
    @referee_paths = RefereePath.all
  end

  # GET /referee_paths/1
  # GET /referee_paths/1.json
  def show
  end

  # GET /referee_paths/new
  def new
    @referee_path = RefereePath.new
  end

  # GET /referee_paths/1/edit
  def edit
  end

  # POST /referee_paths
  # POST /referee_paths.json
  def create
    @referee_path = RefereePath.new(referee_path_params)

    respond_to do |format|
      if @referee_path.save
        format.html { redirect_to @referee_path, notice: 'Histório de técnico de arbitragem criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @referee_path }
      else
        format.html { render action: 'new' }
        format.json { render json: @referee_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /referee_paths/1
  # PATCH/PUT /referee_paths/1.json
  def update
    respond_to do |format|
      if @referee_path.update(referee_path_params)
        format.html { redirect_to @referee_path, notice: 'Histório de técnico de arbitragem actualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @referee_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referee_paths/1
  # DELETE /referee_paths/1.json
  def destroy
    @referee_path.destroy
    respond_to do |format|
      format.html { redirect_to referee_paths_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referee_path
      @referee_path = RefereePath.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def referee_path_params
      params.require(:referee_path).permit(:date_acomplished, :referee_category_id, :referee_id)
    end
end
