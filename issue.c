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
  unsigned long* input_addr;
  unsigned long* output_addr;
  unsigned long* target_addr;
  unsigned long* input;

  unsigned int id;
  unsigned int size;
  unsigned long filesize;
  FILE *fp;
  int msize = 64;//hash size is 512bit=64byte



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

  //target addr setting
  target_addr = (unsigned long*)malloc(msize);


  //str1 setting
  cust5str_t* str1 = create_str();
  char buf[10];
  sprintf(buf,"%p",input);
  str1 -> top_addr = strtoul(buf,NULL,16);
  str1 -> size = size;

 //debug
  /* printf("fp_addr:%p\n",fp); */
  /* printf("input:%p\n",input); */
  /* printf("buf:%s\n",buf); */
  /* printf("topaddr:%08lx\n",str1->top_addr); */
  /* printf("target_addr:%p\n",target_addr); */

  //inline assembler

  int	i      = 0;
  int	max    = (int)size/4;
  unsigned long hash512 = 0;

  //input
  input_addr   = top_addr;
  for(i = 0; i <= max; i++){
    input_addr = input_addr + i*4;
    if (i == 0){
      __asm__(
	"l.cust5 %0,%1,0,0,4;"	//start
	:"=r"(hash512)
	:"r"(input_addr),"r"(target_addr)
	      )
    }
    else if(i < max){
      __asm__(
	"l.cust5 %0,%1,0,0,2;"	//middle
	:"=r"(hash512)
	:"r"(input_addr),"r"(target_addr)
	      )
    }
    else if(i == max){
      __asm__(
	"l.cust5 %0,%1,0,0,1;"	//end
	:"=r"(hash512)
	:"r"(top_addr),"r"(target_addr)
	      )
    }
    //devide & output
    __asm__(
	    "l.cust5 %0,0,0,0,8;l.addi %0,%1,4;"//store
	    "l.cust5 %0,0,0,1,8;l.addi %0,%1,4;"
	    "l.cust5 %0,0,0,2,8;l.addi %0,%1,4;"
	    "l.cust5 %0,0,0,3,8;l.addi %0,%1,4;"
	    "l.cust5 %0,0,0,4,8;l.addi %0,%1,4;"
	    "l.cust5 %0,0,0,5,8;l.addi %0,%1,4;"
	    "l.cust5 %0,0,0,6,8;l.addi %0,%1,4;"
	    "l.cust5 %0,0,0,7,8;l.addi %0,%1,4;"
	    "l.cust5 %0,0,0,8,8;l.addi %0,%1,4;"
	    "l.cust5 %0,0,0,9,8;l.addi %0,%1,4;"
	    "l.cust5 %0,0,0,10,8;l.addi %0,%1,4;"
	    "l.cust5 %0,0,0,11,8;l.addi %0,%1,4;"
	    "l.cust5 %0,0,0,12,8;l.addi %0,%1,4;"
	    "l.cust5 %0,0,0,13,8;l.addi %0,%1,4;"
	    "l.cust5 %0,0,0,14,8;l.addi %0,%1,4;"
	    "l.cust5 %0,0,0,15,8;l.addi %0,%1,4;"
	    :"=r"(output_addr)
	    :"r"(target_addr)
	    :
	    )
      }


  }

  //file close
  fclose(fp);
  free(input);
  free(target_addr);
  // destroy_str(str1);
}


    /* if(num<filesize){ */
    /*   //issue cust5 */
    /*   //l.cust5 target_addr(5) top_addr(5) id(5) size(6) (5) */
    /*   __asm__ ( */
    /* 	       "l.lwz %rA, %1,0b0000_0000_0000_0000;" */
    /* 	       LOOP: */
    /* 	       "l.lwz %rA, %1+4i, 0000_0000_0000_0000;" */
    /* 	       ""//check loop_count */
    /* 	       START: */
    /* 	       "l.cust5 %2,%rA,00000,000000,00100;"//start keccak */
    /* 	       "l.jr LOOP;" */
    /* 	       PROGRESS: */
    /* 	       "l.cust5 %2,%1,00000,000000,00010;"//keccak in progress */
    /* 	       "l.jr LOOP;" */
    /* 	       END: */
    /* 	       "l.cust5 %4,%1,%3,0,1;"//finish keccak */

    /* 	       "l.sfeqi %5,0;"//check if loop_count == 0 */
    /* 	       "l.jr LOOP;" */
    /* 	       //"l.cust5 %0,%1,%3,0,8;"//hash output */
    /*   	       :"=r"(out1) */
    /*   	       :"r"(top_addr),"r"(target_addr),"r"(loop_count) */
    /*   	       : */
    /*   	       ); */
    /* } */
   
