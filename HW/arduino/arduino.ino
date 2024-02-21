#include <SoftwareSerial.h>
#include <ArduinoJson.h>
#include <MQ135.h>
#include <DHT.h>                // Install DHT library by adafruit 1.3.8



#define DHT_SENSOR_PIN  4
#define DHT_SENSOR_TYPE DHT11
#define GAS             A0


SoftwareSerial SoftSerial(2, 3); // RX, TX
MQ135 mq135_sensor(GAS);
DHT dht_sensor(DHT_SENSOR_PIN, DHT_SENSOR_TYPE);
float temperature, humidity; // Temp and Humid floats, will be measured by the DHT

void setup() 
{
  // put your setup code here, to run once:
  dht_sensor.begin();
  Serial.begin(9600);
  SoftSerial.begin(115200);

}

void loop() 
{
  StaticJsonDocument<1000> doc;
  serializeJson(doc, SoftSerial);
  temperature = dht_sensor.readTemperature();
  humidity = dht_sensor.readHumidity();
  float correctedRZero = mq135_sensor.getCorrectedRZero(temperature, humidity);
  float correctedPPM = mq135_sensor.getCorrectedPPM(temperature, humidity);
  doc["H"]=humidity ;
  doc["T"]=temperature;
  doc["G"]=correctedPPM;
}
