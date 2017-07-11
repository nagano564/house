class UserChecklistController < ApplicationController

  def new
    @user = User.find(params[:id])
    @user.checklist.each do |todo, completed|
    @user.checklist[todo] = params[:user][:checklist][todo] == "1"
    end
    @user.save
    redirect_to action: :show, id: params[:id]
end
