class Player
	attr_accessor :name, :life_points

	def initialize(name)
		@name = name
		@life_points = 10
	end

	def show_state
		puts "#{@name} a #{life_points} points de vie."
	end
	
	def gets_damage (damages)
		@life_points = @life_points - damages
	
		if @life_points < 1 

			puts "#{@name} is DEAD !"
		end	
	end

	def attacks (player)

		puts "#{@name} attaque #{player.name}"	

		strengh = compute_damage

		puts "Il lui inflige #{strengh} points de dommages"

		player.gets_damage(strengh)
	end	

	def compute_damage
		return rand(1..6)
	end	

end


class HumanPlayer < Player
	
	attr_accessor :weapon_level

	

	def initialize (name)
		super(name)
		@life_points = 100
		@weapon_level = 1
	end	

	def show_state
		puts "#{name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}."
	end	

	def compute_damage
		rand(1..6) * @weapon_level
	end

	def search_weapon
		new_weapon_level = rand(1..6)		
		puts "Tu as trouvé une nouvelle arme de niveau #{new_weapon_level} !"

		if new_weapon_level > @weapon_level		
			@weapon_level = new_weapon_level
			puts "L'arme trouvée est meilleure que l'arme actuelle, tu la prends !!"
		
		else	
			@weapon_level = @weapon_level
			puts "C'est de la merde, tu garde ton arme actuelle !"
		end			
	end	

	def search_health_pack
		health_pack = rand(1..6)

		if health_pack == 1
			puts "Tu n'as rien trouvé, sorry !"
		
		elsif health_pack >= 2 and health_pack <= 5
			puts "Bravo tu as trouvé un pack de +50 HP !"	
		
			if @life_points > 49	
				@life_points = 100	
		
			else 
				@life_points =	@life_points + 50
			end		
		
		else puts "Waouuu, tu as trouvé un pack de +80 HP !!!"		
		
			if @life_points > 19 
				@life_points = 100
		
			else 	
				@life_points = @life_points + 80
			end
		
		end		
	end	

end	