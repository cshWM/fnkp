class CoachesController < ApplicationController
  before_action :set_coach, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user,     only: [:new, :index, :show, :edit, :update, :destroy]
  before_action :admin_user,     only: [:new, :index, :show, :edit, :update, :destroy]

  # GET /coaches
  # GET /coaches.json
  def index
    @coaches = Coach.paginate(page: params[:page], :per_page => 15)
  end

  # GET /coaches/1
  # GET /coaches/1.json
  def show
  end

  # GET /coaches/new
  def new
    @coach = Coach.new
  end

  # GET /coaches/1/edit
  def edit
  end

  # POST /coaches
  # POST /coaches.json
  def create
    @coach = Coach.new(coach_params)

    if @coach.fnkp_code.blank?
      @coach.fnkp_code = Coach.maximum( "fnkp_code" ).to_i + 1
    end
    @coach.altered_by = current_user.id

    respond_to do |format|
      if @coach.save
        format.html { redirect_to @coach, notice: 'Treinador criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @coach }
      else
        format.html { render action: 'new' }
        format.json { render json: @coach.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coaches/1
  # PATCH/PUT /coaches/1.json
  def update

    respond_to do |format|
      if @coach.fnkp_code.blank?
        @coach.fnkp_code = Coach.maximum( "fnkp_code" ).to_i + 1
      end
      @coach.altered_by = current_user.id

      if @coach.update(coach_params)
        format.html { redirect_to @coach, notice: 'Treinador actualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @coach.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coaches/1
  # DELETE /coaches/1.json
  def destroy
    @coach.destroy
    respond_to do |format|
      format.html { redirect_to coaches_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coach
      @coach = Coach.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coach_params
      params.require(:coach).permit(:fnkp_code, :ipdj_code, :official_name,
                                                :import_code, :cc_code, :birthdate, :active,
                                                :email, :mobile, :other_contact1, :other_contact2,
                                                :address, :postal_code4, :postal_code3,
                                                :municipality_id, :notes)
    end
end
