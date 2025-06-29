class GoalKvmsController < ApplicationController
  before_action :set_goal_kvm, only: %i[ show edit update destroy ]

  # GET /goal_kvms or /goal_kvms.json
  def index
    @goal_kvms = GoalKvm.all
  end

  # GET /goal_kvms/1 or /goal_kvms/1.json
  def show
  end

  # GET /goal_kvms/new
  def new
    @goal_kvm = GoalKvm.new
  end

  # GET /goal_kvms/1/edit
  def edit
  end

  # POST /goal_kvms or /goal_kvms.json
  def create
    @goal_kvm = GoalKvm.new(goal_kvm_params)

    respond_to do |format|
      if @goal_kvm.save
        format.html { redirect_to @goal_kvm, notice: "Goal kvm was successfully created." }
        format.json { render :show, status: :created, location: @goal_kvm }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @goal_kvm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goal_kvms/1 or /goal_kvms/1.json
  def update
    respond_to do |format|
      if @goal_kvm.update(goal_kvm_params)
        format.html { redirect_to @goal_kvm, notice: "Goal kvm was successfully updated." }
        format.json { render :show, status: :ok, location: @goal_kvm }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @goal_kvm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goal_kvms/1 or /goal_kvms/1.json
  def destroy
    @goal_kvm.destroy!

    respond_to do |format|
      format.html { redirect_to goal_kvms_path, status: :see_other, notice: "Goal kvm was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal_kvm
      @goal_kvm = GoalKvm.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def goal_kvm_params
      params.expect(goal_kvm: [ :goal_id, :kvm_id ])
    end
end
