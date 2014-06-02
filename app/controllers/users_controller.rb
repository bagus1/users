class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /roles_users
  # GET /roles_users.json
  def index
    @users = User.all

  end

  # GET /roles_users/1
  # GET /roles_users/1.json
  def show
  	#abort(@user.roles)
  end

  # GET /roles_users/new
  def new
  	abort("use /sign-up")
    @user = User.new
  end

  # GET /roles_users/1/edit
  def edit
  end

  # POST /roles_users
  # POST /roles_users.json
  def create
  	abort("use /sign-up")
  	@user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: ' user was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roles_users/1
  # PATCH/PUT /roles_users/1.json
  def update
  	#abort(params[:user][:role_ids].inspect)
  	params[:user][:role_ids] ||= []
	@user.role_ids = params[:user][:role_ids];# why do i need this?
  	if params[:user][:password].blank?
    	params[:user].delete(:password)
    	params[:user].delete(:password_confirmation)
  	end
	
	
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: ' user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /roles_users/1
  # DELETE /roles_users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to roles_users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password)
    end
end