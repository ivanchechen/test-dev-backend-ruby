class InitsController < ApplicationController
  before_action :set_init, only: [:show, :edit, :update, :destroy]
 
  # GET /inits
  # GET /inits.json
  def index
    @inits = Init.all
  end

  # GET /inits/1
  # GET /inits/1.json
  def show
  end

  # GET /inits/new
  def new
    @init = Init.new
  end

  # GET /inits/1/edit
  def edit
  end

  # POST /inits
  # POST /inits.json
  def create
    @init = Init.new(init_params)

    respond_to do |format|
      if @init.save
        format.html { redirect_to @init, notice: 'Init was successfully created.' }
        format.json { render :show, status: :created, location: @init }
      else
        format.html { render :new }
        format.json { render json: @init.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inits/1
  # PATCH/PUT /inits/1.json
  def update
    respond_to do |format|
      if @init.update(init_params)
        format.html { redirect_to @init, notice: 'Init was successfully updated.' }
        format.json { render :show, status: :ok, location: @init }
      else
        format.html { render :edit }
        format.json { render json: @init.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inits/1
  # DELETE /inits/1.json
  def destroy
    @init.destroy
    respond_to do |format|
      format.html { redirect_to inits_url, notice: 'Init was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_init
      @init = Init.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def init_params
      params.require(:init).permit(:entrada)
    end
end
