class MatchesController < ApplicationController
    def show
        @match = Match.find[:id]
    end
end
