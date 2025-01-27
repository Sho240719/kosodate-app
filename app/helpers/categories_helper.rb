module CategoriesHelper
  def add_class(path)
    'active' if current_page?(path)
  end
end
