class ToolsController < ApplicationController

  def index
    @tools = Tool.all
  end

  def create
    @tool = Tool.new(tool_params)
    if @tool.save
      flash[:notice] = "#{@tool.name} successfully stored!"
      session[:current_tool_count] = session[:current_tool_count].to_i + 1
      session[:current_potential_revenue] = session[:current_potential_revenue].to_f + (@tool.price * @tool.quantity)
      redirect_to @tool
    else
      flash.now[:error] = "#{@tool.errors.full_messages.join(', ')}"
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
      redirect_to @tool
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
