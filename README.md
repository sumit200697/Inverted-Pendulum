# Inverted-Pendulum

# Project Title: Design a logic and corresponding testbench for control of inverted pendulum using verilog

## Project Description:
The project involves designing and implementing a control system for an inverted pendulum using Verilog hardware description language. An inverted pendulum is a classic example in control theory that demonstrates the concept of stabilizing an inherently unstable system. The control system will be implemented on an FPGA, and a test bench will be created to simulate and validate the functionality of the code.

## Key Components:

#### Verilog Code for Control Algorithm (InvertedPendulum Module):

- The code will define an InvertedPendulum module with clock (clk), reset (reset), pendulum angle sensor (pendulum_angle_sensor), and cart motor control (cart_motor_control) as inputs and outputs.
A control algorithm will be implemented to calculate the control signal based on the difference between the measured pendulum angle and a target angle.
- The control signal will be used to control the cart's motor, attempting to keep the pendulum balanced.
 
#### Test Bench for Simulation:

- A Verilog test bench will be created to simulate the behavior of the InvertedPendulum module.
The test bench will generate clock and reset signals and provide stimulus for the pendulum angle sensor input.
Multiple test cases will be designed to cover various scenarios such as pendulum balancing, movement in different directions, and response to changes in the pendulum angle.

#### Simulation and Validation:

- The Verilog code and the test bench will be compiled and simulated using a Verilog simulator (xilinx vivado is used here).
Simulation results will be analyzed to verify if the control algorithm behaves as expected, stabilizing the inverted pendulum for different conditions.
