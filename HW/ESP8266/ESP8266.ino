//ESP8266
//ESP32/ESP8266 Code for the Realtime Data Log
#include <Arduino.h>
//#include <WiFi.h>               //we are using the ESP32
#include <ESP8266WiFi.h>      // uncomment this line if you are using esp8266 and comment the line above
#include <ArduinoJson.h>
#include <Firebase_ESP_Client.h>
//Provide the token generation process info.
#include "addons/TokenHelper.h"
//Provide the RTDB payload printing info and other helper functions.
#include "addons/RTDBHelper.h"




// Insert your network credentials
//#define WIFI_SSID "TP-LINK_D9BC4A"
#define WIFI_SSID "HP"
#define WIFI_PASSWORD "Ahmed123456789**"

// Insert Firebase project API Key
#define API_KEY "AIzaSyD5fwDp_ANFdI7aEYyQXwgX9DIzj5hsk_s"
// Insert RTDB URLefine the RTDB URL */
#define DATABASE_URL "https://solution-project-2024-default-rtdb.firebaseio.com/" 

// User ID obtained from Firebase Authentication
#define USER_ID "USER_1"  // Change this according to the user
// Firebase database path
#define DATABASE_PATH "/Sensors/" USER_ID "/Sensors_Data"



//Define Firebase Data object
FirebaseData fbdo;
FirebaseAuth auth;
FirebaseConfig config;


unsigned long sendDataPrevMillis = 0;
int count = 0;
bool signupOK = false;                     //since we are doing an anonymous sign in 

void setup() 
{
  Serial.begin(115200);
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Connecting to Wi-Fi");
  while (WiFi.status() != WL_CONNECTED){
    Serial.print(".");
    delay(300);
  }
  Serial.println();
  Serial.print("Connected with IP: ");
  Serial.println(WiFi.localIP());
  Serial.println();
  /* Assign the api key (required) */
  config.api_key = API_KEY;
  /* Assign the RTDB URL (required) */
  config.database_url = DATABASE_URL;
  /* Sign up */
  if (Firebase.signUp(&config, &auth, "", ""))
  {
    Serial.println("ok");
    signupOK = true;
  }
  else
  {
    Serial.printf("%s\n", config.signer.signupError.message.c_str());
  }
  /* Assign the callback function for the long running token generation task */
  config.token_status_callback = tokenStatusCallback; //see addons/TokenHelper.h
  Firebase.begin(&config, &auth);
  Firebase.reconnectWiFi(true);
}

void loop() 
{
float  temperature;float humidity,correctedPPM;
StaticJsonDocument<1000> doc;
deserializeJson(doc, Serial);
temperature=doc["H"];
humidity=doc["T"];
correctedPPM=doc["G"];

  if (Firebase.ready() && signupOK && (millis() - sendDataPrevMillis > 1000 || sendDataPrevMillis == 0))
  {
    //since we want the data to be updated every second
    sendDataPrevMillis = millis();
    if (Firebase.RTDB.setInt(&fbdo, String(DATABASE_PATH) + "/PPM_Co2", correctedPPM))
    {
      // This command will be executed even if you dont serial print but we will make sure its working
      /*PPM = Part per million(Concentration)*/
      Serial.print("PPM_Co2 : ");
      Serial.print(correctedPPM);
      Serial.print(" PPM\t");
    }
    else 
    {
      Serial.println("Failed to Read from MQ135");
      Serial.println("REASON: " + fbdo.errorReason());
    }

    if (Firebase.RTDB.setInt(&fbdo, String(DATABASE_PATH) + "/Temperature", temperature))
    {
      // This command will be executed even if you dont serial print but we will make sure its working
      Serial.print("Temperature : ");
      Serial.print(temperature);
      Serial.print(" C\t");
    }
    else 
    {
      Serial.println("Failed to Read The Temperature");
      Serial.println("REASON: " + fbdo.errorReason());
    }

/*if (Firebase.RTDB.setFloat(&fbdo, "Air_Quality/Humidity", humidity))*/
    if (Firebase.RTDB.setFloat(&fbdo, String(DATABASE_PATH) + "/Humidity", humidity))
    {
      // This command will be executed even if you dont serial print but we will make sure its working
      Serial.print("Humidity : ");
      Serial.print(humidity);
      Serial.println(" %\t");
    }
    else 
    {
      Serial.println("Failed to Read The humidity");
      Serial.println("REASON: " + fbdo.errorReason());
    }
  }


  // The client will actually be disconnected when the function returns and the client object is destroyed
}
