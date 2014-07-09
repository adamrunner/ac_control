/*
 * IRremote: IRsendDemo - demonstrates sending IR codes with IRsend
 * An IR LED must be connected to Arduino PWM pin 3.
 * Version 0.1 July, 2009
 * Copyright 2009 Ken Shirriff
 * http://arcfn.com
 */

#include <IRremote.h>

IRsend irsend;

void setup()
{
  Serial.begin(9600);
}

void loop() {
  if (Serial.available() > 0) {
    int inByte = Serial.read();
    switch (inByte) {
      case 'p':
        Serial.println("Sending power button");
        irsend.sendNEC(0x9867, 32);
        break;  
      case 'm':
        Serial.println("Sending mode button");
        irsend.sendNEC(0x10EF, 32);
        break;
      case 's':
        Serial.println("Sending fan speed button");
        irsend.sendNEC(0x20DF, 32);
        break;
      case '+':
        Serial.println("Sending temp + button");
        irsend.sendNEC(0xA05F, 32);
        break;
      case '-':
        Serial.println("Sending temp - button");
        irsend.sendNEC(0x906F, 32);
        break;
      default:
        Serial.println("not a valid command");
    }
  }
}
