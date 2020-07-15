class MenuComponent
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

  def create_iterator
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
