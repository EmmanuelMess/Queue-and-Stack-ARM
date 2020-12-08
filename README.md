A small implementation of a Queue and Stack in ARM assembly.

# To run
* `arm-linux-gnueabi-gcc -static -marm -o main main.c stack.s queue.s`
* `qemu-arm main`

# Credits
* @IgnacioPetru for knowledge on ARM
* Rosetta Code for the C code of the [Shunting Yard](https://rosettacode.org/wiki/Parsing/Shunting-yard_algorithm#C)