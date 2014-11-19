require_relative "review"

class Vetting

  REPETITION_LIMIT = 3

  def self.vet(reviews)
    reviews.each do |review|

      if review.text =~ /elderberry|hamster|php|brainfuck/i
        review.rejection_reason = "Sorry you can't use bad language"

      elsif word_count(review.text) >= REPETITION_LIMIT
        review.rejection_reason = "Sorry you can't have repetition"

      elsif contains_price?(review.text)
        review.rejection_reason = "Sorry you can't mention the price"

      else
        review.accept!
      end

      review.vet!
    end
  end

  private

    # Get a word frequency list from the text
    # and return the count of the most frequent word
    def self.word_count(text)
      frequencies = Hash.new(0)
      text.split(/[^a-zA-Z]+/).each { |word| frequencies[word] += 1 }
      counts = frequencies.sort_by {|_,count| count}.reverse
      counts[0][1]
    end

    def self.contains_price?(text)
      text =~ /£\s?\d+(\.[\d]{2})?/
    end

end
