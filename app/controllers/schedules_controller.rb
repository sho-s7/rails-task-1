class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start_at, :end_at, :all_day, :memo))
    if @schedule.save
      flash[:success] = "スケジュールを登録しました"
      redirect_to :schedules
    else
      flash.now[:danger] = "スケジュールの登録に失敗しました"
      render "new"
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :start_at, :end_at, :all_day, :memo))
      flash[:success] = "スケジュールを編集しました"
      redirect_to :schedules
    else
      flash.now[:danger] = "スケジュールの編集に失敗しました"
      render "edit"
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:success] = "スケジュールを削除しました"
    redirect_to :schedules
  end
end
