class AssociationFeesController < ApplicationController
  before_action :set_association_fee, only: [:show, :edit, :update, :destroy]
  before_action :admin_user,     only: [:new, :index, :show, :edit, :update, :destroy]


  # GET /association_fees
  # GET /association_fees.json
  def index
    @association_fees = AssociationFee.paginate(page: params[:page], :per_page => 15)
  end

  # GET /association_fees/1
  # GET /association_fees/1.json
  def show
  end

  # GET /association_fees/new
  def new
    @association_fee = AssociationFee.new
  end

  # GET /association_fees/1/edit
  def edit
  end

  # POST /association_fees
  # POST /association_fees.json
  def create
    @association_fee = AssociationFee.new(association_fee_params)

    respond_to do |format|
      if @association_fee.save
        format.html { redirect_to @association_fee, notice: 'Quota de Associação criada com sucesso' }
        format.json { render action: 'show', status: :created, location: @association_fee }
      else
        format.html { render action: 'new' }
        format.json { render json: @association_fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /association_fees/1
  # PATCH/PUT /association_fees/1.json
  def update
    respond_to do |format|
      if @association_fee.update(association_fee_params)
        format.html { redirect_to @association_fee, notice: 'Quota de Associação actualizada com sucesso' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @association_fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /association_fees/1
  # DELETE /association_fees/1.json
  def destroy
    @association_fee.destroy
    respond_to do |format|
      format.html { redirect_to association_fees_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_association_fee
      @association_fee = AssociationFee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def association_fee_params
      params.require(:association_fee).permit(:name, :valid_year, :is_total, :value, :active)
    end
end
