class SchedulesController < ApplicationController
  before_action :admin_user, only: [:new, :create, :edit, :destroy]

  def index
    @schedules = Schedule.where(nil)
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      flash[:success] = 'Game Added!'
      redirect_to @schedule
    else
      render 'new'
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update_attributes(schedule_params)
      flash[:success] = 'Game Updated!'
      redirect_to @schedule
    else
      render 'edit'
    end
  end

  def destroy
    Schedule.find(params[:id]).destroy
    flash[:success] = 'Game deleted'
    redirect_to schedules_url
  end

  def availability
    if logged_in?
      user ||= current_user
      @schedule = Schedule.find(params[:id])
      @schedule.user_ids = user.id
      flash[:success] = 'Thank you ' + user.name + ' for signing up to play!'
      redirect_to @schedule
    end
  end

  private

    def schedule_params
      params.require(:schedule).permit(:date, :opponent, :series_game, :location)
    end

    def admin_user
      if logged_in? && current_user.admin?
      else
        redirect_to root_url
      end
    end
end
