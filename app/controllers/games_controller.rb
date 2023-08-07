require 'open-uri'
require 'JSON'

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('a'..'z').to_a.sample }
  end

  def score
    user_reply = params[:reply]
    @oriletters = params[:oriletters].split

    url = "https://wagon-dictionary.herokuapp.com/#{user_reply}"
    user_serialized = URI.open(url).read
    @user = JSON.parse(user_serialized)

    # words cant be more than 10 chars

    # words must match the letters given
    # words cant have repeat letters
    def can_build?
      user_reply.chars.all? { |char| user_reply.count(char) <= @oriletters.count(char) }
    end

    # words must be valid
    # words must be english
    # words must return true

  end

end
# display RANDOM letters
# FORM - to type
# BUTTON to submit
# PAGE - compute score and display score


# url = `https://wagon-dictionary.herokuapp.com/`
# new_url = `https://wagon-dictionary.herokuapp.com/${input}`
