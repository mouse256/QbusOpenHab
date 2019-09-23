# QbusOpenHab
 This is the openHAB test binding for Qbus.
 The binding can't communicate directly to the Qbus controller but uses a client server application.
 
 ## Prerequieries
 Your controller must be activated for the DLL, call Qbus support to enable this.
 Your QDB should contain at least 1 thermostat, 1 dimmer, 1 bistabiel, 1 thermostat, one HVAC and 1 scene.
 
 ## Client & Server
 The client & Server applications are written in vb.net and uses the Qbus DLL to communicate with the Qbus controller.
 If you want to run these on a raspberry pi you must first install mono with the vb addon:
 
 `sudo apt-get install mono-runtime mono-vbnc mono-complete`
 
 ### Starting the Server.
 You can first start the server with the command
 
 `mono QServer.exe`
 
 ### Starting the Client.
 You can start the client with the command
 
 `mono QbusClient.exe ip login passwd sn`
 example:
 
 `mono QbusClient.exe 192.168.75.7 QBUS QBUS 002064`
 
 ### Starting at boot
 You can download the files under start and change the clientfile with you controller credentials.
 The you can add the files to crontab to start at boot.
 
 ## JAR file
 You can download the JAR file to /usr/share/openhab2/addons/ to become available in the openHAB inbox
 
 ## Example files
 ### Things
 `Bridge qbus:bridge:CTD1 [ addr="localhost", port=2004, refresh=300 ] {\n
  dimmer      1       "Dimmer1"             [ dimmerId=1 ]
  onOff       2       "Bistabiel1"          [ bistabielId=2 ]
  onOff       3       "Timer1"              [ bistabielId=3 ]
  onOff       4       "Timer2"              [ bistabielId=4 ]
  onOff       5       "Timer3"              [ bistabielId=4 ]
  onOff       6       "Mono1"               [ bistabielId=5 ]
  onOff       7       "Interval1"           [ bistabielId=6 ]
  thermostat  8       "Thermostat1"         [ thermostatId=7 ]
  scene       9       "Scene1"              [ sceneId=1 ]
 } `
 
 

 
 ### Items
  `//dimmer
 Dimmer              dimmer             {channel="qbus:dimmer:CTD1:1:brightness"}
 //bistabiel, timers, mono, interval, scene
 Switch              Bistabiel1         {channel="qbus:onOff:CTD1:2:switch"}
 //thermostat<br>
 Number:Temperature  thSP"[%.1f °C]"    {channel="qbus:thermostat:CTD1:8:setpoint"}
 Number:Temperature	 thCT"[%.1f °C]"    {channel="qbus:thermostat:CTD1:8:measured"}
 Number              thMODE             {channel="qbus:thermostat:CTD1:8:mode",ihc="0x33c311" , autoupdate="true"}
 `
