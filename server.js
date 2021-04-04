//add an API endpoint
let projectData = {};
// create variable with name express,whic require express pack. To run server and routes.
const express = require('express');
//start up an instance of app
const app = express();
//deprendencies
const bodyParser = require('body-parser');
//Here we are configuring express to use body-parser as middle-ware.
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
// cors for cross origin allowance
const cors = require('cors');
app.use(cors());
//main project folder
app.use(express.static('website'));
//Set up the server
const port = 3000;
const server = app.listen(port, listening);

function listening() {
    console.log("Server is working")
    console.log(`running on localhost:${port}`);
}

//Requests

//GET request

app.get('/', getWeather)
function getWeather(req, res) {
    let projectData = data; 
    console.log (projectData); // print data in server//
   res.send (projectData); // respond reflected on server smt like that//
}

//POST request
const data = [];
app.post('/', addWeather)
function addWeather(req, res) {
    const weatherData = { // Object, info will get from Open map//
        date: req.body.date,
        location: req.body.location,
        temp: req.body.temp,
        weather: req.body.weather,
        content: req.body.content
    }
data.push (weatherData) // Add new info about weather to server//
let projectData = data; 
console.log (projectData); 
}
