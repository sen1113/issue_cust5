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
  unsigned long input_addr;
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
  char buf[9];
  sprintf(buf,"%p",input);
  str1 -> top_addr = strtoul(buf,NULL,16);
  str1 -> size = size;

 //debug
  printf("fp_addr:%p\n",fp);
  printf("input:%p\n",input);
  printf("contents of input:%08lx\n",*input);
  printf("size:%d\n",size);
  printf("buf:%s\n",buf);
  printf("topaddr:%s\n",(char *)(str1->top_addr));//input file 1st 32bit
  //printf("contents of topaddr:%ld\n",(str1->top_addr));
  printf("target_addr:%p\n",target_addr);
  int c;
  rewind(fp);
  while (( c = fgetc(fp))!=EOF){
    printf("%c",c);
  }


  //inline assembler

  int	i      = 0;
  int	max    = (int)size/4;
  unsigned long hash512 = 0;

  //input
  input_addr   =str1->top_addr;
  for(i = 0; i <= max-1; i++){
    input_addr = input_addr + i*4;
    if (i == 0){
      __asm__(
  	"l.cust5 %0,%1,%1,0,4;"	//start
  	:"=r"(hash512)
  	:"r"(input_addr),"r"(target_addr)
  	      );
    }
    else if(i < max-1){
      __asm__(
  	"l.cust5 %0,%1,%1,0,2;"	//middle
  	:"=r"(hash512)
  	:"r"(input_addr),"r"(target_addr)
  	      );
    }
    else if(i == max-1){
      __asm__(
  	"l.cust5 %0,%1,%1,0,1;"	//end
  	:"=r"(hash512)
  	:"r"(input_addr),"r"(target_addr)
  	      );
    }
    //devide & output
    __asm__(
  	    "l.cust5 %0,%2,%2,0,8;l.addi %0,%1,4;"//store
  	    "l.cust5 %0,%2,%2,1,8;l.addi %0,%1,4;"
  	    "l.cust5 %0,%2,%2,2,8;l.addi %0,%1,4;"
  	    "l.cust5 %0,%2,%2,3,8;l.addi %0,%1,4;"
  	    "l.cust5 %0,%2,%2,4,8;l.addi %0,%1,4;"
  	    "l.cust5 %0,%2,%2,5,8;l.addi %0,%1,4;"
  	    "l.cust5 %0,%2,%2,6,8;l.addi %0,%1,4;"
  	    "l.cust5 %0,%2,%2,7,8;l.addi %0,%1,4;"
  	    "l.cust5 %0,%2,%2,8,8;l.addi %0,%1,4;"
  	    "l.cust5 %0,%2,%2,9,8;l.addi %0,%1,4;"
  	    "l.cust5 %0,%2,%2,10,8;l.addi %0,%1,4;"
  	    "l.cust5 %0,%2,%2,11,8;l.addi %0,%1,4;"
  	    "l.cust5 %0,%2,%2,12,8;l.addi %0,%1,4;"
  	    "l.cust5 %0,%2,%2,13,8;l.addi %0,%1,4;"
  	    "l.cust5 %0,%2,%2,14,8;l.addi %0,%1,4;"
  	    "l.cust5 %0,%2,%2,15,8;l.addi %0,%1,4;"
  	    :"=r"(output_addr)
  	    :"r"(target_addr),"r"(id)
  	    :
  	    );
  }
  int i;
  //print hash
  printf("SHA-3:KECCAK input\n");
  printf("----------------------------------\n");
  for(i=0;i<size/4;i++){
    printf("%d:%ld\n",i,*(input_addr+4*i));
  }
  printf("----------------------------------\n");

  //print hash
  printf("SHA-3:KECCAK output 512bit hash...\n");
  printf("----------------------------------\n");
  for(i=0;i<16;i++){
    printf("%d:%ld\n",i,*(target_addr+4*i));
  }
  printf("----------------------------------\n");

  //file close
  fclose(fp);
  free(input);
  free(target_addr);
  // destroy_str(str1);
}



