module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        sorted_array = array
                       .reject { |film| film['country'].nil? || film['rating_kinopoisk'].nil? || film['rating_kinopoisk'].to_i.zero? }
                       .select { |film| film['country'].split(',').length > 1 }
        rating_sum = sorted_array.reduce(0) { |acc, film| acc + film['rating_kinopoisk'].to_f }
        result = rating_sum / sorted_array.length
        result
      end

      def chars_count(films, threshold)
        result = films
                 .select { |film| film['rating_kinopoisk'].to_f >= threshold }
                 .map { |film| film['name'] }.join.split('')
                 .select { |char| char == 'и' }.length
        result
      end
    end
  end
end
