class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.new(project_params)
    if @project.save
      redirect_to project_path(@project)
    else
      flash.now[alert] = @project.errors.full_messages.join(', ')
      render :new
    end 
  end

  private 
    def project_params
      params.require(:project).permit(:name, :description, :link)
    end
end
