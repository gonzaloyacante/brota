#include <Arduino.h>
#include <WiFi.h>
#include <HTTPClient.h>
#include <ArduinoJson.h>

// Configuración WiFi - se actualizará vía Serial
String ssid;
String password;

// Configuración del sensor
const int SENSOR_PIN = 36;  // GPIO36 (ADC0)
const int READ_INTERVAL = 5000;  // 5 segundos entre lecturas
const char* serverUrl = "http://tu-servidor:3000/api/readings";

void setup() {
    Serial.begin(115200);
    Serial.println("\nBrota - Sensor de Humedad");
    
    // Esperar configuración WiFi por Serial
    Serial.println("Ingrese el nombre de su red WiFi:");
    while(!Serial.available()) delay(100);
    ssid = Serial.readStringUntil('\n');
    ssid.trim();
    
    Serial.println("Ingrese la contraseña de su red WiFi:");
    while(!Serial.available()) delay(100);
    password = Serial.readStringUntil('\n');
    password.trim();
    
    // Conectar WiFi
    WiFi.begin(ssid.c_str(), password.c_str());
    Serial.print("Conectando a WiFi");
    
    while (WiFi.status() != WL_CONNECTED) {
        delay(500);
        Serial.print(".");
    }
    
    Serial.println("\nConectado al WiFi!");
    Serial.print("Dirección IP: ");
    Serial.println(WiFi.localIP());
}

void loop() {
    // Leer sensor
    int humidity = analogRead(SENSOR_PIN);
    int humidityPercent = map(humidity, 0, 4095, 0, 100);
    
    Serial.printf("Humedad: %d%%\n", humidityPercent);
    
    // Enviar datos al servidor
    if (WiFi.status() == WL_CONNECTED) {
        HTTPClient http;
        http.begin(serverUrl);
        http.addHeader("Content-Type", "application/json");
        
        StaticJsonDocument<200> doc;
        doc["humidity"] = humidityPercent;
        
        String jsonString;
        serializeJson(doc, jsonString);
        
        int httpResponseCode = http.POST(jsonString);
        if (httpResponseCode > 0) {
            Serial.printf("Datos enviados. Código: %d\n", httpResponseCode);
        } else {
            Serial.printf("Error al enviar datos: %s\n", http.errorToString(httpResponseCode).c_str());
        }
        
        http.end();
    }
    
    delay(READ_INTERVAL);
}