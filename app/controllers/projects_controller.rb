class ProjectsController < ApplicationController

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
		project = current_user.projects.find(params[:id])
		if project.destroy
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
	end

  private


  def project_params
    params.require(:project).permit(:name)
  end
end
