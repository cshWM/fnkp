class GraduationsController < ApplicationController
  before_action :set_graduation, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user,     only: [:new, :index, :show, :edit, :update, :destroy]
  before_action :admin_user,     only: [:new, :index, :show, :edit, :update, :destroy]

  # GET /graduations
  # GET /graduations.json
  def index
    @graduations = Graduation.paginate(page: params[:page], :per_page => 15)
  end

  # GET /graduations/1
  # GET /graduations/1.json
  def show
  end

  # GET /graduations/new
  def new
    @graduation = Graduation.new
  end

  # GET /graduations/1/edit
  def edit
  end

  # POST /graduations
  # POST /graduations.json
  def create
    @graduation = Graduation.new(graduation_params)

    respond_to do |format|
      if @graduation.save
        format.html { redirect_to @graduation, notice: 'Graduação foi criada com sucesso.' }
        format.json { render action: 'show', status: :created, location: @graduation }
      else
        format.html { render action: 'new' }
        format.json { render json: @graduation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /graduations/1
  # PATCH/PUT /graduations/1.json
  def update
    respond_to do |format|
      if @graduation.update(graduation_params)
        format.html { redirect_to @graduation, notice: 'Graduação foi actualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @graduation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /graduations/1
  # DELETE /graduations/1.json
  def destroy
    @graduation.destroy
    respond_to do |format|
      format.html { redirect_to graduations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_graduation
      @graduation = Graduation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def graduation_params
      params.require(:graduation).permit(:name, :order, :price, :active)
    end
end
