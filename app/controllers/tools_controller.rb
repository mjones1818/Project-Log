class ToolsController < ApplicationController
  def new
    @tool = Tool.new
  end

  def index
    
  end

  def show
    @tool = Tool.find_by(id: params[:id])
  end

  def create
    tool = Tool.create(tool_params)
    redirect_to tool
  end

  def destroy

  end

  def edit

  end

  def update
    
  end

  private
  def tool_params
    params.require(:tool).permit(:name, :description)
  end
  
end
