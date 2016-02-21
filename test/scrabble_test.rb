gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def setup
    @game = Scrabble.new
    @another_game = Scrabble.new
  end

  def test_game_can_be_initialized
    assert_equal Scrabble, @game.class
  end

  def test_it_can_score_a_single_letter_with_insensitivity_to_case
    assert_equal 1, @game.score("a")
    assert_equal 4, @game.score("f")
    assert_equal 10, @game.score("Z")
    refute_equal 10, @game.score("X")
  end

  def test_it_can_score_a_single_word
    assert_equal 8, @game.score("hello")
    assert_equal 8, @game.score("HeLLo")
    assert_equal 23, @game.score("HIPPOpatamus")
  end

  def test_nil_or_empty_words_score_zero
    assert_equal 0, @game.score(nil)
    assert_equal 0, @game.score("")
  end
end
