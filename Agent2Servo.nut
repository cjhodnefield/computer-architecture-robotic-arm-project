// Agent 2 code
// Servo controlling Imp
// Attributions: https://gist.github.com/electricimp/7815818

function requestHandler(request, response) {
  try {
    if ("setServo1" in request.query) {
        local potReading = request.query.setServo1.tointeger();
        device.send("setServo1", potReading);
        server.log("setServo1 received: " + potReading);
    }
    
    if ("setServo2" in request.query) {    
        local potReading = request.query.setServo2.tointeger();
        device.send("setServo2", potReading);
        server.log("setServo2 received: " + potReading);
    }
    
    if ("setServo3" in request.query) {    
        local potReading = request.query.setServo3.tointeger();
        device.send("setServo3", potReading);
        server.log("setServo3 received: " + potReading);
    }
    
    // send a response back saying everything was OK.
    response.send(200, "OK");
  } catch (ex) {
  	// if something went wrong - send back an error response
    response.send(500, "Internal Server Error: " + ex);
  }
}
 
// register the HTTP handler
http.onrequest(requestHandler);