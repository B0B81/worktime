class WorkfilesController < ApplicationController
  before_action :find_workfile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @workfile = if params[:term]
      Workfile.where('title LIKE ?', "%#{params[:term]}%").order('id DESC')
    else
      Workfile.all.order("date DESC")
    end
  end

  def show
  end

  def new
    @workfile = current_user.workfiles.build
  end

  def create
    @workfile = current_user.workfiles.build(workfile_params)

    if @workfile.save
      redirect_to @workfile, notice: "Successfully created new Workfile"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @workfile.update(workfile_params)
      redirect_to @workfile
    else
      render 'edit'
    end
  end

  def destroy
    @workfile.destroy
    redirect_to root_path, notice: "Successfully deleted Workfile"
  end

  private

  def find_workfile
    @workfile = Workfile.find(params[:id])
  end

  def workfile_params
    params.require(:workfile).permit(:title, :description, :date, :term)
  end

end
