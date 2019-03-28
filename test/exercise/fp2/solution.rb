module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for item_elem in self
          yield item_elem
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        result = MyArray.new
        my_each { |item| result << yield(item) }
        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new
        my_each do |item|
          result << item unless item.class == NilClass
        end
        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(initial = nil)
        acc = initial
        my_each do |item|
          acc = acc.nil? ? item : yield(acc, item)
        end
        acc
      end
    end
  end
end
