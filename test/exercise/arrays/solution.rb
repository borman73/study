module Exercise
  module Arrays
    class << self
      def replace(array)
        max = 0
        array.each do |num|
          max = num if num >= max
        end
        array.map { |el| el.positive? ? max : el }
      end

      def search(array, query)
        max = array.length - 1
        mid = (array.length / 2).floor
        return -1 if array.empty? || array.include?(query) != true

        if array[mid] == query
          mid
        elsif array[mid] < query
          search(array[mid + 1, max], query) + mid + 1
        else
          search(array[0, mid], query)
        end
      end
    end
  end
end
