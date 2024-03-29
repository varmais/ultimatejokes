class UsersController < ApplicationController
  before_filter :require_user, :only => [:show, :edit, :update]
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    if current_user && current_user.id.to_s == params[:id].to_s || current_user_is_admin
      @user = User.find(params[:id])
    else
      flash[:warning] = "Cannot edit info of another user!"
      redirect_to jokes_path
    end
    
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    if current_user && current_user.id.to_s == @user.id.to_s || current_user_is_admin
      respond_to do |format|
        if @user.update_attributes(params[:user])
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:warning] = "Cannot edit info of another user!"
      redirect_to jokes_path
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if current_user && current_user.id.to_s == params[:id].to_s || current_user_is_admin
      @user = User.find(params[:id])
      @user.destroy

      flash[:warning] = "User account deleted!"
      respond_to do |format|
        format.html { redirect_to users_url }
        format.json { head :no_content }
      end
    else
      flash[:warning] = "Cannot delete the account of another user!"
      redirect_to users_url
    end
    
  end
  #Promote and demote admin statuses
  def promote_to_admin
    if current_user_is_admin
      @user = User.find(params[:id])
      @user.role = "admin"
      if @user.save
        flash[:success] = "Promoted #{@user.email} to admin!"
        redirect_to users_url
      else
        flash[:warning] = "Something went wrong when promoting #{@user.email} to admin!"
        redirect_to users_url
      end 
    else 
      flash[:warning] = "You cannot promote users since you're not an admin!"
      redirect_to users_url
    end 
  end
  def demote_to_user
    if current_user_is_admin
      @user = User.find(params[:id])
      @user.role = ""
      if @user.save
        flash[:success] = "Demoted #{@user.email} to user!"
        redirect_to users_url
      else
        flash[:warning] = "Something went wrong when promoting #{@user.email} to admin!"
        redirect_to users_url
      end
    else
      flash[:warning] = "You cannot demote users since you're not an admin!" 
      redirect_to users_url
    end 
  end
end
