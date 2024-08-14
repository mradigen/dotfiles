#import <string.h>

int main(int argc, char** argv) {
  char flag[65] = "REPLACE";
  if (!strcmp(argv[1],flag)) {
    return 0;
  }
  return 1;
} 
