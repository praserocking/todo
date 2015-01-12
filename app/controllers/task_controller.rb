class TaskController < ApplicationController
  def new
	temp=task_params
	temp[:user_id]=session[:userid]
	temp[:status]="undone"
	@tmp_task=Task.new(temp)
	if @tmp_task.save
		flash[:success]="Task successfully created!"
		redirect_to "/task/home"
	else
		flash[:danger]="Task Creation had an error #{@tmp_task.errors.full_messages}"
		redirect_to "/task/home"
	end
  end

  def del_task
  	if Task.delete(params[:id])==1
  		flash[:success]="Task successfully deleted"
  	else
  		flash[:danger]="Some error has occured!"
  	end
  	redirect_to "/task/home"
  end

  def home
  	if session[:userid]!=nil
  		@user=User.find(session[:userid])
  		@task=Task.new
  		@task_array=Task.where("user_id=?",session[:userid])
  	else
  		redirect_to "/login"
  	end
  end

  def logout
  	session[:userid]=nil
  	redirect_to "/login"
  end

  private
  	def task_params
  		params.require(:task).permit(:description)
  	end
end
