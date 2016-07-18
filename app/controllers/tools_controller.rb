class ToolsController < ApplicationController
  def index
    @tools = Tool.all
    session[:most_recent_tool_id] = Tool.last.id if Tool.any?
  end

  def create
    @tool = Tool.new(tool_params)
    if @tool.save
      flash[:notice] = "#{@tool.name} successfully stored!"
      redirect_to @tool
    else
      flash[:error] = "#{@tool.errors.full_messages.join(', ')}"
      render :new
    end
  end

  def new
    @tool = Tool.new
  end

  def edit
    @tool = tool_for_page
  end

  def show
    @tool = tool_for_page
  end

  def update
    @tool = tool_for_page
    if @tool.update_attributes(tool_params)
      redirect_to tools_path
    else
      render :edit
    end
  end

  def destroy
    @tool = tool_for_page
    @tool.destroy
    redirect_to tools_path
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :quantity, :price)
  end

  def tool_for_page
    Tool.find(params[:id])
  end
end
