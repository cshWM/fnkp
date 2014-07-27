class ClubFeeIssuesController < ApplicationController
  before_action :set_club_fee_issue, only: [:show, :edit, :update, :destroy]
  before_action :admin_user,     only: [:new, :index, :show, :edit, :update, :destroy, :createCurrent]
  # before_action :association_user, only: [:new, :index, :show, :edit, :update, :destroy, :createCurrent]
  # before_action :club_user, only: [:new, :index, :show, :edit, :update, :destroy, :createCurrent]

  # GET /club_fee_issues
  # GET /club_fee_issues.json
  def index
    @club_fee_issues = ClubFeeIssue.all if is_admin?
    # CSH rever
    @club_fee_issues = ClubFeeIssue.where( club_id: Club.find_by( association_id: current_user.id) ) if is_association?
    @club_fee_issues = ClubFeeIssue.where( club_id: Club.find_by( user_id: current_user.id) ) if is_club?
  end

  # GET /club_fee_issues/1
  # GET /club_fee_issues/1.json
  def show
  end

  # GET /club_fee_issues/new
  def new
    @club_fee_issue = ClubFeeIssue.new
  end

  # GET /club_fee_issues/1/edit
  def edit
  end

  # POST /club_fee_issues
  # POST /club_fee_issues.json
  def create
    @club_fee_issue = ClubFeeIssue.new(club_fee_issue_params)
    @club_fee = ClubFee.find( @club_fee_issue.club_fee_id )
    @club_fee_issue.valid_year = @club_fee.valid_year
    @club_fee_issue.value = @club_fee.value

    respond_to do |format|
      if @club_fee_issue.save
        format.html { redirect_to @club_fee_issue, notice: 'Quota de Clube adicionada com sucesso.' }
        format.json { render action: 'show', status: :created, location: @club_fee_issue }
      else
        format.html { render action: 'new'}
        format.json { render json: @club_fee_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  def createCurrent
    # VER com PMG
    @club_fee_issue = ClubFeeIssue.new
    @club_fee_issue.club_fee_id = params[:club_fee_id]
    @club_fee_issue.club_id = params[:club_id]

    @club_fee = ClubFee.find( @club_fee_issue.club_fee_id )
    @club_fee_issue.valid_year = @club_fee.valid_year
    @club_fee_issue.value = @club_fee.value

    respond_to do |format|
      if @club_fee_issue.save
        if params[:clubdetail]
          format.html { redirect_to club_path(@club_fee_issue.club_id), notice: 'Quota de Clube adicionada com sucesso.' }
        else
          format.html { redirect_to @club_fee_issue, notice: 'Quota de Clube adicionada com sucesso.' }
        end
        format.json { render action: 'show', status: :created, location: @club_fee_issue }
      else
        format.html { render action: 'new' }
        format.json { render json: @club_fee_issue.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /club_fee_issues/1
  # PATCH/PUT /club_fee_issues/1.json
  def update
    respond_to do |format|

      if @club_fee_issue.update(club_fee_issue_params)
        @club_fee = ClubFee.find( @club_fee_issue.club_fee_id )
        @club_fee_issue.valid_year = @club_fee.valid_year
        @club_fee_issue.value = @club_fee.value
        @club_fee_issue.save
        if params[:from]
          format.html { redirect_to @club, notice: 'Quota de Clube actualizada com sucesso.' }
        else
          format.html { redirect_to @club_fee_issue, notice: 'Quota de Clube actualizada com sucesso.' }
        end
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @club_fee_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /club_fee_issues/1
  # DELETE /club_fee_issues/1.json
  def destroy
    @club_fee_issue.destroy
    respond_to do |format|
      if params[ :clubdetail ]
        flash[:notice] = "Quota apagada com sucesso"
        format.html { redirect_to club_url( @club_fee_issue.club_id ) }
      else
        format.html { redirect_to club_fee_issues_url }
      end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club_fee_issue
      @club_fee_issue = ClubFeeIssue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def club_fee_issue_params
      params.require(:club_fee_issue).permit(:club_fee_id, :club_id, :value, :valid_year, :state, :state_date)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def club_fee_issue_params_short
      params.permit( :club_fee_id, :club_id)
    end
end
