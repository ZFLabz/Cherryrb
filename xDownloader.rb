require("JSON")
require("net/http")
require 'open-uri'
require 'colorize'
require 'crack'

class XBooru

	def XBooru.downloader

		#Menu
		puts 'Cherry NSFW Tools| XBooru Downloader'.red
		#Ask the user for the tags
		puts 'Introduzca a continuacion los tags a descargar:'
		tags = gets.chomp
		tags = tags.gsub(' ', '%20')
		#Ask the user for the initial page
		#puts 'Se van a descargar 5 Imagenes de ' + tags
		#Ask the user for the initial post limit
		puts 'Introduzca a continuacion el limite de posts a descargar:'
		limit = gets.chomp

		if limit == '1'

			limit = '2'
		#Obtencion de datos

		url = 'https://xbooru.com/index.php?page=dapi&s=post&q=index' + '&limit=' + limit + '&pid=1&tags=' + tags

		puts url

		uri = URI(url)

		response = Net::HTTP.get(uri, {'User-Agent' => 'tag_downloader'})

		#Converts XML to JSON

		xmldata = Crack::XML.parse(URI.open(url))

		#saves the json

		jsondata = xmldata.to_json

		open('./utils/xbooru.json', 'wb') do |fo|

			fo.write(jsondata)

		end

		#parse the json

		file = File.read('./utils/xbooru.json')

		json_hash = JSON.parse(file)

		#puts json_hash[0]["id"]

		#puts json_hash.length

		#puts id

		#puts json_hash["posts offset"]

		for i in (0..limit.to_i)
			begin
				id = json_hash["posts"]["post"][i]["id"]
				puts"Iniciando la descarga del post #" + id
				#puts the number of the image starting by 0
				puts i
				#Gets the url of the image
				url = json_hash["posts"]["post"][i]["file_url"]
				puts 'Link del archivo: ' + url

			#gets the extension

				extension = url.split('.')[3]

				puts extension

				destination = '/downloads/other/XBooru/' + id.to_s + '.' + extension

				open(Dir.pwd() +  destination, 'wb') do |fo|
					fo.write URI.open(url).read
				end

				#download the file
				puts 'Post descargado satisfactoriamente'.green

			rescue
				File.truncate('./utils/xbooru.json', 0)
				puts 'Operacion finalizada'.green
		end
	#end
		puts 'presiona [ENTER] para volver a CherryCMD'
		gets
		system ('cls')
		require('.\Cherry.rb')
	end
	end
end
end