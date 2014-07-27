class AthletesController < ApplicationController
  before_action :set_athlete, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user,     only: [:new, :index, :show, :edit, :update, :destroy]
  before_action :admin_user,     only: [:destroy]

  # GET /athletes
  # GET /athletes.json
  def index
    @athletes = Athlete.paginate(page: params[:page], :per_page => 15)
  end

  # GET /athletes/1
  # GET /athletes/1.json
  def show
  end

  # GET /athletes/new
  def new
    @athlete = Athlete.new
  end

  # GET /athletes/1/edit
  def edit
  end

  # POST /athletes
  # POST /athletes.json
  def create
    @athlete = Athlete.new(athlete_params)
    unless @athlete.fnkp_code.present? and @athlete.fnkp_code != ''
      @athlete.fnkp_code = Athlete.maximum( "fnkp_code" ).to_i + 1
    end
    @athlete.altered_by = current_user.id
    @athlete.active = true
    @athlete.is_current = false
    name = @athlete.name.split(' ')
    @athlete.short_name = "#{name.first} #{name.last}" if name.length > 1
    @athlete.short_name = "#{name.first}" if name.length == 1


    respond_to do |format|
      if @athlete.save
        if params[ :shortform ]
          @athlete = Athlete.new(club_id: @athlete.club_id)
          @club = Club.find( @athlete.club_id )
          #flash[:notice] = "Atleta inserido com sucesso"
          #format.html { render 'clubs/show' }
          format.html { redirect_to club_path(@athlete.club_id), notice: 'Atleta criado com sucesso.' }
        else
          format.html { redirect_to @athlete, notice: 'Atleta criado com sucesso.' }
          format.json { render action: 'show', status: :created, location: @athlete }
        end
      else
        if params[ :shortform ]
          @club = Club.find( @athlete.club_id )
          flash[:error] = @athlete.errors.full_messages.join(".<br>").html_safe
          format.html { redirect_to club_path(@athlete.club_id) }
        else
          format.html { render action: 'new' }
          format.json { render json: @athlete.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /athletes/1
  # PATCH/PUT /athletes/1.json
  def update
    @athlete.altered_by = current_user.id
    namesplit = @athlete.name.split(' ')
    @athlete.short_name = "#{namesplit.first} #{namesplit.last}" if namesplit.length > 1
    @athlete.short_name = "#{namesplit.first}" if namesplit.length == 1

    respond_to do |format|

      if @athlete.update(athlete_params)
        if params[ :shortform ] or params[ :clubdetail ]
          @club = Club.find( @athlete.club_id )
          format.html { redirect_to club_path(@athlete.club_id), notice: 'Atleta criado com sucesso.' }
        else
          format.html { redirect_to @athlete, notice: 'Atleta actualizado com sucesso.' }
        end
        format.json { head :no_content }
      else
        if params[ :shortform ] or params[ :clubdetail ]
          @club = Club.find( @athlete.club_id )
          flash[:error] = @athlete.errors.full_messages.join(".<br>").html_safe
          format.html { redirect_to club_path(@athlete.club_id) }
        else
          format.html { render action: 'edit' }
        end
        format.json { render json: @athlete.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /athletes/1
  # DELETE /athletes/1.json
  def destroy
    # @athlete.destroy
    @athlete.active = false;
    @athlete.save;
    respond_to do |format|
      if params[ :clubdetail ]
        format.html { redirect_to club_url( @athlete.club_id ) }
      else
        format.html { redirect_to athletes_url }
      end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_athlete
      @athlete = Athlete.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def athlete_params
      params.require(:athlete).permit(:name, :short_name, :sex, :birthdate, :club_id, :active, :national, :fnkp_code, :cc_code)
    end
end
