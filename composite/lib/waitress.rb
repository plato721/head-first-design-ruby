class Waitress
  attr_reader :root_menu

  def initialize root_menu
    @root_menu = root_menu
  end

  def print_all
    root_menu.print
  end

  def print_where(proc)
    _all_items_where(proc, root_menu.enumerable).flatten.compact.join("")
  end

  private
  def _all_items_where(proc, collection)
    collection.map do |menu_component|
      if menu_component.is_a? MenuItem
        menu_component.print if proc.call(menu_component)
      else
        _all_items_where(proc, menu_component.enumerable)
      end
    end
  end
end
