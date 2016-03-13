// Device 2 code
// Servo controlling Imp
// Attributions: https://gist.github.com/electricimp/7815818

globalIDCount <- 1;
previousPotReading <- 0;

serv1 <- hardware.pin5;
serv2 <- hardware.pin7;
serv3 <- hardware.pin8;
serv4 <- hardware.pin9;

class Servo {
    // Class constants
    SECOND_ARG = 0.02;
    SERVO_MIN = 0.03;
    SERVO_MAX = 0.12;
    POT_MIN = 200.0;
    POT_MAX = 65550.0;
    
    // Members
    id = 0;
    servo = null;
    
    constructor(serv) {
        serv.configure(PWM_OUT, SECOND_ARG, SERVO_MIN);
        
        servo = serv;
        id = globalIDCount;
        globalIDCount += 1;
    }
    
    function setServo(value) {
        local scaledValue = value * (SERVO_MAX - SERVO_MIN) + SERVO_MIN;
        servo.write(scaledValue);
    }
    
    function setServoToPot(potReading) {
        if (id == 2) {
            if (potReading > 40000) {
                potReading = 40000;
            } else if (potReading < 15000) {
                potReading = 15000;
            }
        }
        local servoVal = (potReading - POT_MIN) / (POT_MAX - POT_MIN);
        //server.log("potReading: " + potReading);
        //server.log("previousPotReading: " + previousPotReading);
        local diff = math.abs(potReading - previousPotReading);
        
        if (diff > 300) {
            setServo(servoVal);
        } else {
            //server.log("diff: " + diff);
        }
        
        previousPotReading = potReading;
    }
}

local servo1 = Servo(serv1);
local servo2 = Servo(serv2);
local servo3 = Servo(serv3);
local servo4 = Servo(serv4);

function setServo1(potReading) {
    server.log("setServo1 set to: " + potReading);
    servo1.setServoToPot(potReading);
}

function setServo2(potReading) {
    server.log("setServo2 set to: " + potReading);
    servo2.setServoToPot(potReading);
}

function setServo3(potReading) {
    server.log("setServo3 set to: " + potReading);
    servo3.setServoToPot(potReading);
}

function setServo4(potReading) {
    server.log("setServo4 set to: " + potReading);
    servo4.setServoToPot(potReading);
}

agent.on("setServo1", setServo1);
agent.on("setServo2", setServo2);
agent.on("setServo3", setServo3);
agent.on("setServo4", setServo4);