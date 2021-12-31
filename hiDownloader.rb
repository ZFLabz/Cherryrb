require("JSON")
require("net/http")
require 'open-uri'
require 'colorize'

def Hiribe

	def Hiribe.downloader

		#Menu
		puts 'Cherry NSFW Tools| Hiribe Downloader'.red
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

		puts 'Limite establecido en ' + limit

		#Obtencion de datos

		url = 'https://hijiribe.donmai.us/posts.json' + '?limit=' + limit + 'page=' + page  + '?tags=' + tags + '&json=1'

		puts url

		uri = URI(url)

		response = Net::HTTP.get(uri, {'User-Agent' => 'tag_downloader'})

		json_hash = JSON.parse(response)

		#puts json_hash[0]["id"]

		#puts json_hash.length

		for i in (0..json_hash.length()-1)
			id = json_hash[i]["id"].to_s
			puts"Iniciando la descarga del post #" + id
			#puts the number of the image starting by 0
			puts i
			#Gets the url of the image
			url = json_hash[i]["file_url"]
			puts 'Link del archivo: ' + url

			#gets the extension

			extension = url.split('.')[3]

			destination = '/downloads/other/Hiribe/' + id + '.' + extension

			open(Dir.pwd() +  destination, 'wb') do |fo|
				fo.write URI.open(url).read
			end

			#download the file
			puts 'Post descargado satisfactoriamente'.green
		end
		puts 'presiona [ENTER] para volver a CherryCMD'
		gets
		system ('cls')
		require('.\Cherry.rb')

	end
end