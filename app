//Connection with HTML elements
const zipCode = document.getElementById ('zip');
const generate = document.getElementById ('generate');
const feelings = document.getElementById ('feelings');
const date = document.getElementById('date');
const temp = document.getElementById('temp');
const content = document.getElementById('content');



// Base URL for OpenWeatherMap API
  const baseURL = 'http://api.openweathermap.org/data/2.5/weather?zip=';
  const apiKey = 'f160bf0abe9fe5dde87e073cda69e092';

//Retrive Weather Data from Openweather API

const getWeatherData = async (Zipcode) => {
  const response = await fetch (baseURL + Zipcode + ',US' +'&appid='+apiKey+'&units=metric')
  try {
    const data = await response.json();
    return data;
  }
  catch (error) {console.log ("error",error);}

} 

//Async Post

const postData = async (url ='', data = {}) => {
  const res = await fetch (url ='http://localhost:3000', {
    method: 'POST',
    credentials: 'same-origin',
    headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json'
    },
    body: JSON.stringify(data),
  })
  try {
    const newData = await response.json();
    return newData;
  }
  catch (error) {console.log ("error",error);}
  }

// Post data
generate.addEventListener ('click', addZipCode)
async function addZipCode (e) {

  if(zip.value != "" && feelings.value != ""){
    let currentDate = new Date().toDateString() + " " + new Date().toLocaleTimeString([], {hour: '2-digit', minute:'2-digit'});
    let data = await getWeatherData(zipCode.value);
    let tempValue = Math.round(data.main.temp);
    let locationValue = data.name + ", " + data.sys.country;
    let weatherValue = data.weather[0].main + ", feels like " + Math.round(data.main.feels_like);
    let contentValue = document.getElementById('feelings').value;
    postData('/', {
        date: currentDate,
        location: locationValue,
        temp: tempValue,
        weather: weatherValue,
        content: contentValue
    })
    .then (
      updateUI()
      )
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


//UI update

const updateUI = async () => {
  const req = await fetch('/');
  try{
      const allData = await req.json();
      const location = document.getElementById('location');
      const weather = document.getElementById('weather');
      date.innerHTML = allData[allData.length - 1].date;
      location.innerHTML = allData[allData.length - 1].location;
      temp.innerHTML = "<i class='fas fa-snowflake'></i>" + allData[allData.length - 1].temp + '&deg;C' + "<i class='fas fa-temperature-low'></i>";
      weather.innerHTML = "<i class='fas fa-cloud'></i>" + allData[allData.length - 1].weather + '&deg;C';
      content.innerHTML = "I feel " + allData[allData.length - 1].content;
      console.log (allData)
    }catch(error){

      console.log('error', error);

  }
  console.log (req.body);
}
