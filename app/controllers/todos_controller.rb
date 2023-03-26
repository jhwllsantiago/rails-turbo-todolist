class TodosController < ApplicationController
  before_action :set_todo, only: %i[ show edit update destroy ]

  def index
    @todo = Todo.new
    @todos = Todo.order(created_at: :desc)
  end

  def show
    respond
  end

  def create
    @todo = Todo.new(todo_params)
    @count = Todo.count + 1

    respond if @todo.save
  end

  def edit
    respond if @todo.present?
  end

  def update
    respond if @todo.update(todo_params)
  end

  def destroy
    @todo.destroy
    @count = Todo.count

    respond
  end

  private
  def todo_params
    params.require(:todo).permit(:title)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def respond
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to root_path }
    end
  end
end
