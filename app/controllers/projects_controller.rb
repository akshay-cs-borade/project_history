class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update]
  before_action :authorize_project_creation, only: [:new, :create]

  def new
    @project = Project.new
  end
  
  def edit
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project, notice: "Project successfully created."
    else
      render :new
    end
  end


  def index
    @projects = case current_user.role
                when "admin"
                  Project.all
                when "manager"
                  Project.where(manager_id: current_user.id)
                when "developer"
                  Project.where(developer_id: current_user.id)
                else
                  Project.none
                end
  end

  def show
    authorize_project!(@project)
    @comments = @project.comments.order(created_at: :asc)
    @histories = @project.histories.order(created_at: :asc)
  end

  def update
    if current_user.admin? || (current_user.manager?) || (current_user.developer? && @project.developer_id.eql?(current_user.id) )
      if @project.update(project_params)
        redirect_to @project, notice: "Project updated successfully."
      else
        render :edit
      end
    else
      redirect_to @project, alert: "You are not authorized to assign or update this project."
    end
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :status, :manager_id, :developer_id)
  end

  def authorize_project!(project)
    unless current_user.admin? || project.manager == current_user || project.developer == current_user
      redirect_to projects_path, alert: "You are not authorized to view this project."
    end
  end

  def authorize_project_creation
    unless current_user.admin? || current_user.manager?
      redirect_to projects_path, alert: "You are not authorized to create a project."
    end
  end
end
