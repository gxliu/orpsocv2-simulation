#include "cpu-utils.h"

int main() {
  volatile int first,second,third;
  int i;

  first = 0;
  second = 1;
  for (i=0;i<20;i++) {
    third = first + second;
    first = second;
    second = third;
    asm("l.addi\tr3,%0,0": :"r" (third));
    asm("l.nop %0": :"K" (0x0002));
  }
  asm("l.addi\tr3,%0,0": :"r" (0x8000000d));
  asm("l.nop %0": :"K" (0x0002));

  asm("l.add r3,r0,%0": : "r" (0));
  asm("l.nop %0": :"K" (0x0001));
  while (1);
}
