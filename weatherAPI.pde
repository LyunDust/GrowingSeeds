//Owner: Lee Soyoung
String[] API_KEY;
String URL = "https://api.openweathermap.org/data/2.5/weather?q=Suwon&units=metric&appid=";
JSONObject json;
long sunriseTime, sunsetTime, currentTime;
Date date = new Date();

void setTimeWithAPI(){
  sunriseTime = json.getJSONObject("sys").getInt("sunrise");
  sunsetTime = json.getJSONObject("sys").getInt("sunset");
  currentTime = date.getTime()/1000;
  //currentTime = json.getInt("dt"); //"dt" dosen't show time in real time...
}

void checkStartTime(){
  date = new Date();
  currentTime = date.getTime()/1000;     
  timeCheck = true;
}

//get string from file
void loadFileString(){
  for(int i = 0; i < API_KEY.length; i++){
    URL += API_KEY[i];
  }
}
