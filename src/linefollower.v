module line_follower_voice(
    input s1, s2,             // IR sensors
    input [2:0] cmd,          // Voice/command input
    output reg m1a, m1b,      // Motor 1 controls
    output reg m2a, m2b       // Motor 2 controls
);
always @(*) begin
    case(cmd)
        // Voice control (manual mode)
        3'b001: begin // Forward
            m1a=1; m1b=0; m2a=1; m2b=0;
        end
        3'b010: begin // Turn Right
            m1a=1; m1b=0; m2a=0; m2b=0;
        end
        3'b011: begin // Turn Left
            m1a=0; m1b=0; m2a=1; m2b=0;
        end
        3'b100: begin // Stop
            m1a=0; m1b=0; m2a=0; m2b=0;
        end
        3'b101: begin // Reverse
            m1a=0; m1b=1; m2a=0; m2b=1;
        end
        // Auto (line following mode)
        default: begin
            if (s1==0 && s2==0) begin
                // Both on black line ? move forward
                m1a=1; m1b=0; m2a=1; m2b=0;
            end 
            else if (s1==1 && s2==0) begin
                // Left on white ? turn right
                m1a=0; m1b=0; m2a=1; m2b=0;
            end 
            else if (s1==0 && s2==1) begin
                // Right on white ? turn left
                m1a=1; m1b=0; m2a=0; m2b=0;
            end 
            else begin
                // Both on white ? stop (line lost)
                m1a=0; m1b=0; m2a=0; m2b=0;
            end
        end
    endcase
end

endmodule
