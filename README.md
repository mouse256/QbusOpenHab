# QbusOpenHab
 This is the openHAB test binding for Qbus.
 The binding can't communicate directly to the Qbus controller but uses a client server application.
 
 ## Prerequieries
 Your controller must be activated for the DLL, call Qbus support to enable this.
 
 ## Client & Server
Client and server are installed automatically with the script you can find on qbusforum.be
 
 ## JAR file
 You can download the JAR file to /usr/share/openhab2/addons/ to become available in the openHAB inbox
 
 ## Example files
 ### Things
 ```
 Bridge qbus:bridge:CTD1 [ addr="localhost", port=8447, refresh=300, sn="XXXXXX" ] {
  dimmer      1       "Dimmer1"             [ dimmerId=1 ]
  onOff       2       "Bistabiel1"          [ bistabielId=2 ]
  onOff       3       "Timer1"              [ bistabielId=3 ]
  onOff       4       "Timer2"              [ bistabielId=4 ]
  onOff       5       "Timer3"              [ bistabielId=4 ]
  onOff       6       "Mono1"               [ bistabielId=5 ]
  onOff       7       "Interval1"           [ bistabielId=6 ]
  thermostat  8       "Thermostat1"         [ thermostatId=7 ]
  scene       9       "Scene1"              [ sceneId=1 ]
  co2         10      "Productie"           [ co2Id=26 ]
 } 
 ```
 
 

 
 ### Items
 ```
 //dimmer
 Dimmer              dimmer             {channel="qbus:dimmer:CTD1:1:brightness"}
 //bistabiel, timers, mono, interval, scene
 Switch              Bistabiel1         {channel="qbus:onOff:CTD1:2:switch"}
 //thermostat
 Number:Temperature  thSP"[%.1f °C]"    {channel="qbus:thermostat:CTD1:8:setpoint"}
 Number:Temperature	 thCT"[%.1f °C]"    {channel="qbus:thermostat:CTD1:8:measured"}
 Number              thMODE             {channel="qbus:thermostat:CTD1:8:mode",ihc="0x33c311" , autoupdate="true"}
 //scene
 Switch     Toonzaal230V                 {channel="qbus:scene:CTD1:36:scene"}
 //CO2
 Number				ProductieCO2                 {channel="qbus:co2:CTD1:100:co2"}
 ```
