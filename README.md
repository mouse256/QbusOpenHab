# QbusOpenHab
 This is the openHAB binding for Qbus.
 The binding can't communicate directly to the Qbus controller but uses a client server application.
 
 ## Client & Server
 The client & Server applications are written in vb.net and uses the Qbus DLL tom communicate with the Qbus controller.
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
 
 
 
