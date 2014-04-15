class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy, :set_running, :set_over, :change_ends, :switch_service, :adjust_score, :create_game, :toggle_card]

  # GET /matches
  # GET /matches.json
  def index
    @matches = Match.all
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
  end

  # GET /matches/new
  def new
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.new(match_params)

    respond_to do |format|
      if @match.save
        format.html { redirect_to matches_path, notice: 'Match was successfully created.' }
        format.json { render action: 'show', status: :created, location: @match }
      else
        format.html { render action: 'new' }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to matches_path, notice: 'Match was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @match }
      else
        format.html { render action: 'edit' }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url }
      format.json { head :no_content }
    end
  end

  def set_running
    if Match.where(table_id: @match.table_id, is_running: true).size > 0
      @table_occupied = true
    else
      @table_occupied = false
    end
    unless @table_occupied
      @match.started_at = Time.zone.now
      @match.is_over = false
      @match.is_running = true
      @match.save
    end
    @matches = Match.all
    respond_to do |format|
      format.js
    end
  end

  def set_over
    @match.finished_at = Time.zone.now
    @match.is_over = true
    @match.is_running = false
    @match.save

    @matches = Match.all
    respond_to do |format|
      format.js
      format.html { redirect_to matches_path, notice: "The Match has ended." }
    end
  end

  def change_ends
    if @match.left_side.blank?
      @match.update_attributes({left_side: "b", right_side: "a"})
    else
      if @match.left_side == "a"
        @match.update_attributes({left_side: "b", right_side: "a"})
      else
        if @match.left_side == "b"
          @match.update_attributes({left_side: "a", right_side: "b"})
        end
      end
    end
    # update server if it was also at blank (default a)
    if @match.server.blank?
      @match.update_attribute(:server, "a")
    end
    respond_to do |format|
      format.js
    end
  end

  def switch_service
    transpose_server(@match)
    respond_to do |format|
      format.js
    end
  end

  def adjust_score
    if params[:direction] == "up"
      @match.update_attribute("#{params[:player]}_score".to_sym, @match.send("#{params[:player]}_score") + 1)
    end
    if params[:direction] == "down" && @match.send("#{params[:player]}_score") > 0
      @match.update_attribute("#{params[:player]}_score".to_sym, @match.send("#{params[:player]}_score") - 1)
      if (@match.a_score + @match.b_score) % 2 != 0
        transpose_server(@match)
      end
    end
    # adjust server every even total score, except for 11-10
    if ((@match.a_score + @match.b_score) < 21 && (@match.a_score + @match.b_score) % 2 == 0) || (@match.a_score + @match.b_score) >= 21
      transpose_server(@match)
    end
    respond_to do |format|
      format.js
    end
  end

  def create_game
    # check that game has reached 11 points and margin is at least 2
    if (@match.a_score >= 11 || @match.b_score >= 11) && ( (@match.a_score - @match.b_score) >= 2 || (@match.b_score - @match.a_score) >= 2 )
      # fetch the current game_number
      current_game_number = 0
      if @match.games.size > 0
        current_game_number = Game.where(match_id: @match.id).last.game_number
      end
      # create the new game
      game = Game.new
      game.match_id = @match.id
      game.game_number = current_game_number + 1
      game.a_score = @match.a_score
      game.b_score = @match.b_score
      game.save
      # reset scores to zero for next game
      @match.update_attributes({a_score: 0, b_score: 0})
      @match.reload
    end
    respond_to do |format|
      format.js
    end
  end

  def toggle_card
    if params[:type] == "red"
      @match.toggle("#{params[:player]}_red_card".to_sym)
    end
    if params[:type] == "yellow"
      @match.toggle("#{params[:player]}_yellow_card".to_sym)
    end
    if params[:type] == "timeout"
      @match.toggle("#{params[:player]}_timeout".to_sym)
    end
    @match.save
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params.require(:match).permit(:a_first_name, :a_last_name, :a_country, :b_first_name, :b_last_name, :b_country, :is_running, :is_over, :table_id, :started_at, :finished_at, :a_red_card, :a_yellow_card, :a_timeout, :b_red_card, :b_yellow_card, :b_timeout, :server, :left_side, :right_side, :player, :direction, :type)
    end

    def transpose_server(match)
      if match.server.blank?
        match.update_attribute(:server, "b")
      else
        if match.server == "a"
          match.update_attribute(:server, "b")
        else
          match.update_attribute(:server, "a")
        end
      end
    end

end
