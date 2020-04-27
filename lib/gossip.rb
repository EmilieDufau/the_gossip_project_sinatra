require 'pry'
#require 'csv'

class Gossip

	attr_accessor :author, :content

	def initialize(author, content)
  	@content = content
  	@author = author
	end

	def save #méthode sauvegarde
		CSV.open("./db/gossip.csv", "ab") do |csv|
  	csv << [@author, @content]
 		end
	end

	def self.all #méthode pour enregistrer tous les gossips dans un array
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |row|
    	all_gossips << Gossip.new(row[0], row[1])
   	end
    return all_gossips
  end

  def  self.find(id)
		 all_gossips = self.all
    n = id.to_i
    n = n - 1
    puts all_gossips[n].author
    puts all_gossips[n].content
    return all_gossips[n]
  end

end

