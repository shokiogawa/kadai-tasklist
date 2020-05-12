class TasksController < ApplicationController
  
  
  before_action :require_user_logged_in
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
      @tasks = current_user.tasks.order(id: :desc).page(params[:page])
  end

  def show
    
    unless @task
    redirect_to root_url
    end
  end

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      flash[:success] = "タスクは正常に投稿されました"
      redirect_to root_url
    else 
      flash.now[:danger] = "タスクが投稿されませんでした"
      render :new
    end
  end

  def edit
   
  end

  def update
    
    if @task.update(task_params)
      flash[:success] = "タスクは正常に投稿されました"
      redirect_to @task
      
    else
      flash.now[:danger] = "タスクが投稿されませんでした"
      render :new
    end
  end

  def destroy
    @task.destroy
    
    flash[:success] = "タスクは正常に削除されました"
    redirect_to root_url
  end

  
  private
  
  def set_task
    @task = current_user.tasks.find_by(id: params[:id])
  end
  
  def task_params
   params.require(:task).permit(:content, :status)
  end

end
