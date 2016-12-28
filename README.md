# 68KMB-Programs

These programs were written for a microcomputers course which I took in my second year. 
Both programs run on the 68KMB - a fairly old piece of hardware mostly used for educational purposes nowadays.

Below is a detailed description of what each program does:

integerPrinter: 
  Prints out the integer value found within data register D3 onto the screen. The program converts an integer value 
  into ASCII by successively dividing the number by 10 and setting 0011 to the upper bits of the remainder byte.
  The remainder ASCII character is then printed onto the screen using TRAP #1. Printing stops when the remainder is 0.
  This program makes use of stacks, loops and user defined trap instructions.
  
ledOutput: 
  Prints out ASCII characters from a keyboard onto 8 leds. This is done by utilizing the DUART and a simple polling strategy:
  if the buffer is empty - check the buffer again, if not, clear and set the pins on the output port of the DUART to reflect
  the bit value of the ASCII character. The program terminates when "q" is read.
  This program was written to demonstrate an understanding of memory-mapped IO and polling.
