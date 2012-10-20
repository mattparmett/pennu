class Array
  # from rails: https://github.com/rails/rails/blob/master/activesupport/lib/active_support/core_ext/array/grouping.rb
  # Divides the array into one or more subarrays based on a delimiting +value+
  # or the result of an optional block.
  #
  #   [1, 2, 3, 4, 5].split(3)              # => [[1, 2], [4, 5]]
  #   (1..10).to_a.split { |i| i % 3 == 0 } # => [[1, 2], [4, 5], [7, 8], [10]]
  def split(value = nil, &block)
    inject([[]]) do |results, element|
      if block && block.call(element) || value == element
        results << []
      else
        results.last << element
      end

      results
    end
  end
end