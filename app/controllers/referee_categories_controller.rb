class RefereeCategoriesController < ApplicationController
  before_action :set_referee_category, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user,     only: [:new, :index, :show, :edit, :update, :destroy]
  before_action :admin_user,     only: [:new, :index, :show, :edit, :update, :destroy]


  # GET /referee_categories
  # GET /referee_categories.json
  def index
    @referee_categories = RefereeCategory.paginate(page: params[:page], :per_page => 15)
  end

  # GET /referee_categories/1
  # GET /referee_categories/1.json
  def show
  end

  # GET /referee_categories/new
  def new
    @referee_category = RefereeCategory.new
  end

  # GET /referee_categories/1/edit
  def edit
  end

  # POST /referee_categories
  # POST /referee_categories.json
  def create
    @referee_category = RefereeCategory.new(referee_category_params)

    respond_to do |format|
      if @referee_category.save
        format.html { redirect_to @referee_category, notice: 'Categoria de arbitragem foi criada com sucesso.' }
        format.json { render action: 'show', status: :created, location: @referee_category }
      else
        format.html { render action: 'new' }
        format.json { render json: @referee_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /referee_categories/1
  # PATCH/PUT /referee_categories/1.json
  def update
    respond_to do |format|
      if @referee_category.update(referee_category_params)
        format.html { redirect_to @referee_category, notice: 'Categoria de arbitragem foi actualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @referee_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referee_categories/1
  # DELETE /referee_categories/1.json
  def destroy
    @referee_category.destroy
    respond_to do |format|
      format.html { redirect_to referee_categories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referee_category
      @referee_category = RefereeCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def referee_category_params
      params.require(:referee_category).permit(:name, :order, :active)
    end
end
