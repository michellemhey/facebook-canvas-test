class Hash
  # Returns the value at the specified path.
  # For example, [:foo, :bar, :baz] as a path would return the
  # value at self[:foo][:bar][:baz]. If self doesn't contain one of
  # the keys specified in path, nil is returned.
  #
  # This method is useful as it simplifies statements such as:
  #   value = h[:a][:b][:c][:d] if h[:a] && h[:a][:b] && h[:a][:b][:c]
  # to
  #   value = h.value_at_path(:a, :b, :c, :d)
  # or
  #   value = h.value_at_path([:a, :b, :c, :d])
  #
  # @param Array path An array of keys specifying a deep-nested path
  # @return Object the value object
  def value_at_path(*path)
    path = path.flatten
    raise ArgumentError if path.include?(nil)
    raise ArgumentError if path.empty?

    if path.size == 1
      return self[path[0]]
    else
      if self[path[0]].respond_to?(:value_at_path)
        return self[path[0]].value_at_path(path[1..-1])
      else
        return nil
      end
    end
  end
end