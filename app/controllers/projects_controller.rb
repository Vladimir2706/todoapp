class ProjectsController < ApplicationController

  before_action :set_project, except: [:create]

  def create
    project = current_user.projects.new project_params
    if project.save
      flash[:success] = 'Project has been created!'
    else
      flash[:error] = 'Project is not created!'
    end
    redirect_to :root
  end

	def destroy
		if @project.destroy
      flash[:success] = 'Project has been removed!'
		else
      flash[:error] = 'Project is not removed!'
		end
    redirect_to :root
	end

	def update
		project = current_user.projects.find(params[:id])
		if project.update project_params
      flash[:success] = 'Project has been updated!'
		else
      flash[:success] = 'Project is not updated!'
		end
		redirect_to :root
	end

  def update_tasks_order
    params[:order].each.with_index do |task_id, index|
      @project.tasks.update(task_id, { order: index })
    end
  end

  private


  def project_params
    params.require(:project).permit(:name)
  end

  def set_project
    @project = current_user.projects.find(params[:id])
  end

end
