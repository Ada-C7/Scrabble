def highest_score_from(array_of_words)
  max = 0
  #max_words = []
  max_words = {}
  array_of_words.each do |word|
    score_word = score(word)
    if score_word == max
    #  max_words.push word
      max_words[word] = score_word
    elsif score_word > max
      max = score_word
      #max_words = [word]
      max_words = {word => score_word}
    end
  end
  puts max_words
end
