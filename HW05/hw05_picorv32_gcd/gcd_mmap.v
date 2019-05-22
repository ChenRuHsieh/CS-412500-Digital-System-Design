module GCD_MMAP (
    input clk,
    input en,
    input rst_n,
    input [31:0] addr,
    input valid,
    input [3:0] wstrb,
    output reg ready,
    input [31:0] wdata,
    output reg [31:0] rdata
);
`undef BLOCKING_OUTPUT
// GCD_MMAP's address mapping
parameter GCD_MMAP_BASE = 32'h4000_0000;
parameter GCD_MMAP_RANG = 32'h0000_ffff;
parameter GCD_MMAP_READ_STATUS  =   32'h0000_0000;
parameter GCD_MMAP_READ_Y       =   32'h0000_0004; // jump 4bytes = 32bits
parameter GCD_MMAP_WRITE_A      =   32'h0000_0008;
parameter GCD_MMAP_WRITE_B      =   32'h0000_000c;
parameter GCD_MMAP_START        =   32'h0000_0010;

// Input A
reg [31:0] A;
// Input B
reg [31:0] B;
// Output Y
reg [31:0] Y;
// Signal to start calculation
reg start;
// Internal masked  address
wire [31:0] gcd_addr;

assign gcd_addr = (addr) & GCD_MMAP_RANG;

/**
 *	This block handles the MMAP request.
 *
 *	Signal description:
 *	[31:0] addr: MMAP request address
 *	[31:0] wdata:Data write from master
 *	[31:0] rdata:Data read from module
 *  [3:0] wstrb: each bit enables 8-bit write to the 32-bit data
 *  valid:		 MMAP request from master
 *  ready:	     MMAP request is handled
 */
always @(posedge clk or negedge rst_n)
begin
    if (!rst_n) begin
        A <= 0;
        B <= 0;
        start <= 0;
    end else begin
        start <= 0;
        ready <= 0;
        if (en && valid && !ready) begin
            if (!wstrb) begin   //read
                case (gcd_addr)
                    // Read the state of the state machine
                    GCD_MMAP_READ_STATUS: begin
//                        rdata <= your_state; //TODO
                        ready <= 1;
                    end
                    // Read GCD output
                    // If using blocking output, ready signal will be set
                    // after GCD is completed.
                    // If not using blocking output, SW need to read the
                    // status to determine whether GCD is completed in order
                    // to read the correct output.
                    GCD_MMAP_READ_Y: begin
                        rdata <= Y;
`ifdef BLOCKING_OUTPUT
//                        if (your_state != CALCULATE_STATE) begin //TODO
//                                ready <= 1;
//                        end
`else
                        ready <= 1;
`endif
                    end
                    default: $display("GCD_MMAP: read invalid reg: %h(%h)", gcd_addr, addr);
                endcase
            end else begin      //write
                case (gcd_addr)
                    // Write A reg
                    GCD_MMAP_WRITE_A: begin
                        A <= wdata;
                        ready <= 1;
                    end
                    // Write B reg
                    GCD_MMAP_WRITE_B: begin
                        B <= wdata;
                        ready <= 1;
                    end
                    // Write anything to GCD_MMAP_START to start calculation
                    GCD_MMAP_START: begin
                        start <= 1;
                        ready <= 1;
                    end
                    default: $display("GCD_MMAP: write invalid reg: %h(%h)", gcd_addr, addr);
                endcase
            end
        end
    end
end

//TODO
// Implement your GCD design below, use successive subtraction method only
always@(posedge clk or negedge rst_n)begin
	if(!rst_n) begin
		Y <= 0;
	end
end


endmodule
