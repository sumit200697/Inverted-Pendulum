`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2023 19:47:29
// Design Name: 
// Module Name: InvertedPendulum_Testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module InvertedPendulum_Testbench;
  // Inputs
  reg clk;
  reg reset;
  reg pendulum_angle_sensor;

  // Outputs
  wire cart_motor_control;

  // Instantiate the module under test
  InvertedPendulum dut (
    .clk(clk),
    .reset(reset),
    .pendulum_angle_sensor(pendulum_angle_sensor),
    .cart_motor_control(cart_motor_control)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Test stimulus
  initial begin
    // Initialize inputs
    clk = 0;
    reset = 1;
    pendulum_angle_sensor = 8'b00000000;

    // Reset the system
    #10 reset = 0;

    // Test case 1: No movement (control_signal = 0)
    #20 pendulum_angle_sensor = 8'h00000000;
    #10 pendulum_angle_sensor = 8'h00000000;
    #10 pendulum_angle_sensor = 8'h00000000;

    // Test case 2: Movement in one direction (control_signal > 0)
    #20 pendulum_angle_sensor = 8'h00000001;
    #10 pendulum_angle_sensor = 8'h00000002;
    #10 pendulum_angle_sensor = 8'h00000003;

    // Test case 3: Movement in the opposite direction (control_signal < 0)
    #20 pendulum_angle_sensor = 8'h000000FF;
    #10 pendulum_angle_sensor = 8'h000000FE;
    #10 pendulum_angle_sensor = 8'h000000FD;

    // Finish simulation
    #10 $finish;
  end
endmodule

