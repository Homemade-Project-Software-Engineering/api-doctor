class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  respond_to :json, :html
  # GET /users
  # GET /users.json
  def index
    @users = User.all
    respond_to do |format|
      format.json
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    respond_to do |format|
        format.json { render json: @user,:include => [:alarms,{caregivers:{:include=>[:alarms],:only => [:id, :name,:email]}},patients:{:include=>[:alarms],:only => [:id, :name,:email]}], :only => [:id, :name,:email] }
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_with(@user) do |format|
      if @user.save
        format.html { render nothing: true, status: :unauthorized }
        format.json { render :json => @user.as_json }
      else
        format.html { render nothing: true, status: :unauthorized }
        format.json { render :json => @user.errors.as_json }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_with(@user) do |format|
      if @user.update(user_params)
        format.html { render nothing: true, status: :unauthorized }
        format.json { render :json => @user.as_json }
      else
        format.html { render nothing: true, status: :unauthorized }
        format.json { render :json => @user.errors.as_json }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
      if @user.destroy
        render json: { notice:"ok" }
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.fetch(:user, {}).permit(:name,:email,:password)
    end
end
