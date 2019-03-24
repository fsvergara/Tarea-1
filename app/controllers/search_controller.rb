class SearchController < ApplicationController
	def index
		if not params[:term].nil?
			# persons
			response1 = JSON.parse(RestClient.get('https://swapi.co/api/people/?search='+params[:term]))
			persons = response1['results']
			while not response1['next'].nil?
				response1 = JSON.parse(RestClient.get(response1['next']))
				persons = persons + response1['results']
			end
			@persons = persons
			# starships
			response2 = JSON.parse(RestClient.get('https://swapi.co/api/starships/?search='+params[:term]))
			starships = response2['results']
			while not response2['next'].nil?
				response2 = JSON.parse(RestClient.get(response2['next']))
				starships = starships + response2['results']
			end
			@starships = starships
			#planets
			response3 = JSON.parse(RestClient.get('https://swapi.co/api/planets/?search='+params[:term]))
			planets = response3['results']
			while not response3['next'].nil?
				response3 = JSON.parse(RestClient.get(response3['next']))
				planets = planets + response3['results']
			end
			@planets = planets
			@films = JSON.parse(RestClient.get('https://swapi.co/api/films/?search='+params[:term]))['results']
		else
			@persons = {}
			@starships = {}
			@films = {}
			@planets = {}
		end
	end
end
