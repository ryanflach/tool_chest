class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :most_recent_tool, :current_tool_summary, :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def most_recent_tool
    @most_recent_tool ||= current_user.tools.find(session[:most_recent_tool_id]) if session[:most_recent_tool_id] && current_user
  end

  def current_tool_summary
    if session[:most_recent_tool_id]
      "#{session[:current_tool_count]} new tools added this session,
      worth a total of $#{session[:current_potential_revenue]}"
    end
  end
end
