class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def create
    work = Work.create params[:work]
    redirect_to work
  end

  def new
    @work = Work.new
  end

  def edit
    @work = Work.find params[:id]
  end

  def show
    @work = Work.find params[:id]
  end

  def update
    work = Work.find params[:id]
    work.update_attributes params[:work]
    redirect_to work
  end

  def destroy
    work = Work.find params[:id]
    work.destroy
    redirect_to works_path
  end
end
