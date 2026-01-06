module tb_line_follower_voice;

reg s1, s2;
reg [2:0] cmd;
wire m1a, m1b, m2a, m2b;

line_follower_voice uut(.s1(s1), .s2(s2), .cmd(cmd), .m1a(m1a), .m1b(m1b), .m2a(m2a), .m2b(m2b));

initial begin
    $monitor("Time=%0t | cmd=%b | s1=%b | s2=%b | m1a=%b | m1b=%b | m2a=%b | m2b=%b", 
              $time, cmd, s1, s2, m1a, m1b, m2a, m2b);

    // Initial
    cmd=3'b000; s1=0; s2=0; #10;  // Auto forward
    s1=1; s2=0; #10;              // Turn right
    s1=0; s2=1; #10;              // Turn left
    s1=1; s2=1; #10;              // Stop (line lost)

    // Voice control mode
    cmd=3'b001; #10;  // Forward
    cmd=3'b010; #10;  // Turn Right
    cmd=3'b011; #10;  // Turn Left
    cmd=3'b100; #10;  // Stop
    cmd=3'b101; #10;  // Reverse

    // Return to auto mode
    cmd=3'b000; s1=0; s2=0; #10; // Forward again
    $stop;
end

endmodule
