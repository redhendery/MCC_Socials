class SchedulesController < ApplicationController
  before_action :logged_in?, only: [:available, :unavailable]
  before_action :admin_user, only: [:new, :create, :edit, :destroy]

  def socials
    @schedules = Schedule.where(team: 'Socials').order(date: :asc)
  end

  def firsts
    @schedules = Schedule.where(team: 'Firsts').order(date: :asc)
  end

  def seconds
    @schedules = Schedule.where(team: 'Seconds').order(date: :asc)
  end

  def show
    @schedule = Schedule.find(params[:id])
    @no_of_games = Schedule.where(opponent: @schedule.opponent).count
    if logged_in?
      @available = @schedule.selections.find_by(user_id: current_user.id)
    end
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
    redirect_to root_url
  end

  def available
    @schedule = Schedule.find(params[:id])
    current_user.selections.create(schedule: @schedule)
    flash[:success] = 'Thank you ' + current_user.name + ' for signing up to play!'
    redirect_to @schedule
  end

  def unavailable
    @schedule = Schedule.find(params[:id])
    @selection = Selection.find_by(schedule_id: @schedule.id, user_id: current_user.id)
    @selection.destroy
    flash[:danger] = current_user.name + ' you will not be slected to play.'
    redirect_to @schedule
  end

  private

    def schedule_params
      params.require(:schedule).permit(:date, :opponent, :start_time, :series_game,
                                  :team, :location, :home_score, :home_wickets, :home_overs,
                                  :away_score, :away_wickets, :away_overs, user_ids: [])
    end

    def admin_user
      if admin_logged_in?
      else redirect_to root_url
      end
    end

end
