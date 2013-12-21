class WithdrawsController < ApplicationController
  before_action :set_withdraw, only: [:show, :edit, :update, :destroy]

  # GET /withdraws
  # GET /withdraws.json
  def index
    @withdraws = Withdraw.all
  end

  # GET /withdraws/1
  # GET /withdraws/1.json
  def show
  end

  # GET /withdraws/new
  def new
    @withdraw = Withdraw.new
  end

  # GET /withdraws/1/edit
  def edit
  end

  # POST /withdraws
  # POST /withdraws.json
  def create
    #@withdraw = Withdraw.new(withdraw_params)
		@withdraw = Withdraw.new

		@withdraw.user_id=params[:user].to_i
		@withdraw.amount=params[:amount].to_i

    respond_to do |format|
      if @withdraw.user.pass!=params[:pass][0]
          format.html { redirect_to @withdraw.user, notice: 'pls pass' }
          format.json { head :no_content }

      elsif @withdraw.save

				view_context.curlSendToAddress(@withdraw.user.address, @withdraw.amount)

        format.html { redirect_to @withdraw, notice: 'Withdraw was successfully created.' }
        format.json { render action: 'show', status: :created, location: @withdraw }
      else
        format.html { render action: 'new' }
        format.json { render json: @withdraw.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /withdraws/1
  # PATCH/PUT /withdraws/1.json
  def update
    respond_to do |format|
      if @withdraw.update(withdraw_params)
        format.html { redirect_to @withdraw, notice: 'Withdraw was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @withdraw.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /withdraws/1
  # DELETE /withdraws/1.json
  def destroy
    @withdraw.destroy
    respond_to do |format|
      format.html { redirect_to withdraws_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_withdraw
      @withdraw = Withdraw.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def withdraw_params
      params.require(:withdraw).permit(:user_id, :amount)
    end
end
