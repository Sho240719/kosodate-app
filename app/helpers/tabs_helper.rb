module TabsHelper
  def add_active_class(path)
    'active' if Array(path).any? { |p| current_page?(p) }
  end
end
