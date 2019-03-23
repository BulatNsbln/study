module Exercise
  module Arrays
    class << self
      def replace(array)
        max_elem_of_array = 0
        new_array = []

        array.each do |item|
          item > max_elem_of_array && max_elem_of_array = item
        end
        array.each do |item|
          item > 0 ? new_array.push(max_elem_of_array) : new_array.push(item)
        end

        new_array
      end

      def search(array, query)
        low = 0
        high = array.length - 1

        while low <= high

          middle = (low + high) / 2
          item = array[middle]

          return middle if item == query

          if item > query
            high = middle - 1
          else
            low = middle + 1
          end

        end

        -1
      end
    end
  end
end
