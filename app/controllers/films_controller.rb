class FilmsController < ApplicationController
	def index
		response = RestClient.get('https://swapi.co/api/films')
		@films = JSON.parse(response)['results']
	end

	def show
		response = RestClient.get('https://swapi.co/api/films/'+params[:id] +'/')
		response = JSON.parse(response)
		response.delete('vehicles')
		response.delete('species')
		@film = response
		characters = response['characters']
		@characters = []
		for character in characters
			@characters.push({"id"=> character.split('/')[-1], 'name_char' => JSON.parse(RestClient.get(character))['name']})
		end 
		starships = response['starships']
		@starships = []
		for starship in starships
			@starships.push({"id"=> starship.split('/')[-1], 'name_star' => JSON.parse(RestClient.get(starship))['name']})
		end 
		planets = response['planets']
		@planets = []
		for planet in planets
			@planets.push({"id"=> planet.split('/')[-1], 'name_plan' => JSON.parse(RestClient.get(planet))['name']})
		end 
	end
end
