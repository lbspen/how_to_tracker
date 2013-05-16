class StepsController < ApplicationController
  before_filter :find_task
  before_filter :find_step, :only => [:show, :edit, :update, :destroy]

  def new
    @step = @task.steps.build
  end

  def create
    @step = @task.steps.build(params[:step])
    if @step.save
      flash[:notice] = "Step has been created."
      redirect_to [@task, @step]
    else
      flash[:alert] = "Step has not been created."
      render :action => "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @step.update_attributes(params[:step])
      flash[:notice] = "Step has been updated."
      redirect_to [@task, @step]
    else
      flash[:alert] = "Step was not updated."
      render :action => "edit"
    end
  end

  private
    def find_task
      @task = Task.find(params[:task_id])
    end

    def find_step
      @step = @task.steps.find(params[:id])
    end
end
