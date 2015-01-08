class TaskController < ApplicationController
  def new
	temp=task_params
	temp[:user_id]=session[:userid]
	temp[:status]="undone"
	@task=Task.new(temp)

	if @task.save
		flash[:success]="Todo Saved successfully"
		redirect_to task_home_path
	else
		flash[:danger]="Unsuccessful save"
	end	
  end


  def home
  	@task_array=Task.where("user_id=?",session[:userid])
  end


  private
  	def task_params
  		params.require(:task).permit(:description)
  	end
end
