#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<time.h>
typedef struct{
	long top_addr;//top addr
	int size;//size
	int id;//id
	long target_addr;//target addr
}cust5str_t;


int main(int argc, char **argv){
  long top_addr;
  int id;
  long filesize;
  FILE *fp;
  char fname[256];
  cust5str_t str1;

  //file open
  strcpy(fname,argv[1]);
  if((fp=fopen(fname,"rb")) == NULL){
    fprintf(stderr,"Can't Open File\n");
    exit(2);
  }

  //get top_addr
  top_addr = ftell(fp);
  printf("%p\n",fp);
  //get filesize
  fseek(fp,0,SEEK_END);
  filesize=ftell(fp);
  printf("%ld\n",filesize);

  //str1 setting
  str1.top_addr = fp;
  str1.size = filesize;
  str1.id = 0;
  str1.target_addr=0x0;

  for(;;){
    if(/*input file exist*/){
  //issue cust5
  /*
  __asm__(
	  "l.cust5 rD,rA,rB,L,K \n\t;"
	);
  */
    }
    else if(/*last file*/){
      /*
	__asm__(
	"l.cust5 rD,rA,rB,L,K \n\t;"
	);
      */
    }
  }
  //file close
  fclose(fp);
}
