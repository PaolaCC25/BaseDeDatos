class TodosController < ApplicationController 
  def new
  	@todo = Todo.new
  end
  def create 
  	@todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = "El registro fue guardado con exito"
    redirect_to todos_path(@todo)
  else
    render 'new'
  end
  end

  def show
    @todo = Todo.find(params[:id])
  end
  private
  def todo_params
  	params.require(:todo).permit(:nombre, :descripcion)
  end
end