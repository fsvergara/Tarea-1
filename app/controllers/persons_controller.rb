class PersonsController < ApplicationController
	def show
		response = JSON.parse(RestClient.get('https://swapi.co/api/people/'+params[:id] +'/'))
		response.delete('vehicles')
		response.delete('species')
		@person = response
		starships = response['starships']
		@starships = []
		for starship in starships
			@starships.push({"id"=> starship.split('/')[-1], 'name_star' => JSON.parse(RestClient.get(starship))['name']})
		end 
		@planets = []
		@planets.push({"id"=> response['homeworld'].split('/')[-1], 'name_plan' => JSON.parse(RestClient.get(response['homeworld']))['name']})
		films = response['films']
		@films = []
		for film in films
			@films.push({"id"=> film.split('/')[-1], 'title' => JSON.parse(RestClient.get(film))['title']})
		end 
	end
end
