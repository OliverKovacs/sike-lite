



#          ####   ###  #  ##   #####     #####  ##   ##  ##### 
#        #        #   # ##    #         #       ## ##   #     
#        ####    #   ##      ####      ####      #     ####  
#           #   #   # ##    #         #       ## ##   #     
#      ####   ###  #  ##   #####  #  #####  ##   ##  ##### 




#           #############################################
#          ##  sike (./readme.md)                     ##
#         ##  Oliver Kovacs 2019                     ##
#        ##  https://github.com/OliverKovacs/sike/  ##
#       ##  CC-BY-NC-SA-4.0                        ##
#      #############################################



  ############
 ## SET UP ##
############

#1
download the sike folder from github (https://github.com/OliverKovacs/sike/).

#2
if you want to, move the folder whereever you like.

#3
if you wan to change the settings in ./settings.json (more info at FILES - settings.json). if you don't have a code editor you can open .json files with notepad++. you can test the changes by doubble clicking the file ./_start.bat. if you don't like the result you can repeat this step.

#4
if you want to change the icon of the .exe delete ./favicon.ico and paste yours in ./. note that it hast to be a .ico file and must be named favicon.ico.

#5
you can also make changes to ./app.js, ./menu.json and ./index.html but i don't recommend it.

#6
because this is the lite version there is now compiled exe included. you can compile the app by doubble clicking on the file ./_build.bat. you have to give it admin rights to make the command mklink (to create shortcuts) work. sike setup will create and move shortcuts automatically if you want it to.

note: if you are on linux or macos you have to compile manualy (more info: https://github.com/electron-userland/electron-packager) and sike setup won't work.


  ############
 ## FILES ###
############

#.git
git

#node_modules
folder where npm modules are located

#app.js
electron app javascript (node.js app)

#_build.bat
compiles the electron app to a folder with an .exe file, sike setup

#_start.bat
starts the app with electron, for testing

#favicon.ico
the icon of sike.exe will be set to this .ico

#index.html
html that gets loaded into electron app

#menu.json
menu json for electron app, see: https://electronjs.org/docs/api/menu

#package.json, package-lock.json
node.js related files

#readme.md
this file, documentation

#settings.json
settings file for app:
  width (1200) => width of ap window when it is opened
  height (800) => height of ap window when it is opened
  ms (0)       => time in milisecons after wich app gets closed (1sec = 1000ms)


  ###########
 ## ABOUT ##
###########

languages used:
- HTML5
- JavaScript ES6
- JSON
- CSS3
- Batch

frameworks used:
- Node.js
- npm
- Electron
- electron-packager
- Node.js url framework
- Node.js path framwork
- GitHub
- Git



#Oliver Kovacs 2019
#https://github.com/OliverKovacs