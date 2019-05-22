Design template for FIFO module. Please refer to the lecture notes.

1. Filelist:
   
   00_README.txt     : this README
   Makefile          : Makefile for simulation
   RAM32x8.pdf       : SRAM datasheet
   RAM32x8.v         : SRAM simulation model
   USERLIB.db        : SRAM synthesis model
   fifo.v            : FIFO top module (incomplete)
   fifo_ctr.v        : FIFO controller (incomplete)
   fifo_sample.fsdb  : FIFO sample waveform
   fifo_t.v          : FIFO sample stimulus (incomplete)
   header.v          : header file for RTL simulation
   header_syn.v      : Header file for gate-level simulation
   synopsys_dc.setup : Environment setup for synthesis, you should
                       rename it to .synopsys_dc.setup first

2. You may use ftp client such as FileZilla Client to upload hw03_fifo2017.tgz
   to your home directory.

3. To extract the file under Linux, use

  $ tar zxvf hw03_fifo2017.tgz


[ Simulation ]

For RTL simulation, sequential block can have extra delay as follows:

  always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
      state <= 2'b00;
    end else begin
      state <= #1 state_next;
    end
  end

Or use +notimingchecks to avoid timing check

  $ ncverilog deaign_t.v deaign.v  +notimingchecks


[ Synthesis ]

記憶體 RAM32x8 可以與 FIFO Controller 一起合成:
1. 把 USERLIB.db 放到你的工作目錄 (這是這次 SRAM 的 Synthesis Model)。
2. 並使用這份 .synopsys_dc.setup (記得更改為正確檔名)
   (改了 6-8 行，將 USERLIB.db 加入 library 內.)
3. 直接合成 fifo.v + fifo_ctr.v
   (Synthesis 不需要加入 RAM32x8.v, 它是不可合成的 functional model.)
4. 記得進行 Post-Synthesis Simulation 時還是需要用到 RAM32x8.v.


有任何問題請反應。

Happy Designing!

