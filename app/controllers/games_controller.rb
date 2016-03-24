class GamesController < ApplicationController
  def destroy
    @game = Game.find(params[:id])
    @match = @game.match
    @game.match.touch
    @game.destroy
    respond_to do |format|
      format.js
    end
  end
end
