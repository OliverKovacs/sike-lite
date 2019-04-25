
/////////////////////////////////////////////
//  sike.exe (./app.js)                    //
//  Oliver Kovacs 2019                     //
//  https://github.com/OliverKovacs/sike/  //
//  CC-BY-NC-SA-4.0                        //
/////////////////////////////////////////////

// loads frameworks
const electron = require("electron");        
const url = require("url");                  
const path = require("path");                
const { app, BrowserWindow, Menu, nativeImage} = electron;

// loads settings, menu, icon, window
let settings = require("./settings.json");
let mainMenuTemplate = require("./menu.json");
let icon = nativeImage.createFromPath(path.join(__dirname, "favicon.ico"));
let mainWindow;

// listen for the app to be ready
app.on("ready", () => ready());

let ready = () => {

    // create new window
    mainWindow = new BrowserWindow({
        icon: icon,
        width: settings.width,
        height: settings.height
    });

    // load html to window
    mainWindow.loadURL(url.format({
        pathname: path.join(__dirname, "/index.html"),
        protocol: "file:",
        slashes: true
    }));

    // quit app when window gets closed
    mainWindow.on("closed", () => app.quit());

    // build menu from template
    const mainMenu = Menu.buildFromTemplate(mainMenuTemplate);

    // insert menu
    Menu.setApplicationMenu(mainMenu);

    // close app after settings.ms miliseconds
    setTimeout(() => { close(); }, settings.ms);
}

let close = () => {

    // quits app
    app.quit();
}