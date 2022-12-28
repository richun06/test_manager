class TasksController < ApplicationController
  before_action :authenticate_user! # , only: [:new, :create] #/tasks/newに遷移しようとすると、ログイン画面に飛ばされる

  def index
    # @tasks = Task.all
    @tasks = current_user.tasks
  end

  def new
    @task = Task.new
    @labels = Label.where(user_id: current_user.id)
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
      redirect_to tasks_path, notice: "タスクを登録しました"
    else
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  #ログインしているユーザのみできるように条件分岐
  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: "タスクの編集が完了しました"
    else
      render :edit
    end
  end

    #ログインしているユーザのみできるように条件分岐
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: "タスクを削除しました"
  end

  private

  def task_params
    params.require(:task).permit(:title, :content, :user_id, { label_ids: [] })
  end
end
