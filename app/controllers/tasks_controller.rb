class TasksController < ApplicationController
  before_action :set_task, only: [:complete, :prioritize, :reactivate, :demote, :destroy]

  def index
    @date = Date.today
    @active = Task.all.where(:user => current_user, :active => true, :finished => false)
    @active = @active.order('priority DESC, name')
    @finished = Task.all.where(:user => current_user, :active => true, :finished => true)
    @finished = @finished.order('priority DESC, name')
    # @normal_active = Task.all.where(:user => current_user, :active => true, :finished => false, :priority => false)
    # @normal_finished = Task.all.where(:user => current_user, :active => true, :finished => true, :priority => false)
    # @priority_active = Task.all.where(:user => current_user, :active => true, :finished => false, :priority => true)
    # @priority_finished = Task.all.where(:user => current_user, :active => true, :finished => true, :priority => true)
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    @task.active = true
    @task.save
    redirect_to tasks_path
  end

  def complete
    @task.finished = true
    @task.save
    redirect_to tasks_path
  end

  def reactivate
    @task.finished = false
    @task.save
    redirect_to tasks_path
  end

  def prioritize
    @task.priority == true ? @task.priority = false : @task.priority = true;
    @task.save
    redirect_to tasks_path
  end

  def demote
    @task.priority = false
    @task.save
    redirect_to tasks_path
  end

  def remove_old
    @tasks = Task.all.where(:user => current_user, :active => true, :finished => true)
    @tasks.destroy_all
    redirect_to tasks_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
