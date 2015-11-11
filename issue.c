#include<stdio.h>
#include<stdlib.h>
#include<string.h>

typedef struct{
	unsigned long top_addr;//top addr
	unsigned int size;//size
	unsigned int id;//id
	unsigned long* target_addr;//target addr
}cust5str_t;

cust5str_t* create_str(){
  cust5str_t* str;

  str=(cust5str_t*)malloc(sizeof(cust5str_t));
  if(str){
    str -> top_addr = 0;
    str->size = 0;
    str->id = 0;
    str->target_addr = NULL;
  }
  return(str);
}

/* void destroy_str(cust5str_t* str){ */
/*   if(str){ */
/*     if(str->top_addr) free(str->top_addr); */
/*     if(str->target_addr) free(str->target_addr); */
/*     free(str); */
/*   } */
/* } */


int main(int argc, char **argv){
  unsigned long* top_addr;
  unsigned long* target_addr;
  unsigned long* input;

  unsigned int id;
  unsigned int size;
  unsigned long filesize;
  FILE *fp;



  //file open
  char *fname=(char* )malloc(strlen(argv[1])+1);
  strncpy(fname,argv[1],strlen(argv[1])+1);
  if((fp=fopen(fname,"rb")) == NULL){
    fprintf(stderr,"Can't Open File\n");
    exit(2);
  }



  //get filesize
  fseek(fp,0,SEEK_END);
  filesize=ftell(fp);//filesize[byte]
  printf("Filesize:%ld\n",filesize);

  fseek(fp,0,SEEK_SET);
  input = (unsigned long*)malloc(filesize);
  size=fread(input,sizeof(unsigned char),filesize,fp);


  //str1 setting
  cust5str_t* str1 = create_str();
  char buf[10];
  sprintf(buf,"%p",input);
  str1 -> top_addr = strtoul(buf,NULL,16);
  str1 -> size = size;

 //debug
  printf("fp_addr:%p\n",fp);
  printf("input:%p\n",input);
  printf("buf:%s\n",buf);
  printf("topaddr:%08lx\n",str1->top_addr);


  //inline assembler

  long num = 0;
  long out1 = 0;
    /* if(num<filesize){ */
    /*   //issue cust5 */
    /*   //l.cust5 target_addr(5) top_addr(5) id(5) size(6) (5) */
    /*   __asm__ (//"l.cmov %%r32,%%rA, %%rB;" //Set target_addr in registerD */
    /*   	       //"l.cmov %3, %%eax;"//Set top_addr in registerA */
    /*   	       //"l.movhi %%ebx,$0x00000"//Set  in registerB */
    /*   	       //Set size in L */
    /*   	       //Set id in K */
    /*   	       //"l.cust5 00000,11111,00000,000000,00000;" */
    /*   	       "l.cust5 %4,%1,%3,%2,0;" */
    /*   	       "l.nop;" */
    /*   	       "l.j 1" */
    /*   	       :"=r"(out1) */
    /*   	       :"r"(top_addr),"r"(size),"r"(id),"r"(target_addr) */
    /*   	       : */
    /*   	       ); */
    /* } */
    /* else{ */
    /*   /\* */
    /* 	__asm__( */
    /* 	"l.cust5 rD,rA,rB,L,K \n\t;" */
    /* 	); */
    /*   *\/ */
    /* } */


  //file close
  fclose(fp);
  free(input);
  // destroy_str(str1);
}
