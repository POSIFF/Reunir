class PautasController < ApplicationController
  before_action :set_pauta, only: [:show, :edit, :update, :destroy]

  # GET /pautas
  # GET /pautas.json
  def index
    @pautas = Pauta.all
  end

  # GET /pautas/1
  # GET /pautas/1.json
  def show
  end

  # GET /pautas/new
  def new
    @pauta = Pauta.new
  end

  # GET /pautas/1/edit
  def edit
  end

  # POST /pautas
  # POST /pautas.json
  def create
    @pauta = Pauta.new(pauta_params)

    respond_to do |format|
      if @pauta.save
        format.html { redirect_to @pauta, notice: 'Pauta was successfully created.' }
        format.json { render :show, status: :created, location: @pauta }
      else
        format.html { render :new }
        format.json { render json: @pauta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pautas/1
  # PATCH/PUT /pautas/1.json
  def update
    respond_to do |format|
      if @pauta.update(pauta_params)
        format.html { redirect_to @pauta, notice: 'Pauta was successfully updated.' }
        format.json { render :show, status: :ok, location: @pauta }
      else
        format.html { render :edit }
        format.json { render json: @pauta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pautas/1
  # DELETE /pautas/1.json
  def destroy
    @pauta.destroy
    respond_to do |format|
      format.html { redirect_to pautas_url, notice: 'Pauta was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pauta
      @pauta = Pauta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pauta_params
      params.require(:pauta).permit(:codigo, :descricao, :autor)
    end
end
