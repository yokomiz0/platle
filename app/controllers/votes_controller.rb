class VotesController < ApplicationController
  def home
    render 'home'
  end

  def event
    code = params[:code]
  end

  def vote
  end
end
