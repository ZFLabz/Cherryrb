require("JSON")
require("net/http")
require 'open-uri'
require 'colorize'

#Headers for the e621

headers = {'User-Agent' => 'tag_downloader'}

class E926

	def E926.downloader

		#Menu
		puts 'Cherry NSFW Tools| e926 Downloader'.red
		#Ask the user for the tags
		puts 'Introduzca a continuacion los tags a descargar:'
		tags = gets.chomp
		tags = tags.gsub(' ', '%20')
		#Ask the user for the initial page
		puts 'Introduzca a continuacion la pagina donde empezar a descargar:'
		page = gets.chomp

		if page == '0'
			page == '1'
		end

		puts 'Se iniciara a descargar desde la pagina ' + page
		#Ask the user for the initial post limit
		puts 'Introduzca a continuacion el limite de posts a descargar:'
		limit = gets.chomp

		if limit == '0'
			limit == '1'
		end

		#uts 'Limite establecido en ' + limit

		#Obtencion de datos

		url = 'https://e926.net/posts.json?&tags=' + tags + '&page=' + page + '&limit=' + limit

		puts url

		uri = URI(url)

		response = Net::HTTP.get(uri, {'User-Agent' => 'tag_downloader'})

		json_hash = JSON.parse(response)

		#puts json_hash[0]["id"]

		puts json_hash.length

		for i in (0..limit.to_i)
			begin
				id = json_hash["posts"][i]["id"].to_s
				puts"Iniciando la descarga del post #" + id
				#puts the number of the image starting by 0
				puts i
				#Gets the url of the image
				url = json_hash["posts"][i]["file"]["url"]
				puts 'Link del archivo: ' + url

				#gets the extension

				extension = json_hash["posts"][i]["file"]["ext"]

				destination = '/downloads/other/e926/' + id + '.' + extension

				open(Dir.pwd() +  destination, 'wb') do |fo|
					fo.write URI.open(url, {'User-Agent' => 'tag_downloader'}).read
				end
				puts 'Post descargado satisfactoriamente'.green
			rescue
				puts 'Operacion finalizada'.green
		end
	end
		puts 'presiona [ENTER] para volver a CherryCMD'
		gets
		system ('cls')
		require('.\Cherry.rb')


	end
end