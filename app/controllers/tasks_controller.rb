class TasksController < ApplicationController

  def create
    project = current_user.projects.find(params[:task][:project_id])
    task = project.tasks.new task_params
    if task.save
      flash[:success] = 'Task has been created!'
    else
      flash[:error] = 'Task is not created!'
    end
    redirect_to :root
  end

	def destroy
    task = project.tasks task_params
		if task.destroy
      flash[:success] = 'Task has been removed!'
		else
      flash[:error] = 'Task is not removed!'
		end
    redirect_to :root
	end

	def update
		# project = current_user.projects.find(params[:id])
		# if project.update project_params
    #   flash[:success] = 'Project has been updated!'
		# else
    #   flash[:success] = 'Project is not updated!'
		# end
	end

  private


  def task_params
    params.require(:task).permit(:name, :done, :project_id)
  end
end
