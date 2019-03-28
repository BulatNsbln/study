module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        hash = { country: 'country', rating: 'rating_kinopoisk' }
        count = 0
        result = array.select do |film|
          next unless film[hash[:rating]].to_f.positive?
          next if film[hash[:country]].nil?
          next unless film[hash[:country]].split(',').length >= 2
          count += 1
        end
        result.map { |film| film[hash[:rating]].to_f }.reduce(:+) / count
      end

      def chars_count(films, threshold)
        hash = { name: 'name', rating: 'rating_kinopoisk' }
        count = 0
        films.map do |film|
          next unless film[hash[:rating]].to_f >= threshold
          arr = film[hash[:name]].split('')
          count += arr.reduce(0) do |sum, char|
            sum += 1 if char == 'и'
            sum
          end
        end
        count
      end
    end
  end
end
