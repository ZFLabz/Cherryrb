#Dir creator

class CDir

	def CDir.booru
		#Create main download folder
		Dir.mkdir('downloads')
		#Create booru folders
		Dir.mkdir('downloads/Danbooru')
		Dir.mkdir('downloads/e621')
		Dir.mkdir('downloads/Gelbooru')
		Dir.mkdir('downloads/Konachan')
		Dir.mkdir('downloads/Realbooru')
		Dir.mkdir('downloads/Rule34')
		Dir.mkdir('downloads/Safebooru')
		Dir.mkdir('downloads/Yande.re')
		#Create other booru download folder
		Dir.mkdir('downloads/other')
		#Create booru folders in other boorus
		Dir.mkdir('downloads/other/e926')
		Dir.mkdir('downloads/other/Hiribe')
		Dir.mkdir('downloads/other/hypnohub')
		Dir.mkdir('downloads/other/XBooru')
	end

	def CDir.utils
		#Crear carpeta utils y archivos utiles
		Dir.mkdir('utils')
	end
end