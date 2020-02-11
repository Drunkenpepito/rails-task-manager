class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    # on lui passe juste une variable d'instance qu'il a besoin dans form for
    @task = Task.new
  end

  def create
    @task = Task.new(task_strong_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_strong_params)
    redirect_to  tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

private

  def task_strong_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
