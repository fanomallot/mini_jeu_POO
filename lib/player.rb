
class Player
	attr_accessor :player_name , :life_points
	def initialize(player_name)
		@player_name = player_name
		@life_points = 10
	end
	
	def show_state
		puts ("#{self.player_name} a #{self.life_points} points de vie" )
	end
	
	def get_damage(number)
		@life_points  -= number
		if @life_points ==  0
			puts "le joueur #{self.player_name} a été tué !"
		end	
	end
	def compute_damage
    	return rand(1..6)
  	end
  	def attacks(someone)
  		c = compute_damage
  		someone.get_damage(c)
  		puts "#{@player_name} attaque #{someone.player_name}"
  		puts "il lui inflige #{c} points de dommages"	
  	end
end
class HumanPlayer < Player
  attr_accessor :weapon_level, :life_points ,:player_name
  def initialize(player_name)
    @weapon_level = 1
    super (player_name)
    @life_points = 100
    
  end
  def show_state
    puts (" #{self.player_name} a #{self.life_points} points de vie et  une arme de niveau #{@weapon_level}" )
  end
  def compute_damage
      rand(1..6) * @weapon_level
    end
    def search_weapon
      niveau = compute_damage
      if niveau > @weapon_level
        puts " ****** Tu as trouvé une arme de niveau #{niveau} *****"
        @weapon_level = niveau
      else
        puts "*********M@*#$... elle n'est pas mieux que ton arme actuelle...***********"
        @weapon_level = @weapon_level
      end
    end
    def search_health_pack
      niveau_health = compute_damage
      if niveau_health == 1 
        puts ">>>>>>>>>>>>Tu n'as rien trouvé...<<<<<<<<<<<<< "
      else
        if  (2..5).include? niveau_health
          puts "*****Bravo, tu as trouvé un pack de +50 points de vie !*****"
          if @life_points < 50 
            @life_points += 50
          else
            @life_points = 100
          end
        else
          puts "**********Waow, tu as trouvé un pack de +80 points de vie !**********"
          if @life_points < 80 
            @life_points += 80
          else
            @life_points = 100
          end
        end
      end
    end
end