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
  unsigned long hash32 = 0;
  unsigned long tmp = 0;
  unsigned long dummy1 = 0;
  unsigned long dummy2 = 0;


  unsigned long tmp1  = 0;
  unsigned long tmp2  = 0;
  unsigned long tmp3  = 0;
  unsigned long tmp4  = 0;
  unsigned long tmp5  = 0;
  unsigned long tmp6  = 0;
  unsigned long tmp7  = 0;
  unsigned long tmp8  = 0;
  unsigned long tmp9  = 0;
  unsigned long tmp10 = 0;
  unsigned long tmp11 = 0;
  unsigned long tmp12 = 0;
  unsigned long tmp13 = 0;
  unsigned long tmp14 = 0;
  unsigned long tmp15 = 0;
  unsigned long tmp16 = 0;

  unsigned long reg1  = 0;
  unsigned long reg2  = 0;
  unsigned long reg3  = 0;
  unsigned long reg4  = 0;

  //Input
  input_addr = str1 -> top_addr;
  __asm__(
	  "l.lwz %0,0(%20)\n\t"
	  "l.lwz %1,4(%20)\n\t"
	  "l.lwz %2,8(%20)\n\t"
	  "l.lwz %3,12(%20)\n\t"
	  "l.cust5 %22,%22,%22,0,0\n\t"	  
	  "l.cust5 %22,%0,%23,0,4\n\t"
	  "l.cust5 %22,%1,%23,0,2\n\t"
	  "l.cust5 %22,%2,%23,0,2\n\t"
	  "l.cust5 %22,%3,%23,0,1\n\t"
  	  "l.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\t"
  	  "l.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\t"
  	  "l.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\t"
  	  "l.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\t"
  	  "l.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\t"
  	  "l.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\t"
  	  "l.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\tl.nop \n\t"
	  "l.cust5 %4,%22,%23,15,8\n\t"
  	  "l.cust5 %5,%22,%23,14,8\n\t"
  	  "l.cust5 %6,%22,%23,13,8\n\t"
  	  "l.cust5 %7,%22,%23,12,8\n\t"
  	  "l.cust5 %8,%22,%23,11,8\n\t"
  	  "l.cust5 %9,%22,%23,10,8\n\t"
  	  "l.cust5 %10,%22,%23,9,8\n\t"
  	  "l.cust5 %11,%22,%23,8,8\n\t"
  	  "l.cust5 %12,%22,%23,7,8\n\t"
  	  "l.cust5 %13,%22,%23,6,8\n\t"
  	  "l.cust5 %14,%22,%23,5,8\n\t"
  	  "l.cust5 %15,%22,%23,4,8\n\t"
  	  "l.cust5 %16,%22,%23,3,8\n\t"
  	  "l.cust5 %17,%22,%23,2,8\n\t"
  	  "l.cust5 %18,%22,%23,1,8\n\t"
  	  "l.cust5 %19,%22,%23,0,8\n\t"
	  "l.sw 0(%21),%4\n\t"
	  "l.sw 4(%21),%5\n\t"
	  "l.sw 8(%21),%6\n\t"
	  "l.sw 12(%21),%7\n\t"
	  "l.sw 16(%21),%8\n\t"
	  "l.sw 20(%21),%9\n\t"
	  "l.sw 24(%21),%10\n\t"
	  "l.sw 28(%21),%11\n\t"
	  "l.sw 32(%21),%12\n\t"
	  "l.sw 36(%21),%13\n\t"
	  "l.sw 40(%21),%14\n\t"
	  "l.sw 44(%21),%15\n\t"
	  "l.sw 48(%21),%16\n\t"
	  "l.sw 52(%21),%17\n\t"
	  "l.sw 56(%21),%18\n\t"
	  "l.sw 60(%21),%19\n\t"
	  :"=r"(reg1),"=r"(reg2),"=r"(reg3),"=r"(reg4),"=r"(tmp1),"=r"(tmp2),"=r"(tmp3),"=r"(tmp4),"=r"(tmp5),"=r"(tmp6),"=r"(tmp7),"=r"(tmp8),"=r"(tmp9),"=r"(tmp10),"=r"(tmp11),"=r"(tmp12),"=r"(tmp13),"=r"(tmp14),"=r"(tmp15),"=r"(tmp16)
	  :"r"(input_addr),"r"(target_addr),"r"(dummy1),"r"(dummy2)
	  :
	  );
  printf("reg1:%08lx\n",reg1);
  printf("reg2:%08lx\n",reg2);
  printf("reg3:%08lx\n",reg3);
  printf("reg4:%08lx\n",reg4);
  printf("tmp1:%08lx\n",tmp1);
  printf("tmp2:%08lx\n",tmp2);
  printf("tmp3:%08lx\n",tmp3);
  printf("tmp4:%08lx\n",tmp4);
  printf("tmp5:%08lx\n",tmp5);
  printf("tmp6:%08lx\n",tmp6);
  printf("tmp7:%08lx\n",tmp7);
  printf("tmp8:%08lx\n",tmp8);
  printf("tmp9:%08lx\n",tmp9);
  printf("tmp10:%08lx\n",tmp10);
  printf("tmp11:%08lx\n",tmp11);
  printf("tmp12:%08lx\n",tmp12);
  printf("tmp13:%08lx\n",tmp13);
  printf("tmp14:%08lx\n",tmp14);
  printf("tmp15:%08lx\n",tmp15);
  printf("tmp16:%08lx\n",tmp16);

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
    printf("%d:\t%p  %08lx\n",i,(target_addr+i),*(target_addr+i));//addr & contents
  }
  printf("----------------------------------\n");

  //file close
  fclose(fp);
  free(input);
  free(target_addr);
  destroy_str(str1);
}



