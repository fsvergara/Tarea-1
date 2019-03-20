class SearchController < ApplicationController
	def index
		if not params[:term].nil?
			@persons = JSON.parse(RestClient.get('https://swapi.co/api/people/?search='+params[:term]))['results']
			@starships = JSON.parse(RestClient.get('https://swapi.co/api/starships/?search='+params[:term]))['results']
			@films = JSON.parse(RestClient.get('https://swapi.co/api/films/?search='+params[:term]))['results']
			@planets = JSON.parse(RestClient.get('https://swapi.co/api/planets/?search='+params[:term]))['results']
		else
			@persons = {}
			@starships = {}
			@films = {}
			@planets = {}
		end
	end
end
