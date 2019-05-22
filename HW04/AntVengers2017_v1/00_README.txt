To extract the tar-gzipped file, use the following Linux/UNIX command:

  $ tar zxvf AntVengers.tgz

File list:
----------
00_README.txt       : This README file.
ant.sh              : Shell script to simulate the example.
ant_fsdb.sh         : Shell script to simulate the example with fsdb output.
ant_challenge.sh    : Shell script to turn on the challenge mode.
header.v            : Header file for AntVengers!
AntVengers.v        : AntVengers! test stimulus.
maze_universe.v     : Maze Universe that reacts to your Ant-Hero suit.
ant_suit.v          : Ant-Man suit that you are going to design and
                    : replace with.
header_maze*.v      : Header file for maze examples.
maze*.txt           : Maze examples.


Simulation:
-----------

To perform the simulation, here is the example:

  $ ncverilog \
      header.v header_maze07x06.v \
      AntVengers.v maze_universe.v ant_suit.v \
      +debug=1 \
      +fsdbfile=maze07x06.fsdb \
      +access+r

You should include the Verilog files in the same order, with two optional
arguments:

  1. [+debug]
     For current version, use +debug=1 to set the debug level as 1.
     Feel free to implement your own debug features.

  2. [+fsdbfile=filename.fsdb]
     Without this argument, no fsdb file will be generated.
     Remember that '+access+r' is necessary for FSDB dumping.

  3. [+define+CHALLENGE]
     This is equivalent to the following statement in the Verilog file:

       `define CHALLENGE

     But you can control it dynamically when invoking ncverilog (i.e.,
     you don't need to modify the source code every time).

To perform the simulation using the shell scripts:

  $ ./ant.sh

  or

  $ sh ant.sh

You may need to make the script executable (only needed for
the first time):

  $ chmod +x ant.sh

To use different maze files, include different maze header
other than "header_maze07x06.v" in the script (refer to
ant_fsdb.sh for the example).

NOTE:
-----
There are several maze examples:

    header_maze07x06.v
    maze07x06.txt
    header_maze09x07.v
    maze09x07.txt
    header_maze10x11.v
    maze10x11.txt
    header_maze15x15.v
    maze15x15.txt

There is an maze example for challange mode:

    header_maze15x15-2.v
    maze15x15-2.txt

You are asked to create fancy mazes by your own.



FAQ:

最基本就是要設計自己的 ant_suit.v, header_maze*.v maze*.txt. 這些是一定要的部分。
其他若有修改，有改到的也要交。請參考規格描述，以及這些 Verilog Source Code (especially for the challenge mode).

請不要在你的設計裡使用 ant_suit.v 裡的 task, 像是 turning_left, turning_right, moving_forward, standing_still。

這些 task 只是將固定的動作包起來，提高可讀性。仔細看裡頭用到了像是

  @(posedge clk) move = forward;

帶 timing 控制的寫法，就像是多加了一個 DFF 一樣。設計時如果沒有考慮進去，整個 timing 會亂掉喔。

我建議只把範例的 input/output/parameter 留下來就好，其他都去掉。


