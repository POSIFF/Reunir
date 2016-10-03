class PautasController < ApplicationController
  respond_to :html
  before_filter :get_reuniao
  before_action :set_pauta, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /pautas
  # GET /pautas.json
def index
    @pautas = @reuniao.pautas
    respond_to do |format|
      format.html
    end
  end

  def show
    @pauta= @reuniao.pautas.find params[:id]
    respond_to do |format|
      format.html
    end
  end

  def new
    @pauta = @reuniao.pautas.new
    respond_with @pautas
  end

  def edit
    @pauta = @reuniao.pautas.find params[:id]
    respond_with @pauta
  end

  # POST /pautas
  # POST /pautas.json
   def create
    @pauta = @reuniao.pautas.create(pauta_params)

    respond_to do |format|
      if @pauta.save
        format.html { redirect_to @reuniao}
        format.json { render :show, status: :created, location: @pauta}
      else
        format.html { render :new }
        format.json { render json: @pauta.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @pauta = @reuniao.pautas.find params[:id]
    respond_to do |format|
      if @pauta.update(pauta_params)
        format.html { redirect_to @reuniao}
        format.json { render :show, status: :ok, location: @pauta }
      else
        format.html { render :edit }
        format.json { render json: @pauta.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pauta = @reuniao.pautas.find params[:id]
    @pauta.destroy
    respond_to do |format|
      format.html { redirect_to @reuniao}
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
      params.require(:pauta).permit(:codigo, :descricao, :autor, :reuniao_id)
    end

    def get_reuniao
      @reuniao = Reuniao.find params[:reuniao_id]
    end
end
