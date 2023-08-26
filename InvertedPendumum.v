`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2023 19:39:59
// Design Name: 
// Module Name: InvertedPendumum
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


module InvertedPendulum (
  input wire clk,
  input wire reset,
  input wire pendulum_angle_sensor,
  output reg cart_motor_control
);

  // Parameters
  parameter MAX_VALUE = 8'hFF;
  parameter MIN_VALUE = 8'h00;
  parameter TARGET_ANGLE = 8'h80;

  // Registers
  reg [7:0] control_signal;

  // Control algorithm
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      control_signal <= 8'b00000000;
    end else begin
      // Calculate control signal based on pendulum angle sensor 
      
      if (pendulum_angle_sensor > TARGET_ANGLE) begin
        if (control_signal < MAX_VALUE)
          control_signal <= control_signal + 1;
      end else if (pendulum_angle_sensor < TARGET_ANGLE) begin
        if (control_signal > MIN_VALUE)
          control_signal <= control_signal - 1;
      end
    end
  end

  // Motor control
  always @(posedge clk or posedge reset) begin
    if (reset) 
      cart_motor_control <= 1'b0;
    
    else begin
      // Apply control signal to cart motor
      if (control_signal > 8'h80)
        cart_motor_control <= 1'b1;
      else
        cart_motor_control <= 1'b0;
    end
  end

endmodule

