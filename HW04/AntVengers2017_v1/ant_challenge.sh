#!/bin/sh
ncverilog \
  header.v \
  header_maze07x06.v \
  AntVengers.v maze_universe.v ant_suit.v \
  +debug=2 \
  +define+CHALLENGE \
  +access+r
