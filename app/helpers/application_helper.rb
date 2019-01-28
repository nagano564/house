module ApplicationHelper

  def error_messages_for(object)
    render(:partial => 'application/error_message', :locals => {:object => object})
  end

  def get_active_class(path)
    'active' if current_page?(path)
  end
  
end
