# '# frozen_string_literal: true'
class GamesController < ApplicationController
  def index
    @word = params[:longest_word]
    render plain: "Add to DB word '#{params[:longest_word]}'"
    # @restaurants = RESTAURANTS.select { |id, r| r[:category] == @category }
  end

  def new
    @letters = []
    10.times do
      @letters << ('A'..'Z').to_a.sample
    end
  end

  def score
    @word = params[:longest_word].split(//)
    arr = []
    @letters = params[:letters].downcase.split(' ')
    @word.each do |letter|
      if @letters.include?(letter) && @word.count(letter) <= @letters.count(letter)
        i = @word.index(letter)
        arr << @word[i]
      end
    end
      arr.sort == @word.sort ? @score = true : @score = false
    raise
      # API
      # url = 'https://wagon-dictionary.herokuapp.com/{word}'
      # .found == true? "Congratulations! #{@word.upcase} is a valid English word!"
      #
      # .found == false? "Sorry but #{@word.upcase} does not seem to be a valid English word"

    # else
    #   "Sorry but #{@word.upcase} can't be built of #{@letters}"
    # end
  end
end
