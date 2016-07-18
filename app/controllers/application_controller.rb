class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :most_recent_tool, :current_tool_summary

  def most_recent_tool
    if Tool.any?
      session[:most_recent_tool_id] = Tool.last.id
      Tool.find(session[:most_recent_tool_id])
    end
  end

  def current_tool_summary
    if session[:most_recent_tool_id]
      "#{session[:current_tool_count]} new tools added this session,
      worth a total of $#{session[:current_potential_revenue]}"
    end
  end
end
