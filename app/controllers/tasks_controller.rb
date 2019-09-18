class TasksController < ApplicationController

  def index
    @date = Date.today
    @tasks = Task.all.where(:user => current_user)
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    @task.active = true
    @task.save
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end

end
