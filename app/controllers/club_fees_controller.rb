class ClubFeesController < ApplicationController
  before_action :set_club_fee, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user,     only: [:new, :index, :show, :edit, :update, :destroy]
  before_action :admin_user,     only: [:new, :index, :show, :edit, :update, :destroy]

  # GET /club_fees
  # GET /club_fees.json
  def index
    @club_fees = ClubFee.paginate(page: params[:page], :per_page => 15)
  end

  # GET /club_fees/1
  # GET /club_fees/1.json
  def show
  end

  # GET /club_fees/new
  def new
    @club_fee = ClubFee.new
  end

  # GET /club_fees/1/edit
  def edit
  end

  # POST /club_fees
  # POST /club_fees.json
  def create
    @club_fee = ClubFee.new(club_fee_params)

    respond_to do |format|
      if @club_fee.save
        format.html { redirect_to @club_fee, notice: 'Quota de Clube foi criada com sucesso.' }
        format.json { render action: 'show', status: :created, location: @club_fee }
      else
        format.html { render action: 'new' }
        format.json { render json: @club_fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /club_fees/1
  # PATCH/PUT /club_fees/1.json
  def update
    respond_to do |format|
      if @club_fee.update(club_fee_params)
        format.html { redirect_to @club_fee, notice: 'Quota de Clube actualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @club_fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /club_fees/1
  # DELETE /club_fees/1.json
  def destroy
    @club_fee.destroy
    respond_to do |format|
      format.html { redirect_to club_fees_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club_fee
      @club_fee = ClubFee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def club_fee_params
      params.require(:club_fee).permit(:name, :valid_year, :value, :active)
    end
end
