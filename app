//Connection with HTML elements
const zipCode = document.getElementById ('zip');
const generate = document.getElementById ('generate');
const feelings = document.getElementById ('feelings');
const place = document.getElementById ('location');
const date = document.getElementById('date');
const temp = document.getElementById('temp');
const content = document.getElementById('content');



// Base URL for OpenWeatherMap API
  const baseURL = 'http://api.openweathermap.org/data/2.5/weather?zip=';
  const apiKey = 'f160bf0abe9fe5dde87e073cda69e092';

//Retrive Weather Data from Openweather API

const getWeatherData = async (Zipcode) => {
  const response = await fetch (baseURL+Zipcode+',US'+'&appid='+apiKey+'&units=metric')
  try {
    const data = await response.json();
    return data;
  }
  catch (error) {console.log ("error",error);}
  console.log (response)

} 

//Async Post

const postData = async (url ='', data = {}) => {
  const res = await fetch (url ='http://localhost:3000/add', {
    method: 'POST',
    credentials: 'same-origin',
    headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json'
    },
    body: JSON.stringify(data),
  })
  try {
    const newData = await res.json();
    return newData;
  }
  catch (error) {console.log ("error",error);}
  }


//Async Get






// Post data
generate.addEventListener ('click', addZipCode)
async function addZipCode (e) {

  if(zip.value != "" && feelings.value != ""){
    let currentDate = getnewDate();//new Date().toDateString();
    let data = await getWeatherData(zipCode.value);
    let tempValue = Math.round(data.main.temp);
    let locationValue = data.name + ", " + data.sys.country ;
    let weatherValue = data.weather[0].main +' '+ Math.round(data.main.feels_like);
    let contentValue = document.getElementById ('feelings').value
    
    postData('/add', {
        date: currentDate,
        location: locationValue,
        temp: tempValue,
        weather: weatherValue,
        content: contentValue
    })
    .then (UI())
    .then (cleanUI());
}

else 
{
  if (zip.value == "" && feelings.value == "") 
  {
    zipCode.value = "Enter a correct zip-code!";
    feelings.value = "Enter  a correct feeling!";
  }
  if (zip.value != "" && feelings.value == "") 
  {
    feelings.value = "Enter a correct feeling!";
  }
  if (zip.value == "" && feelings.value != "") 
  {

    zipCode.value = "Enter a correct zip-code!";
  }

}

}
/* Function to GET Project Data */
const UI = async () => {
  const updateData = await fetch ('/add'); // жди прихода от апи
    const allData = await updateData.json();
    try{
   
    temp.innerHTML = allData[allData.length - 1].temp + '°';
    content.innerHTML = 'And today I feel '+ allData[allData.length - 1].content;
    place.innerHTML = allData[allData.length - 1].location;
    date.innerHTML = getnewDate();//allData[allData.length - 1].date;
    }
    catch (error) {console.log ('error', error)}
}
function cleanUI(){
  zipCode.value = "";
  feelings.value= "";
}

const getnewDate = () => {
let fullDate = new Date(); 
let data = fullDate.getDate();
let year = fullDate.getFullYear();
let month = ['Jan', 'Feb', 'March', 'April', 'May', 'June', 'July', 'August', 'Sep', 'Oct', 'Nov', 'Dec']
return (month[fullDate.getMonth()]+' ' + data + ', '+ year);
console.log (month[fullDate.getMonth()]+' ' + data + ', '+ year)
}

getnewDate();
