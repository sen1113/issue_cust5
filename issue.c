#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<time.h>

typedef struct{
	unsigned long top_addr;//top addr
	unsigned int size;//size
	unsigned int id;//id
	unsigned long target_addr;//target addr
}cust5str_t;

cust5str_t* create_str(){
  cust5str_t* str;

  str=(cust5str_t*)malloc(sizeof(cust5str_t));
  if(str){
    str -> top_addr = 0;
    str -> size = 0;
    str -> id = 0;
    str -> target_addr = 0;
  }
  return(str);
}


void destroy_str(cust5str_t* str){
  if(str){
    free(str);
  }
}


int main(int argc, char **argv){
  unsigned long* top_addr;
  unsigned long input_addr;//NOT pointer
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
  char buf[9];
  sprintf(buf,"%p",input);
  str1 -> top_addr = strtoul(buf,NULL,16);
  sprintf(buf,"%p",target_addr);
  str1 -> target_addr = strtoul(buf,NULL,16);
  str1 -> size = size;

 //debug
  printf("fp_addr:%p\n",fp);
  printf("input:%p\n",input);
  printf("size:%d\n",size);
  printf("buf:%s\n",buf);
  printf("contents of top_addr:%s\n",(char *)(str1->top_addr));//input file 1st 32bit
  printf("target_addr:%p\n",target_addr);

  //inline assembler

  int	i      = 0;
  int	max    = (int)size/4;
  int store_en = 0;
  unsigned long hash32 = 0;
  unsigned long tmp = 0;
  unsigned long dummy = 0;

  //input
  for(i = 0; i <= max-1; i++){
   input_addr = str1->top_addr + 4*i;//generate next input_addr
    if (i == 0){
      __asm__(
	"l.lwz %0,0(%1)\n\t"//LOAD FROM input_addr to tmp
  	"l.cust5 %2,%0,%1,0,4\n\t"	//start
  	:"=r"(tmp)
  	:"r"(input_addr),"r"(dummy)
	:
  	      ); printf("%d\t %08lx\n",i,tmp);
    }
    else if(i < max-1){
      __asm__(
	"l.lwz %0,0(%1)\n\t"//LOAD FROM input_addr to tmp
  	"l.cust5 %2,%0,%1,0,2\n\t"	//middle
  	:"=r"(tmp)
  	:"r"(input_addr),"r"(dummy)
	:
  	      );  printf("%d\t %08lx\n",i,tmp);
    }
    else if(i == max-1){
      __asm__(
	"l.lwz %0,0(%1)\n\t"//LOAD FROM input_addr to tmp
  	"l.cust5 %2,%0,%1,0,1\n\t"	//end
  	:"=r"(tmp)
  	:"r"(input_addr),"r"(dummy)
	:
  	      ); printf("%d\t %08lx\n",i,tmp);
    }
  }//End of "for" loop

  sleep(10);

/*   //devide ; output ;rotate */
/*   //l.cust5 hash32 XX,XX, hash_num,storemode */
/*   //l.sw 0,target_addr,hash32,0; */


  unsigned long tmp1 = 0;
  unsigned long tmp2 = 0;
 unsigned long tmp3 = 0;
 unsigned long tmp4 = 0;
 unsigned long tmp5 = 0;
 unsigned long tmp6 = 0;
 unsigned long tmp7 = 0;
 unsigned long tmp8 = 0;
 unsigned long tmp9 = 0;
 unsigned long tmp10 = 0;
 unsigned long tmp11 = 0;
 unsigned long tmp12 = 0;
 unsigned long tmp13 = 0;
 unsigned long tmp14 = 0;
 unsigned long tmp15 = 0;
 unsigned long tmp16 = 0;






  __asm__(
  	  "l.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\t"
  	  "l.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\t"
  	  "l.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\t"
  	  "l.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\t"
  	  "l.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\t"
  	  "l.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\t"
  	  /* "l.cust5 %2,%3,%3, 0,8\n\t l.sw 0(%1),%2\n\t "//store */
  	  /* "l.cust5 %2,%3,%3, 1,8\n\t l.sw 4(%1),%2\n\t " */
  	  /* "l.cust5 %2,%3,%3, 2,8\n\t l.sw 8(%1),%2\n\t " */
  	  /* "l.cust5 %2,%3,%3, 3,8\n\t l.sw 12(%1),%2\n\t " */
  	  /* "l.cust5 %2,%3,%3, 4,8\n\t l.sw 16(%1),%2\n\t " */
  	  /* "l.cust5 %2,%3,%3, 5,8\n\t l.sw 20(%1),%2\n\t " */
  	  /* "l.cust5 %2,%3,%3, 6,8\n\t l.sw 24(%1),%2\n\t " */
  	  /* "l.cust5 %2,%3,%3, 7,8\n\t l.sw 28(%1),%2\n\t " */
  	  /* "l.cust5 %2,%3,%3, 8,8\n\t l.sw 32(%1),%2\n\t " */
  	  /* "l.cust5 %2,%3,%3, 9,8\n\t l.sw 36(%1),%2\n\t " */
  	  /* "l.cust5 %2,%3,%3,10,8\n\t l.sw 40(%1),%2\n\t " */
  	  /* "l.cust5 %2,%3,%3,11,8\n\t l.sw 44(%1),%2\n\t " */
  	  /* "l.cust5 %2,%3,%3,12,8\n\t l.sw 48(%1),%2\n\t " */
  	  /* "l.cust5 %2,%3,%3,13,8\n\t l.sw 52(%1),%2\n\t " */
  	  /* "l.cust5 %2,%3,%3,14,8\n\t l.sw 56(%1),%2\n\t " */
  	  /* "l.cust5 %2,%3,%3,15,8\n\t l.sw 60(%1),%2\n\t " */
	  "l.cust5 %3,%2,%2, 0,8\n\t l.sw 0(%1),%3\n\t "//store
  	  "l.cust5 %4,%2,%2, 1,8\n\t l.sw 4(%1),%4\n\t "
  	  "l.cust5 %5,%2,%2, 2,8\n\t l.sw 8(%1),%5\n\t "
  	  "l.cust5 %6,%2,%2, 3,8\n\t l.sw 12(%1),%6\n\t "
  	  "l.cust5 %7,%2,%2, 4,8\n\t l.sw 16(%1),%7\n\t "
  	  "l.cust5 %8,%2,%2, 5,8\n\t l.sw 20(%1),%8\n\t "
  	  "l.cust5 %9,%2,%2, 6,8\n\t l.sw 24(%1),%9\n\t "
  	  "l.cust5 %10,%2,%2, 7,8\n\t l.sw 28(%1),%10\n\t "
  	  "l.cust5 %11,%2,%2, 8,8\n\t l.sw 32(%1),%11\n\t "
  	  "l.cust5 %12,%2,%2, 9,8\n\t l.sw 36(%1),%12\n\t "
  	  "l.cust5 %13,%2,%2,10,8\n\t l.sw 40(%1),%13\n\t "
  	  "l.cust5 %14,%2,%2,11,8\n\t l.sw 44(%1),%14\n\t "
  	  "l.cust5 %15,%2,%2,12,8\n\t l.sw 48(%1),%15\n\t "
  	  "l.cust5 %16,%2,%2,13,8\n\t l.sw 52(%1),%16\n\t "
  	  "l.cust5 %17,%2,%2,14,8\n\t l.sw 56(%1),%17\n\t "
  	  "l.cust5 %18,%2,%2,15,8\n\t l.sw 60(%1),%18\n\t "

  	  :"=r"(hash32)
  	  :"r"(target_addr),"r"(dummy),"r"(tmp1),"r"(tmp2),"r"(tmp3),"r"(tmp4),"r"(tmp5),"r"(tmp6),"r"(tmp7),"r"(tmp8),"r"(tmp9),"r"(tmp10),"r"(tmp11),"r"(tmp12),"r"(tmp13),"r"(tmp14),"r"(tmp15),"r"(tmp16)
  	  :"memory"
  	  );
  


//test

  input_addr = str1 -> top_addr;// input_addr set again
  //target_addr = target_addr -12;// target_addr set again
  //print hash
  printf("----------------------------------\n");
  printf("SHA-3:KECCAK input\n");
  printf("----------------------------------\n");
  for(i=0;i<size/4;i++){
    printf("%d:%08lx\n",i,(input_addr+4*i));//addr
    printf("%d:%s\n",i,(char*)(input_addr+4*i));//contents
  }

  //print hash
  printf("----------------------------------\n");
  printf("SHA-3:KECCAK output 512bit hash...\n");
  printf("----------------------------------\n");
  for(i=0;i<16;i++){
    printf("%d:%p\n",i,(target_addr+i));//addr
    printf("%d:%08lx\n",i,*(target_addr+i));//content
  }
  printf("----------------------------------\n");

  //file close
  fclose(fp);
  free(input);
  free(target_addr);
  destroy_str(str1);
}



