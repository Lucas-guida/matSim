# matSim
This project is to create a simulation of a satelite simulator with a robotic arm.


# Files Structure

- main.m
- recinit.m
- Robot.m
- Singleton.m
- public
  * simRunning.PNG

## Singleton.m
This is an abstract class for general OOP design. This class extends the handel class.

## main.m
This is the main code that runs the program. To setup a robot we use the below code which sets up the x y and z positions in an 1D array, sets the robots orentation and the color. We then create an instance of the robot:

```
pos1 = [0.25,0.25,0];
or1 = 0;
color1 = 'Cyan';

Robot1 = Robot.instance(pos1, color1, or1)
```

To rotate the robot we call the rotate function where you pass the robot instance with an angle to rotate:
```
Robot1 = rotate(Robot1, 45);
```

To move the robot you call the translate function. This takes a robot instance as well as an array with the desired distance to travel:[Forward, Backward, Right, Left] (This is to corrispond with the thrusters):
```
Robot1 = translate(Robot1, [1 0 1 0]);
```
