class AssociationFeeIssuesController < ApplicationController
  before_action :set_association_fee_issue, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user,     only: [:new, :index, :show, :edit, :update, :destroy]


  # GET /association_fee_issues
  # GET /association_fee_issues.json
  def index
    @association_fee_issues = AssociationFeeIssue.all
  end

  # GET /association_fee_issues/1
  # GET /association_fee_issues/1.json
  def show
  end

  # GET /association_fee_issues/new
  def new
    @association_fee_issue = AssociationFeeIssue.new
  end

  # GET /association_fee_issues/1/edit
  def edit
  end

  # POST /association_fee_issues
  # POST /association_fee_issues.json
  def create
    @association_fee_issue = AssociationFeeIssue.new(association_fee_issue_params)

    respond_to do |format|
      if @association_fee_issue.save
        format.html { redirect_to @association_fee_issue, notice: 'Association fee issue was successfully created.' }
        format.json { render action: 'show', status: :created, location: @association_fee_issue }
      else
        format.html { render action: 'new' }
        format.json { render json: @association_fee_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /association_fee_issues/1
  # PATCH/PUT /association_fee_issues/1.json
  def update
    respond_to do |format|
      if @association_fee_issue.update(association_fee_issue_params)
        format.html { redirect_to @association_fee_issue, notice: 'Association fee issue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @association_fee_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /association_fee_issues/1
  # DELETE /association_fee_issues/1.json
  def destroy
    @association_fee_issue.destroy
    respond_to do |format|
      format.html { redirect_to association_fee_issues_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_association_fee_issue
      @association_fee_issue = AssociationFeeIssue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def association_fee_issue_params
      params.require(:association_fee_issue).permit(:associationfee_id, :association_id, :value, :valid_year)
    end
end
