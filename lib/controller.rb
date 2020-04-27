require 'bundler'
Bundler.require
require 'gossip'

class ApplicationController < Sinatra::Base

  get '/' do #requête GET qui demande d'afficher le contenu d'une URL
  erb :index, locals: {gossips: Gossip.all}
end

#Fait appel à mon fichier html new gossip
get '/gossips/new/' do
  erb :new_gossip
end

#Créer un Gossip et l'ajouter en base de donnée

post '/gossips/new/' do
	Gossip.new(params["gossip_author"], params["gossip_content"]).save #contenu récupéré dans le formulaire de new gossip

		puts "Salut, je suis dans le serveur"
  	puts "Ceci est le contenu du hash params : #{params}"
  	puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ gossip_author : #{params["gossip_author"]}"
  	puts "De la bombe, et du coup ça, ça doit être ce que l'utilisateur a passé dans le champ gossip_content : #{params["gossip_content"]}"
  	puts "Ça déchire sa mémé, bon allez je m'en vais du serveur, ciao les BGs !"

  redirect '/'
end

 get '/gossips/:id' do
    number = params['id']
    erb :show, locals: {gossip: Gossip.find(number)}
  end

end
