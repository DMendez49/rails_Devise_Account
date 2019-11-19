class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  before_action :set_current_user, only: [:index]

  def index
    @accounts = current_user.accounts
  end

  def show
  end

  def new
    @account = current_user.accounts.new
  end

  def update
    if @account.update(account_params)
      redirect_to @account
    else
      render :edit
  end
end

def create 
  @account = current_user.accounts.new(account_params)
  if @account.save
    flash[:success]= "Account Created"
    redirect_to accounts_path(@account)
  else
    flash[:error] = "Error #{@account.errors.full_messages.join("\n")}"
    render :new
   end 
  end

  def edit
  end

  def destroy
    @account.destroy
    redirect_to accounts_path
  end

  private 
  def set_account
    @account = current_user.accounts.find(params[:id])
  end


  def set_current_user  
    @current_user = session[:user_id] ? User.find(session[:user_id]) : nil
  end

  def account_params
    params.require(:account).permit(:name, :cost)
  end
end
