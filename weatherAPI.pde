//Owner: Lee Soyoung
String[] API_KEY;
String URL = "https://api.openweathermap.org/data/2.5/weather?q=Suwon&units=metric&appid=";
JSONObject json;
long sunriseTime, sunsetTime, currentTime;
Date date = new Date();

void setTimeWithAPI(){
  //Receives the time of sunset and sunrise from the weather API and the current time from the date variable.
  
  sunriseTime = json.getJSONObject("sys").getInt("sunrise");
  sunsetTime = json.getJSONObject("sys").getInt("sunset");
  currentTime = date.getTime()/1000;
  //currentTime = json.getInt("dt"); //"dt" dosen't show time in real time...
}

void checkStartTime(){
  //Check the current time when the game starts again
  
  date = new Date();
  currentTime = date.getTime()/1000;     
  timeCheck = true;
}

void loadFileString(){
  //get string from file
  
  for(int i = 0; i < API_KEY.length; i++){
    URL += API_KEY[i];
  }
}
