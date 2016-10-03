class GerenciasController < ApplicationController
  before_action :set_gerencia, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /gerencias
  # GET /gerencias.json
  def index
    @gerencias = Gerencia.all
  end

  # GET /gerencias/1
  # GET /gerencias/1.json
  def show
  end

  # GET /gerencias/new
  def new
    @gerencia = Gerencia.new
  end

  # GET /gerencias/1/edit
  def edit
  end

  # POST /gerencias
  # POST /gerencias.json
  def create
    @gerencia = Gerencia.new(gerencia_params)

    respond_to do |format|
      if @gerencia.save
        format.html { redirect_to @gerencia}
        format.json { render :show, status: :created, location: @gerencia }
      else
        format.html { render :new }
        format.json { render json: @gerencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gerencias/1
  # PATCH/PUT /gerencias/1.json
  def update
    respond_to do |format|
      if @gerencia.update(gerencia_params)
        format.html { redirect_to @gerencia}
        format.json { render :show, status: :ok, location: @gerencia }
      else
        format.html { render :edit }
        format.json { render json: @gerencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gerencias/1
  # DELETE /gerencias/1.json
  def destroy
    @gerencia.destroy
    respond_to do |format|
      format.html { redirect_to gerencias_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gerencia
      @gerencia = Gerencia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gerencia_params
      params.require(:gerencia).permit(:sigla, :descricao)
    end
end
