globalIDCount <- 0;
 
function potRead(pot) {
    local val = pot.read();
    return val;
}
 
class Potentiometer {
    // Members
    id = 0;
    potentiometer = null;
    previousPotReading = 0;

   
    constructor(pot) {
        pot.configure(ANALOG_IN);
       
        potentiometer = pot;
        id = globalIDCount;
        globalIDCount += 1;
    }
   
    function potRead() {
        local val = potentiometer.read();
        return val;
    }
    
    
}
 
potentiometer1 <- hardware.pin1;
potentiometer2 <- hardware.pin5;
potentiometer3 <- hardware.pin7;
potentiometer4 <- hardware.pin8;
 
local pot1 = Potentiometer(potentiometer1);
local pot2 = Potentiometer(potentiometer2);
local pot3 = Potentiometer(potentiometer3);
local pot4 = Potentiometer(potentiometer4);
 
function checkPotReading(pot) {
    local potReading = pot.potRead();
    //server.log("potReading: " + potReading);
    //server.log("previousPotReading: " + pot.previousPotReading);
    local diff = math.abs(potReading - pot.previousPotReading);
   
    if (diff > 300) {
        if (pot.id == 0) {
            agent.send("setServo1", potReading);
        } else if (pot.id == 1) {
            agent.send("setServo2", potReading);
        } else if (pot.id == 2) {
            agent.send("setServo3", potReading);
        } else if (pot.id == 3) {
            agent.send("setServo4", potReading);
        }
    }
   
    pot.previousPotReading = potReading;
}

function initialPotReads() {
    server.log("pot1: " + pot1.potRead());
    server.log("pot2: " + pot2.potRead());
    server.log("pot3: " + pot3.potRead());
    server.log("pot4: " + pot4.potRead());
}

function update() {
    checkPotReading(pot1);
    checkPotReading(pot2);
    checkPotReading(pot3);
    checkPotReading(pot4);
   
    imp.wakeup(0.4, update);
    //server.log("Pin 9:" + pot4.potRead());
    //agent.send("setServo4", 1000);
    
}

initialPotReads();
update();
