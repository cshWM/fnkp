class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user,     only: [:new, :index, :show, :edit, :update, :destroy]


  # GET /line_items
  # GET /line_items.json
  def index
    # as associacoes só podem ver os items que dizem respeito a ordens duas e estejam validos
    # os clubes só podem ver os items que dizem respeito a si e estejam validos
    # a fnkp deve poder ver tudo (mas aparecer visualmente a cinza )
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
    # as associacoes só podem ver os items que dizem respeito a ordens duas e estejam validos
    # os clubes só podem ver os items que dizem respeito a si e estejam validos
    # a fnkp deve poder ver tudo (mas aparecer visualmente a cinza )
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
    @line_item = current_user.line_items.find(params[:id])
  end

  # POST /line_items
  # POST /line_items.json
  def create
    # só se pode adicionar items para coisas que ainda não estejam criadas como items
    #     OU
    # para coisas que já tenham estado como items, mas que estejam inactivos
    # só se pode adicionar a notas de pagamento da associação / clubes / (admin) , que estejam abertas
    #
    @line_item = LineItem.new(line_item_params)
    @order = Order.find( @line_item.order_id )
    @line_item.state = "Pendente"
    @line_item.state_date = DateTime.now
    @line_item.user_id = @order.user_id if @order # csh alterar para permitir que o admin crie notas para as associações

    # PMG como se coloca uma transaccao para poder voltar atrás?!
    respond_to do |format|
      if @line_item.save
        @order.total_value += @line_item.value if @line_item.value
        @order.save

        format.html { redirect_to "#{orders_path}/#{@line_item.order_id}" , notice: 'Item adicionado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @line_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    @order = Order.find( @line_item.order_id )
    @order.total_value -= @line_item.value if @line_item.value

    respond_to do |format|
      if @line_item.update(line_item_update_params)

        @order.total_value += @line_item.value if @line_item.value
        @order.save

        format.html { redirect_to "#{orders_path}/#{@line_item.order_id}", notice: 'Item actualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    # CSH nao se pode apagar, apenas desactivar
    # ao desactivar deixa de contar para o total e não aparece nas listas gerais, apenas para o gestor


    if @line_item.order_id
      @order = Order.find( @line_item.order_id )
      @order.total_value -= @line_item.value if @line_item.value
      @line_item.destroy
      @order.save
    else
      @line_item.destroy
    end

    respond_to do |format|
      format.html { redirect_to "#{orders_path}/#{@line_item.order_id}" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:name, :value, :state, :state_date, :order_id)
    end
    def line_item_update_params
      params.require(:line_item).permit(:name, :value, :state, :state_date)
    end
end
