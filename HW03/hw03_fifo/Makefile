## You may put the file header here
##   A template of Makefile
##

## define the filename of your memory model
RAMMODEL    = RAM32x8.v
VLOG        = ncverilog
SRC         = header.v \
              fifo_t.v \
              fifo.v \
              fifo_ctr.v \
              $(RAMMODEL)
SYNSRC      = header_syn.v \
              fifo_t.v \
              fifo_syn.v \
              $(RAMMODEL) \
              /theda21_2/CBDK_IC_Contest/cur/Verilog/tsmc13.v

VLOGARG     = +access+r
TMPFILE     = *.log \
              verilog.key \
              nWaveLog
#DBFILE      = *.fsdb *.vcd *.bak
#RM          = -rm -rf

all :: sim

sim :
	$(VLOG) $(SRC) $(VLOGARG)

syn :
	$(VLOG) $(SYNSRC) $(VLOGARG)
