class KvasController < ApplicationController
  before_action :set_kva, only: %i[ show edit update destroy ]

  # GET /kvas or /kvas.json
  def index
    @kvas = Kva.all
  end

  # GET /kvas/1 or /kvas/1.json
  def show
  end

  # GET /kvas/new
  def new
    @kva = Kva.new
  end

  # GET /kvas/1/edit
  def edit
  end

  # POST /kvas or /kvas.json
  def create
    @kva = Kva.new(kva_params)

    respond_to do |format|
      if @kva.save
        format.html { redirect_to @kva, notice: "Kva was successfully created." }
        format.json { render :show, status: :created, location: @kva }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kva.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kvas/1 or /kvas/1.json
  def update
    respond_to do |format|
      if @kva.update(kva_params)
        format.html { redirect_to @kva, notice: "Kva was successfully updated." }
        format.json { render :show, status: :ok, location: @kva }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kva.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kvas/1 or /kvas/1.json
  def destroy
    @kva.destroy!

    respond_to do |format|
      format.html { redirect_to kvas_path, status: :see_other, notice: "Kva was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kva
      @kva = Kva.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def kva_params
      params.expect(kva: [ :name, :description ])
    end
end
