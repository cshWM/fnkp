class RefereesController < ApplicationController
  before_action :set_referee, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user,     only: [:new, :index, :show, :edit, :update, :destroy]
  before_action :admin_user,     only: [:new, :index, :show, :edit, :update, :destroy]

  # GET /referees
  # GET /referees.json
  def index
    @referees = Referee.paginate(page: params[:page], :per_page => 15)
  end

  # GET /referees/1
  # GET /referees/1.json
  def show
  end

  # GET /referees/new
  def new
    @referee = Referee.new
  end

  # GET /referees/1/edit
  def edit
  end

  # POST /referees
  # POST /referees.json
  def create
    @referee = Referee.new(referee_params)

    if @referee.fnkp_code.blank?
      @referee.fnkp_code = Referee.maximum( "fnkp_code" ).to_i + 1
    end
    @referee.altered_by = current_user.id

    respond_to do |format|
      if @referee.save
        format.html { redirect_to @referee, notice: 'Técnico de Arbitragem criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @referee }
      else
        format.html { render action: 'new' }
        format.json { render json: @referee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /referees/1
  # PATCH/PUT /referees/1.json
  def update
    respond_to do |format|
      if @referee.fnkp_code.blank?
        @referee.fnkp_code = Referee.maximum( "fnkp_code" ).to_i + 1
      end
      @referee.altered_by = current_user.id

      if @referee.update(referee_params)
        format.html { redirect_to @referee, notice: 'Técnico de Arbitragem actualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @referee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referees/1
  # DELETE /referees/1.json
  def destroy
    @referee.destroy
    respond_to do |format|
      format.html { redirect_to referees_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referee
      @referee = Referee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def referee_params
      params.require(:referee).permit(:fnkp_code, :official_name, :import_code, :cc_code, :birthdate, :email, :mobile, :other_contact1, :other_contact2, :address, :postal_code4, :postal_code3, :municipality_id, :notes, :altered_by, :active)
    end
end
