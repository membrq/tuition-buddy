class UsersController < ApplicationController

   def index
     @users = User.all
   end

   def new
     @user = User.new
   end

   def create
     @user = User.new
     @user.name = params[:user][:name]
     @user.email = params[:user][:email]
     @user.password = params[:user][:password]
     @user.password_confirmation = params[:user][:password_confirmation]

     if @user.save
       flash[:notice] = "Welcome to Tuition Buddy #{current_user.name}!"
       redirect_to authenticated_root_path
     else
       flash.now[:alert] = "There was an error creating your account. Please try again."
       render :new
     end
   end

   def show
     @users = User.all
     @user = User.find_by_id(:id)
   end

   def edit
     @user = User.find_by_id(:id)
   end

   def update
     @user = User.find(params[:id])

     if @user.update(user_params)
       redirect_to @user, notice: "Update was successful!"
     else
       flash.now[:error] = "An error occurred. Update was unsuccessful."
       render :edit
     end
   end

   def destroy
      @user = User.find_by_id(:id)

      if @user.destroy
        flash[:notice] = "User was deleted. Bye Felicia!"
        redirect_to :create
      else
        flash[:alert] = "User was not deleted. Try again."
        redirect_to [@user] #revise path?
      end
   end

   private

   # Only allow a trusted parameter "white list" through.
   def user_params
     params.require(:user).permit(:id, :name, :email, :password)
   end
end
