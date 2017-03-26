class DeleteAccountsController < ApplicationController

  def index
    @deleted = DeleteAccount.all
  end

  def create
    DeleteAccount.create(account_params).order("created_at DESC")
    render nothing: true
  end

  private

  def account_params
    params.require(:delete_account).permit(:user_id, :comment, :purpose)
  end

end
