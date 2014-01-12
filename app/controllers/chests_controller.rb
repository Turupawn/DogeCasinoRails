class ChestsController < ApplicationController
  before_action :set_chest, only: [:show, :edit, :update, :destroy]

  # GET /chests
  # GET /chests.json
  def index
    @chests = Chest.all
  end

  # GET /chests/1
  # GET /chests/1.json
  def show
  end

  # GET /chests/new
  def new
    @chest = Chest.new
  end

  # GET /chests/1/edit
  def edit
  end

  # POST /chests
  # POST /chests.json
  def create
    #@chest = Chest.new(chest_params)
    @chest = Chest.new
    @user = User.find_by_id(params[:user].to_i)

    @chest.user_id = @user.id

    @chest.price=5
    prizes=[17,10,10,5,5,2,2,1,1,0,0]
    @chest.prize=prizes[rand(11)]

    respond_to do |format|
      if @user.pass!=params[:pass][0]
          format.html { redirect_to @user, notice: 'pls pass' }
          format.json { head :no_content }
      elsif view_context.getAvailableCredits(@user)<5
          format.html { redirect_to @user, notice: 'pls credit' }
          format.json { head :no_content }
      elsif @chest.save

	#view_context.curlSendToAddress @user.address @chest.prize

        format.html { redirect_to @chest, notice: 'such chestt' }
        format.json { render action: 'show', status: :created, location: @chest }
      else
        format.html { render action: 'new' }
        format.json { render json: @chest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chests/1
  # PATCH/PUT /chests/1.json
  def update
    respond_to do |format|
      if @chest.update(chest_params)
        format.html { redirect_to @chest, notice: 'Chest was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @chest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chests/1
  # DELETE /chests/1.json
  def destroy
    @chest.destroy
    respond_to do |format|
      format.html { redirect_to chests_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chest
      @chest = Chest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chest_params
      params.require(:chest).permit(:user_id, :price, :prize)
    end
end
