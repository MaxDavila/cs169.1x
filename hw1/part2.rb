class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
  table = {
    [ "P", "S" ] => m2,
    [ "S", "P" ] => m1,
    [ "P", "P" ] => m1,
    [ "R", "P" ] => m2,
    [ "P", "R" ] => m1,
    [ "R", "R" ] => m1,
    [ "R", "S" ] => m1,
    [ "S", "R" ] => m2,
    [ "S", "S" ] => m1,  
  }
  a, b = m1.last.upcase, m2.last.upcase
  raise NoSuchStrategyError unless table.include?([a,b])
  table[ [a,b] ]
   
end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length. == 2
  rps_result(game.first, game.last)
end

def rps_tournament_winner(tournament)
   if tournament[0][0].is_a? String
     rps_game_winner(tournament)
   else
     rps_game_winner([rps_tournament_winner(tournament[0]), rps_tournament_winner(tournament[1])])
   end

end

