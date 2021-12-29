#CherryCMD Rb
require 'colorize'
#Main Menu
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
		require('.\hhDownloader.rb')
	elsif menu_option == '2'
		system('cls')
		require('.\e9Downloader.rb')
	elsif menu_option == '3'
		system('cls')
		require('.\xDownloader.rb')
	elsif menu_option == '4'
		system('cls')
		require('.\hiDownloader')
	end
end

def cleaner
	puts 'Cherry NSFW Tools | File cleaner'.red
	puts '1 | Eliminar los json en cache'
	menu_option = gets.chomp

	if menu_option == '1'
		puts 'Eliminando datos...'
		File.truncate('./utils/realbooru.json', 0)
		File.truncate('./utils/xbooru.json', 0)
		puts 'Datos eliminados.'.green
		puts 'Presione [ENTER] Para volver a CherryCMD'
		gets
		system('cls')
		main_menu()
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
	puts '555 | Clean options...'
	print 'Ingrese a continuacion la opcion deseada: '
	menu_option = gets.chomp
	if menu_option == '1'
		system('cls')
		require '.\rDownloader.rb'
	elsif menu_option == '2'
		system('cls')
		require '.\gDownloader.rb'
	elsif menu_option == '3'
		system('cls')
		require '.\eDownloader.rb'
	elsif menu_option == '4'
		system('cls')
		require '.\kDownloader.rb'
	elsif menu_option == '5'
		system('cls')
		require '.\yDownloader'
	elsif menu_option == '6'
		system('cls')
		require '.\dDownloader.rb'
	elsif menu_option == '7'
		system('cls')
		require '.\rbDownloader.rb'
	elsif menu_option == '8'
		system('cls')
		require '.\sDownloader.rb'
	elsif menu_option == '777'
		system('cls')
		otherBoorusMenu()
	elsif menu_option == '555'
		system('cls')
		cleaner()
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
\\____/_/ /_/_____/_/ |_/_/ |_| /_/	|	Ver.rb.1.2.1

    LOGO
    .red
	puts 'press [ENTER] to start CherryCMD'
	gets

	system ('cls')
	main_menu()

end

start_screen()