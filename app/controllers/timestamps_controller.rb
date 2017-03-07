class TimestampsController < ApplicationController
  before_action :find_timestamp, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def create
    @workfile = Workfile.find(params[:workfile_id])
    @timestamp = @workfile.timestamps.create(params[:timestamp].permit(:description, :ordernumber, :begin_date, :begin_time))
    @timestamp.user_id = current_user.id if current_user
    @timestamp.save

    if @timestamp.save
      redirect_to workfile_path(@workfile)
    else
      render 'new'
    end
  end

  def edit
  end

  def update

    if @timestamp.update(params[:timestamp].permit(:description, :ordernumber, :begin_date, :begin_time))
      redirect_to workfile_path(@workfile)
    else
      render 'edit'
    end
  end

  def destroy
    @timestamp.destroy
    redirect_to workfile_path(@workfile)
  end

private

  def find_timestamp
    @workfile = Workfile.find(params[:workfile_id])
    @timestamp = @workfile.timestamps.find(params[:id])
  end
end
