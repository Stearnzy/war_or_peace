class InitializeGame

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are Megan and Aurora."
    p "Type 'GO' to start the game!"
    p "------------------------------------------------------------------"
    print "> "
    keep_asking = true

    while keep_asking do
      entry = gets.chomp.upcase
      if entry == "GO"
        
      else
        p "Invalid entry, try again."
      end
    end
  end
end