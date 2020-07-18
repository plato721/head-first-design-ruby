class Waitress
  attr_reader :root_menu

  def initialize root_menu
    @root_menu = root_menu
  end

  def print
    root_menu.print
  end

  def print_items(proc, collection=nil)
    collection ||= root_menu.enumerable
    # some other things here
    # collection.reduce("") do |memo, menu_component|
    #   memo << if menu_component.is_a? Menu
    #     memo << print_items(proc, menu_component)
    #   else
    #     menu_component if proc.call(menu_component)
    #   end
    # end.flatten.compact.
  end
end
