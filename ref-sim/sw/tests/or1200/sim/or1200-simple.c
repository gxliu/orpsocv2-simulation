/*
 *
 * Test run first, to check the main loop is reached and the exit mechanism
 * functions OK
 *
 */
 

#include "cpu-utils.h"

int main()
{
  volatile int first = 0;
  volatile int second = 1;
  volatile int third, n;
  int i;

  for (i=0; i<=100; i++)
    {
      third = first + second;
      first = second;
      second = third;
      report(third);
    }

  report(0x8000000d);
  exit(0);
}
