#include <stdio.h>
#include <time.h>

extern int fibonacci(int x);

int main(int argc, char **argv)
{
  int number=0;
  int result=0;
  clock_t start, end;
  double diff;

  scanf("%d",&number);
  start = clock();
  result = fibonacci(number);   
  end = clock();
  diff = end - start;
  printf("The fibonacci sequence at %d is: %d\n", number, result);
  printf("Time spent: %f sec\n", diff/CLOCKS_PER_SEC);
}

