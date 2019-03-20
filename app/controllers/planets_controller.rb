class PlanetsController < ApplicationController
	def show
		response =JSON.parse(RestClient.get('https://swapi.co/api/planets/'+params[:id] +'/'))
		@planet = response
		films = response['films']
		@films = []
		for film in films
			@films.push({"id"=> film.split('/')[-1], 'title' => JSON.parse(RestClient.get(film))['title']})
		end 
		characters = response['residents']
		@characters = []
		for character in characters
			@characters.push({"id"=> character.split('/')[-1], 'name_char' => JSON.parse(RestClient.get(character))['name']})
		end 
	end
end
