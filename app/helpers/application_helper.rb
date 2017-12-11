module ApplicationHelper

  def get_active_class(path)
    'active' if current_page?(path)
  end

  # def new_two_path_method

end
