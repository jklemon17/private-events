class UsersController < ApplicationController
  before_action :get_user

  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Congratulations, you are now a member of our secret club'
      log_in(@user)
      redirect_to @user
    else
      render 'new'
    end
  end
  def show
    if logged_in?
      if (@user = User.find_by(id: params[:id]))
      else
        @user = current_user
      end

      if @user.attending_events.where("event_invites.accepted" => false).size > 0
        @invites = @user.attending_events.where("event_invites.accepted" => false).order(:date)
      end

      if @user.attending_events.where("event_invites.accepted" => true).where("date < ?", Date.today).size > 0
        @past_events = @user.attending_events.where("event_invites.accepted" => true).where("date < ?", Date.today).order(date: "DESC")
      end

      if @user.attending_events.where("event_invites.accepted" => true).where("date >= ?", Date.today).size > 0
        @upcoming_events = @user.attending_events.where("event_invites.accepted" => true).where("date >= ?", Date.today).order(:date)
      end
    else
      redirect_to new_user_path
    end
  end
  def index
  end

  def correct_user
    current_user.id == params[:id]
  end

  private

  def get_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

end
