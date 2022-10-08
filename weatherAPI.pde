//Owner: Lee Soyoung
String API_KEY = "403777ce71df2ce96544c5f1ee993f6d",
URL = "https://api.openweathermap.org/data/2.5/weather?q=Suwon&units=metric&appid="+API_KEY;
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
