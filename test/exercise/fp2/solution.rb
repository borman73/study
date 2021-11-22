module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each (&func)
        first, *rest = self
        return if rest.empty?

        func.call(first)
        MyArray.new(rest).my_each(&func)
        self
      end

      # Написать свою функцию my_map
      def my_map
        result = MyArray.new

        my_reduce(result) { |acc, item| acc << yield(item) }
      end
      
      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new

        my_reduce(result) { |acc, item| item.nil? ? acc : acc << item }
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &func)
        first, *rest = self
        if acc.nil?
          acc = first
          first, *rest = rest
        end
        acc = func.call(acc, first)
        return acc if rest.empty? 

        MyArray.new(rest).my_reduce(acc, &func)
      end
    end
  end
end
