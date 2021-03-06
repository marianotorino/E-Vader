class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  add_flash_types :contact_notice
  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @edad = ((Date.current - @client.birthdate)/365).to_i
    @anios = Hash.new(0)
    @personas = Hash.new(0)
    @cant_bills_by_month = Hash.new(0)
    @client.bills.each do |bill|
      @anios[bill.date.year] += bill.amount
      @personas[bill.person] += bill.amount
      @cant_bills_by_month[bill.date.month] += 1 if Date.today.year == bill.date.year
    end
    @cant_bills_by_month = @cant_bills_by_month.sort_by { |k,v| k }.map do |k, v|
      k,v = Date::MONTHNAMES[k],v
    end
    @anios = @anios.sort_by { |k,v| k }
    @personas = @personas.sort_by { |k,v| -v }.first 5
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'El cliente ha sido creado.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'El cliente ha sido actualizado.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'El cliente ha sido eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:name, :surname, :dni, :gender, :birthdate, :cuit)
    end
end
