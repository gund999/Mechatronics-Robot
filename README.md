# Autonomous Robot Project Documentation

## Objective

The objective of this project was to develop and construct an autonomous robot capable of navigating a designated field and successfully scoring goals against a goalie referred to as the "Giant Slug." 

The field layout consisted of the following elements:
- Two loading zones (A and B)
- Three scoring zones: one-point, two-point, and three-point zones
  - The one-point and two-point zones were marked by black tape.
  - The three-point zone was labeled using yellow track wire.
- A strip of black tape at the center of the field
- The goal featured a 2 kHz IR beacon positioned in the middle, accompanied by a red penalty zone.
- The goalie, named Sammy, had a 1.5 kHz IR beacon installed at the center of its head, with its location randomly changing every three seconds.

![Field Outline](Field_Outline.png)

Each robot had to achieve the following tasks:
- Successfully traverse the field while carrying three ping pong balls.
- Score six goals in two minutes.
- Return to its designated loading zone while avoiding on-field hazards.

## Team and Division of Labor

The team was divided as follows:
- Ramon: 3D design, electrical
- Evan: code, electrical
- Ayush: Camera, code, 3D Design secondary

## Design and Assembly

### Mechanical Design
#### First Layer:
- Incorporated two wheels provided by BELS for the drive train.
- Utilized an H-bridge for motor connectivity.
- Engineered motor mounts for stability.
- Developed bumpers for effective obstacle avoidance, undergoing four modifications before reaching the final iteration.

![Bottom Motor/Sensor Level](Bottom_Level.png)

#### Second Layer:
- Isolated for electrical components.
- Mounted the UNO32 board centrally for short wiring runs to critical components.
- Utilized the power distribution board for 5V and 3V3 rails.
- Installed counter-rotating flywheels’ H-bridge and other components.

![Electronic level](Electronic_Level.png)

#### Third Layer:
- Dedicated to fulfilling the project goals, including ball loading and shooting mechanisms.
- Used drive motors from BELS and shooter motors from PowerWheels for high torque and speed.
- Designed a double flywheel shooter fed from a V-shaped shooter intake, controlled by a servo gate.

![Shooter Design](Shooter_Design.png)
![Fully Built Robot](Fully_Built_Robot.png)

### Problems and Design Process
- Faced difficulties in mechanical design due to software learning curve and minor inaccuracies during fabrication.
- Encountered challenges with bumpers and shooter base dimensions, requiring multiple design adaptations.
- Addressed issues with motors and camera functionality during the coding phase.

## Electrical Components
- Resolved issues with beacon detection and tape sensors.
- Experienced occasional voltage rail conductivity issues, resolved with foam under the board.
- Explored using a boost converter for motor operation but eventually opted against it.
- Made adjustments to code for camera functionality, resolving issues with power fluctuations and startup time.

![Block Diagram](Block_Diagram.png)
![Pin Connections](Pin_Connections.png)

## Code
- Developed motor library and flywheel code for motor control.
- Incorporated gate control code and state machine framework.
- Utilized event checking functions for goal detection and behavior decision-making.

![Motor Driver Code](Motor_Driver_Code.png)
![Flywheel Code](Flywheel_Code.png)
![Servo Code](Servo_Code.png)
![CheckDestination() & CheckCam() functions](Check_Functions.png)

- Implemented a hierarchical state machine (HSM) for overall robot behavior.
- Debugged and iterated on code to achieve desired robot behavior within project constraints.

[View State Machine](https://online.visual-paradigm.com/community/share/ece118staterobotmachine-1e50vn2il2)

## Conclusion
Despite facing challenges throughout the design and assembly process, the team successfully developed an autonomous robot capable of navigating the designated field and scoring goals against the opponent goalie. While certain issues arose during testing and implementation, the team was able to adapt and overcome them to deliver a functional robot within project constraints.

For detailed code, refer to Gitlab repository (branch: Evan-work for camera code, Ayush for beacon code):
- Commit ID: E24244a3da774f0d375eaa8c5dc94d79bab041b5

### Appendix
[Hierarchical State Machine (HSM) Code](HSM_Code.txt)
