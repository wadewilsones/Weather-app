
//add an API endpoint
let projectData = {};
// create variable with name express,whic require express pack. To run server and routes.
const express = require('express');
//start up an instance of app
const app = express();
//deprendencies
const bodyParser = require('body-parser');
//Here we are configuring express to use body-parser as middle-ware.
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
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

app.get('/add', getWeather)
function getWeather(req, res) {
    let projectData = data; 
    console.log ('Getting', projectData); 
   res.send (projectData); 
}

//POST request
const data = [];
app.post('/add', addWeather);
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
res.send(projectData);
console.log ('Returning', projectData);// print data in server//
}
