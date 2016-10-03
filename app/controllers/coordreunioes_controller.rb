class CoordreunioesController < ApplicationController
  before_action :set_coordreuniao, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /coordreunioes
  # GET /coordreunioes.json
  def index
    @coordreunioes = Coordreuniao.all
  end

  # GET /coordreunioes/1
  # GET /coordreunioes/1.json
  def show
  end

  # GET /coordreunioes/new
  def new
    @coordreuniao = Coordreuniao.new
  end

  # GET /coordreunioes/1/edit
  def edit
  end

  # POST /coordreunioes
  # POST /coordreunioes.json
  def create
    @coordreuniao = Coordreuniao.new(coordreuniao_params)

    respond_to do |format|
      if @coordreuniao.save
        format.html { redirect_to @coordreuniao }
        format.json { render :show, status: :created, location: @coordreuniao }
      else
        format.html { render :new }
        format.json { render json: @coordreuniao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coordreunioes/1
  # PATCH/PUT /coordreunioes/1.json
  def update
    respond_to do |format|
      if @coordreuniao.update(coordreuniao_params)
        format.html { redirect_to @coordreuniao}
        format.json { render :show, status: :ok, location: @coordreuniao }
      else
        format.html { render :edit }
        format.json { render json: @coordreuniao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coordreunioes/1
  # DELETE /coordreunioes/1.json
  def destroy
    @coordreuniao.destroy
    respond_to do |format|
      format.html { redirect_to coordreunioes_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coordreuniao
      @coordreuniao = Coordreuniao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coordreuniao_params
      params.require(:coordreuniao).permit(:matricula, :nome, :funcao, :foto)
    end
end
