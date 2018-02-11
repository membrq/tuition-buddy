class RequestsController < ApplicationController

  def index
    @requests = Request.all
    #@requests = Request.visible_to(current_user)
  end

  def new
    @request = Request.new
  end

  def create
    @user = User.find(params[:user_id])
    @request = @user.requests.new(request_params)
    @request.user = current_user

    if @request.save
      flash[:notice] = "Your request has been saved!"
      redirect_to [@request.user, @request]
    else
      flash.now[:alert] = "There was an error saving your request. Please try again."
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
    @request = Request.find(params[:id])
  end

  def edit
    @user = User.find(params[:user_id])
    @request = Request.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @request = @user.requests.find(params[:id])

    if @request.update(request_params)
      redirect_to [@request.user, @request], notice: "Request was successfully updated!"
    else
      flash.now[:error] = "An error occurred. Request was not updated."
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @request = @user.requests.find(params[:id])

    if @request.destroy
      flash[:notice] = "Request was deleted."
      redirect_to [@user]
    else
      flash[:alert] = "Request was not deleted. Try again."
      redirect_to [@user] 
    end
  end

  private

  def request_params
    params.require(:request).permit(:id, :amount_requested, :amount_paid, :notes,
    :date_processed, :documents_submitted, :processing_status, :request_approved,
    :user_id)
  end
end
