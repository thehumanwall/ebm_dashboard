class KvmsController < ApplicationController
  before_action :set_kvm, only: %i[ show edit update destroy ]

  # GET /kvms or /kvms.json
  def index
    @kvms = Kvm.all
  end

  # GET /kvms/1 or /kvms/1.json
  def show
  end

  # GET /kvms/new
  def new
    @kvm = Kvm.new
  end

  # GET /kvms/1/edit
  def edit
  end

  # POST /kvms or /kvms.json
  def create
    @kvm = Kvm.new(kvm_params)

    respond_to do |format|
      if @kvm.save
        format.html { redirect_to @kvm, notice: "Kvm was successfully created." }
        format.json { render :show, status: :created, location: @kvm }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kvm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kvms/1 or /kvms/1.json
  def update
    respond_to do |format|
      if @kvm.update(kvm_params)
        format.html { redirect_to @kvm, notice: "Kvm was successfully updated." }
        format.json { render :show, status: :ok, location: @kvm }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kvm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kvms/1 or /kvms/1.json
  def destroy
    @kvm.destroy!

    respond_to do |format|
      format.html { redirect_to kvms_path, status: :see_other, notice: "Kvm was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kvm
      @kvm = Kvm.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def kvm_params
      params.expect(kvm: [ :name, :description, :unit_of_measure, :is_active, :organization_id, :kva_id ])
    end
end
