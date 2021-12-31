#CherryCMD Rb
require 'colorize'
#Directory Creator (CDIR)
require '.\cDir.rb'
#Booru downloaders
require '.\dDownloader.rb'
require '.\e9Downloader.rb'
require '.\eDownloader.rb'
require '.\gDownloader.rb'
require '.\hhDownloader.rb'
require '.\hiDownloader.rb'
require '.\kDownloader.rb'
require '.\rbDownloader.rb'
require '.\rDownloader.rb' # Tuve que quitar esto por un error con open-uri
require '.\sDownloader.rb'
require '.\xDownloader.rb'
require '.\yDownloader.rb'
#Main Menu

def dirChecker
	if Dir.exist?('downloads') == false
		puts 'Creando carpeta de descargas...'
		CDir.booru
		puts '✓ | Directorio creado'.green
	end

	if Dir.exist?('utils') == false
		puts 'Creando carpeta de archivos utiles...'
		CDir.utils
		puts '✓ | Directorio creado'.green
	end
end

def otherBoorusMenu
	puts 'Cherry NSFW Tools | Other boorus'.red
	puts '1 | Hypnohub'
	puts '2 | e926 Downloader'
	puts '3 | xBooru Donwloader'
	puts '4 | Hiribe Downloader'
	print 'Ingrese a continuacion la opcion deseada '
	menu_option = gets.chomp

	if menu_option == '1'
		system('cls')
		Hypnohub.downloader
	elsif menu_option == '2'
		system('cls')
		E926.downloader
	elsif menu_option == '3'
		system('cls')
		XBooru.downloader
	elsif menu_option == '4'
		system('cls')
		Hiribe.downloader
	end
end

def main_menu
	puts 'Cherry NSFW Tools | Main Menu'.red
	puts '1 | Rule34 Downloader'
	puts '2 | Gelbooru Downloader'
	puts '3 | e621 Downloader'
	puts '4 | Konachan Downloader'
	puts '5 | Yande.re Downloader'
	puts '6 | Danbooru Downloader'
	puts '7 | Realbooru Downloader'
	puts '8 | Safebooru Downloader'
	puts '777 | Other boorus...'
	print 'Ingrese a continuacion la opcion deseada: '
	menu_option = gets.chomp
	if menu_option == '1'
		system('cls')
		#require '.\rDownloader.rb'
		Rule34.downloader
	elsif menu_option == '2'
		system('cls')
		Gelbooru.downloader
	elsif menu_option == '3'
		system('cls')
		E621.downloader
	elsif menu_option == '4'
		system('cls')
		Konachan.downloader
	elsif menu_option == '5'
		system('cls')
		Yandere.downloader
	elsif menu_option == '6'
		system('cls')
		Danbooru.downloader()
	elsif menu_option == '7'
		system('cls')
		Realbooru.downloader
	elsif menu_option == '8'
		system('cls')
		Safebooru.downloader
	elsif menu_option == '777'
		system('cls')
		otherBoorusMenu()
	elsif menu_option == 'OwO'
		system('cls')
		require 'owoify_rb'
		begin
			puts 'Cherry NSFW Tools | Text-to-owo'.red
			puts 'Introduzca el texto a convertir OwO'
			tto = gets.chomp
			puts Owoify.owoify(tto)
			puts 'presiona [ENTER] para volver a CherryCMD'
			gets
			system ('cls')
			main_menu()
		rescue
			'OwO'
		end
	else
		puts 'Opcion Invalida.'
		puts 'Presiona [ENTER] para volver al menu principal'
		gets
		system ('cls')
		main_menu()

	end
end

def start_screen

	puts <<-LOGO

   ________  ____________  ______  __
  / ____/ / / / ____/ __ \\/ __ \\ \\/ /	|
 / /   / /_/ / __/ / /_/ / /_/ /\\  /	|	Cherry Booru &
/ /___/ __  / /___/ _, _/ _, _/ / /	|	Image Downloader
\\____/_/ /_/_____/_/ |_/_/ |_| /_/	|	Ver.rb.1.2.3_2

    LOGO
    .red
    dirChecker()
	puts 'press [ENTER] to start CherryCMD'
	gets

	system ('cls')
	main_menu()

end
start_screen()