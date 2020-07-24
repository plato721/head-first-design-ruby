class MenuComponent
  def self.from_yaml(record, menu=nil)
    if Array(record["items"]).length > 0 || record["type"] == "menu"
      Menu
    else
      MenuItem
    end.from_yaml(record, menu)
  end

  def name
    raise NotImplementedError
  end

  def description
    raise NotImplementedError
  end

  def add(item)
    raise NotImplementedError
  end

  def remove(item)
    raise NotImplementedError
  end

  def get_child(n)
    raise NotImplementedError
  end

  def create_enumerable
    []
  end

  def vegetarian?
    raise NotImplementedError
  end

  def price
    raise NotImplementedError
  end

  def print
    raise NotImplementedError
  end
end
