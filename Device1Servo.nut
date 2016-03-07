const OtherAgentUrl = "https://agent.electricimp.com/bXsPPP286ll2"

// sending to Servo1 on imp_Johnny 
device.on("setServo1", function(potReading) {
  // build the URL
  local url = format("%s?setServo1=%i", OtherAgentUrl, potReading);
  server.log("Servo 1 :" + potReading);
  // make the request, and call the inline function
  // when we get a response
  http.get(url).sendasync(function(resp) {
    // log the response, should be 200: OK is things worked
    server.log(format("%i: %s", resp.statuscode, resp.body));
  });
});

// sending to Servo2 on imp_Johnny 
device.on("setServo2", function(potReading) {
  // build the URL
  local url = format("%s?setServo2=%i", OtherAgentUrl, potReading);
   server.log("Servo 2 :" + potReading);
  // make the request, and call the inline function
  // when we get a response
  http.get(url).sendasync(function(resp) {
    // log the response, should be 200: OK is things worked
    server.log(format("%i: %s", resp.statuscode, resp.body));
  });
});


// sending to Servo3 on imp_Johnny 
device.on("setServo3", function(potReading) {
  // build the URL
  local url = format("%s?setServo3=%i", OtherAgentUrl, potReading);
   server.log("Servo 3 :" + potReading);
  // make the request, and call the inline function
  // when we get a response
  http.get(url).sendasync(function(resp) {
    // log the response, should be 200: OK is things worked
    server.log(format("%i: %s", resp.statuscode, resp.body));
  });
});