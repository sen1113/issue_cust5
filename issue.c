#include<stdio.h>
#include<stdlib.h>



typedef struct{
	int top_addr;//top addr
	int size;//size
	int id;//id
	int target_addr;//target addr
}cust5_str;


int main(int argc, char **argv){
  FILE *fp;
  char *fname;
  //Read Logfile
  strcpy(fname,argv[1]);
  if((fp=fopen(fname,"r"))=NULL){
    fprintf(stderr,"Can't Open File\n");
    exit(2);
  }


  //issue cust5
  __asm__(
	"l.cust5 rD,rA,rB,L,K \n\t;"
	);

}
