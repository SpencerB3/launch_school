class Tree
  include Enumerable

  def each
    # an each method for Tree objects
  end

  def <=>
    # from documentation: If Enumerable#max, #min, or #sort is used, the objects in the collection must also implement a meaningful <=> operator, as these methods rely on an ordering between members of the collection.
  end
end
