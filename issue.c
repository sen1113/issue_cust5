#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<time.h>
typedef struct{
	long* top_addr;//top addr
	int size;//size
	int id;//id
	long* target_addr;//target addr
}cust5str_t;

cust5str_t* create_str(){
  cust5str_t* str;

  str=(cust5str_t*)malloc(sizeof(cust5str_t));
  if(str){
    str -> top_addr = NULL;
    str->size = 0;
    str->id = 0;
    str->target_addr = NULL;
  }
  return(str);
}

void destroy_str(cust5str_t* str){
  if(str){
    if(str->top_addr) free(str->top_addr);
    if(str->target_addr) free(str->target_addr);
    free(str);
  }
}


int main(int argc, char **argv){
  long* top_addr;
  long* target_addr;
  int id;
  long filesize;
  FILE *fp;
  char fname[256];

  long* input;
  int size;
  //file open
  strcpy(fname,argv[1]);
  if((fp=fopen(fname,"rb")) == NULL){
    fprintf(stderr,"Can't Open File\n");
    exit(2);
  }


  //get top_addr
  //top_addr = ftell(fp);
  printf("%p\n",fp);

  //get filesize
  fseek(fp,0,SEEK_END);
  filesize=ftell(fp);//filesize[byte]
  printf("%ld\n",filesize);

  fseek(fp,0,SEEK_SET);
  input = (long*)malloc(filesize);
  size=fread(input,sizeof(unsigned char),filesize,fp);


  //str1 setting
  cust5str_t* str1 = create_str();

 /* //debug */
 /*  printf("size:%d\n",size); */
 /*  printf("filesize:%ld\n",filesize); */
 /*  printf("top_addr:%p\n",input); */
 /*  printf("top_addr:%x\n",input[0]); */
 /*  printf("top_addr:%x\n",input[1]); */
 /*  printf("top_addr:%x\n",input[2]); */

  //next proccess maybe need "for" loop
  long num = 0;
  long out1 = 0;
    if(num<filesize){
      //issue cust5
      //l.cust5 target_addr(5) top_addr(5) id(5) size(6) (5)
      __asm__ (//"l.cmov %%r32,%%rA, %%rB;" //Set target_addr in registerD
      	       //"l.cmov %3, %%eax;"//Set top_addr in registerA
      	       //"l.movhi %%ebx,$0x00000"//Set  in registerB
      	       //Set size in L
      	       //Set id in K
      	       //"l.cust5 00000,11111,00000,000000,00000;"
      	       "l.cust5 %4,%1,%3,%2,0;"
      	       "l.nop;"
      	       "l.j 1"
      	       :"=r"(out1)
      	       :"r"(top_addr),"r"(size),"r"(id),"r"(target_addr)
      	       :
      	       );
    }
    else{
      /*
  	__asm__(
  	"l.cust5 rD,rA,rB,L,K \n\t;"
  	);
      */
    }


  //file close
  fclose(fp);
  free(input);
}
