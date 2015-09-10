#line 1 "uart0.c"
#line 1 "C:\\Keil\\ARM\\INC\\Philips\\LPC21xx.H"
 
 
 
 
 
 
 
 
 
 




 
#line 59 "C:\\Keil\\ARM\\INC\\Philips\\LPC21xx.H"

 




 
#line 82 "C:\\Keil\\ARM\\INC\\Philips\\LPC21xx.H"

 




 





 


 



 





 
#line 124 "C:\\Keil\\ARM\\INC\\Philips\\LPC21xx.H"

 
#line 142 "C:\\Keil\\ARM\\INC\\Philips\\LPC21xx.H"

 
#line 159 "C:\\Keil\\ARM\\INC\\Philips\\LPC21xx.H"

 
#line 171 "C:\\Keil\\ARM\\INC\\Philips\\LPC21xx.H"

 
#line 185 "C:\\Keil\\ARM\\INC\\Philips\\LPC21xx.H"

 
#line 194 "C:\\Keil\\ARM\\INC\\Philips\\LPC21xx.H"

 






 






 
#line 236 "C:\\Keil\\ARM\\INC\\Philips\\LPC21xx.H"

 



 


 
#line 253 "C:\\Keil\\ARM\\INC\\Philips\\LPC21xx.H"

 




 
#line 284 "C:\\Keil\\ARM\\INC\\Philips\\LPC21xx.H"

 
#line 310 "C:\\Keil\\ARM\\INC\\Philips\\LPC21xx.H"

 
#line 336 "C:\\Keil\\ARM\\INC\\Philips\\LPC21xx.H"

 
#line 362 "C:\\Keil\\ARM\\INC\\Philips\\LPC21xx.H"

 





#line 2 "uart0.c"
#line 1 "uart0.h"





char crc_87(char* ptr,char num);
char crc_95(char* ptr,char num);
void putchar0(char c);
void uart_out0 (char num,char data0,char data1,char data2,char data3,char data4,char data5);
void uart_out_adr0 (char *ptr, char len);
void uart0_init(void);
char getchar0(void);
__irq void uart0_interrupt(void);
void uart_in_an0(void);
char index_offset0 (signed char index,signed char offset);
char control_check0(char index);
void uart_in0(void);



#line 3 "uart0.c"
#line 1 "cmd.h"


#line 4 "uart0.c"
#line 1 "mess.h"










		





void mess_hndl(void);
void mess_send(char _mess, short par0, short par1, char _time);
char mess_find(char _mess);
char mess_find_unvol(char _mess);

#line 5 "uart0.c"
#line 1 "global_define.h"














typedef struct
     {
     enum {dSRC=3,dINV=5}_device;
	char _av;
	
	
	
	
     enum {bsAPV,bsWRK,bsRDY,bsBL,bsAV,bsOFF_AV_NET}_state;
     char _cnt;
     char _cnt_old;
     char _cnt_more2;
     char _buff[16]; 
     
     
     
     
     signed _Uii; 
     signed _Uin;
     signed _Ii;
     signed _Ti; 
     char _flags_tu;
     
     
     
     
     
     signed _vol_u;
     signed _vol_i;
     char _is_on_cnt;
     int _ist_blok_host_cnt_; 
     int _ist_blok_host_cnt;
     short _blok_cnt; 
     char _flags_tm;     
     
     signed short _temp_av_cnt;
     signed short _umax_av_cnt;
     signed short _umin_av_cnt;
     signed _rotor;
     signed  short _x_; 
     
     char _adr_ee;
	char _last_avar;
     } BPS_STAT; 



typedef struct
     {
	char 		_cnt_to_block;
	signed short	_Ub;
	signed short	_Ib;
	signed short	_Tb;
	char 		_nd;
	char 		_cnt_wrk;
	char 		_wrk;
	unsigned short _zar;
	char 		_full_ver;
	signed long 	_zar_cnt;
	unsigned short _Iintegr,_Iintegr_; 
	signed short 	_u_old[8];
	signed short	_u_old_cnt;
	unsigned long 	_wrk_date[2];
	char 		_rel_stat;
	char			_av;
	char			_time_cnt;
	char 		_temper_stat;
	
	
	signed short 	_sign_temper_cnt;
	signed short 	_max_temper_cnt;
     } BAT_STAT; 

















#line 138 "global_define.h"







		










#line 181 "global_define.h"


















#line 212 "global_define.h"

#line 226 "global_define.h"





  
#line 238 "global_define.h"





#line 6 "uart0.c"
#line 1 "25lc640.h"




char spi1(char in);
void spi1_config(void);
void spi1_unconfig(void);
void lc640_wren(void);
char lc640_rdsr(void);
int lc640_read(int ADR);
int lc640_read_int(int ADR);
long lc640_read_long(int ADR);
void lc640_read_long_ptr(int ADR,char* out_ptr);
void lc640_read_str(int ADR, char* ram_ptr, char num);
char lc640_write(int ADR,char in);
char lc640_write_int(short ADR,short in);
char lc640_write_long(int ADR,long in);
char lc640_write_long_ptr(int ADR,char* in);

#line 7 "uart0.c"


char bRXIN0;
char UIB0[10]={0,0,0,0,0,0,0,0,0,0};
char flag0;
char rx_buffer0[64];
char tx_buffer0[64];
unsigned char rx_wr_index0,rx_rd_index0,rx_counter0;
unsigned char tx_wr_index0,tx_rd_index0,tx_counter0;

char rx_buffer_overflow0;


char plazma_uart0;
char memo_out[50];
char data_rs[50];
char data_rs0[50];

extern const char Table87[];
extern const char Table95[]; 


char crc_87(char* ptr,char num)
{
char r,j;
r=*ptr;

for(j=1;j<num;j++)
	{
     ptr++;
	r=((*ptr)^Table87[r]);
	}

return r;	
} 


char crc_95(char* ptr,char num)
{
char r,j;
r=*ptr;

for(j=1;j<num;j++)
	{
     ptr++;
	r=((*ptr)^Table95[r]);
	}

return r;	
}



void putchar0(char c)
{
while (tx_counter0 == 64);
if (tx_counter0 || (((*((volatile unsigned char *) 0xE000C014)) & 0x60)==0))
   {
   tx_buffer0[tx_wr_index0]=c;
   if (++tx_wr_index0 == 64) tx_wr_index0=0;
   ++tx_counter0;
   }
else (*((volatile unsigned char *) 0xE000C000))=c;
}


void uart_out0 (char num,char data0,char data1,char data2,char data3,char data4,char data5)
{
char i,t=0;

char UOB0[16]; 
UOB0[0]=data0;
UOB0[1]=data1;
UOB0[2]=data2;
UOB0[3]=data3;
UOB0[4]=data4;
UOB0[5]=data5;

for (i=0;i<num;i++)
	{
	t^=UOB0[i];
	}    
UOB0[num]=num;
t^=UOB0[num];
UOB0[num+1]=t;
UOB0[num+2]=0x0A;

for (i=0;i<num+3;i++)
	{
	putchar0(UOB0[i]);
	}   	
}


void uart_out_adr0 (char *ptr, char len)
{
char UOB[50] ;
char i,t=0;

for(i=0;i<len;i++)
	{
	UOB[i]=ptr[i];
	t^=UOB[i];
	}

UOB[len]=len;
t^=len;	
UOB[len+1]=t;	
UOB[len+2]=0x0A;



	

for (i=0;i<len+3;i++)
	{
	putchar0(UOB[i]);
	}   
}


void uart0_init(void)
{

 

(*((volatile unsigned long *) 0xE002C000)) = ( ((*((volatile unsigned long *) 0xE002C000)) & ~((0xffffffff>>(32-2))<<0*2)) | (1 << 0*2) );
(*((volatile unsigned long *) 0xE002C000)) = ( ((*((volatile unsigned long *) 0xE002C000)) & ~((0xffffffff>>(32-2))<<1*2)) | (1 << 1*2) );



(*((volatile unsigned char *) 0xE000C00C)) = ( ((*((volatile unsigned char *) 0xE000C00C)) & ~((0xffffffff>>(32-1))<<7)) | (1 << 7) );
(*((volatile unsigned char *) 0xE000C000))=60000000UL/(9600UL*16);
(*((volatile unsigned char *) 0xE000C004))=60000000UL/(9600UL*16*256);
(*((volatile unsigned char *) 0xE000C00C)) = ( ((*((volatile unsigned char *) 0xE000C00C)) & ~((0xffffffff>>(32-1))<<7)) | (0 << 7) );
(*((volatile unsigned char *) 0xE000C00C))=0x03;
(*((volatile unsigned char *) 0xE000C008))=0;

(*((volatile unsigned long *) 0xFFFFF020)) = 0;
(*((volatile unsigned long *) 0xFFFFF014)) |= (1 << 6); 
(*((volatile unsigned long *) 0xFFFFF00C)) &= ~(1 << 6);
(*((volatile unsigned long *) 0xFFFFF124))=(unsigned)uart0_interrupt;
(*((volatile unsigned long *) 0xFFFFF224)) = 0x20 | 6;
(*((volatile unsigned long *) 0xFFFFF010)) |= (1  << 6);

(*((volatile unsigned char *) 0xE000C004))=0x03;

}



char getchar0(void)
{
char data;
while (rx_counter0==0);
data=rx_buffer0[rx_rd_index0];
if (++rx_rd_index0 == 64) rx_rd_index0=0;
--rx_counter0;
return data;
}


__irq void uart0_interrupt(void)
{
char status,u0iir,data;

status=(*((volatile unsigned char *) 0xE000C014));
u0iir=(*((volatile unsigned char *) 0xE000C008));

if((u0iir&0x0f)==4)
	{
	plazma_uart0++;
	data=(*((volatile unsigned char *) 0xE000C000));
	rx_buffer0[rx_wr_index0]=data;
   	bRXIN0=1;
   	if (++rx_wr_index0 == 64) rx_wr_index0=0;
   	if (++rx_counter0 == 64)
      	{
      	rx_counter0=0;
      	rx_buffer_overflow0=1;
      	}
   	}
else if((u0iir&0x0f)==2)
	{
	if (tx_counter0)
   		{
   		--tx_counter0;
   		(*((volatile unsigned char *) 0xE000C000))=tx_buffer0[tx_rd_index0];
   		if (++tx_rd_index0 == 64) tx_rd_index0=0;
   		}
	} 
	
(*((volatile unsigned long *) 0xFFFFF030)) = 0;	  	
}






void uart_in_an0(void)
{







if((UIB0[0]=='r')&&(UIB0[1]=='e')&&(UIB0[2]=='a')&&(UIB0[3]=='d')&&(UIB0[6]==crc_87(UIB0,6))&&(UIB0[7]==crc_95(UIB0,6)))
	{
	unsigned short ptr;
	unsigned long data1,data2;
	char temp_out[20];
	ptr=UIB0[4]+(UIB0[5]*256U);
	data1=lc640_read_long(ptr);
	data2=lc640_read_long(ptr+4);
	temp_out[0]='r';
	temp_out[1]='e';
	temp_out[2]='a';
	temp_out[3]='d';
	temp_out[4]=*((char*)&ptr);
	temp_out[5]=*(((char*)&ptr)+1);	
	temp_out[6]=*((char*)&data1);
	temp_out[7]=*(((char*)&data1)+1);		
	temp_out[8]=*(((char*)&data1)+2);	
	temp_out[9]=*(((char*)&data1)+3);		
	temp_out[10]=*((char*)&data2);
	temp_out[11]=*(((char*)&data2)+1);		
	temp_out[12]=*(((char*)&data2)+2);	
	temp_out[13]=*(((char*)&data2)+3);	
	temp_out[14]=crc_87(temp_out,14);	
	temp_out[15]=crc_95(temp_out,14);			
	uart_out_adr0(temp_out,16);
	}


if((UIB0[0]=='w')&&(UIB0[1]=='r')&&(UIB0[2]=='i')&&(UIB0[3]=='t')&&(UIB0[4]=='e')&&(UIB0[15]==crc_87(UIB0,15))&&(UIB0[16]==crc_95(UIB0,15)))
	{
	unsigned short ptr;
	unsigned long data1,data2;
	char temp_out[14];
	ptr=UIB0[5]+(UIB0[6]*256U);
	*((char*)&data1)=UIB0[7];
	*(((char*)&data1)+1)=UIB0[8];
	*(((char*)&data1)+2)=UIB0[9];
	*(((char*)&data1)+3)=UIB0[10];
	*((char*)&data2)=UIB0[11];
	*(((char*)&data2)+1)=UIB0[12];
	*(((char*)&data2)+2)=UIB0[13];
	*(((char*)&data2)+3)=UIB0[14];	
	lc640_write_long(ptr,data1);
	lc640_write_long(ptr+4,data2);
	
	
	
	temp_out[0]='w';
	temp_out[1]='r';
	temp_out[2]='i';
	temp_out[3]='t';
	temp_out[4]='e';
	temp_out[5]=*((char*)&ptr);
	temp_out[6]=*(((char*)&ptr)+1);	
	temp_out[7]=crc_87(temp_out,7);	
	temp_out[8]=crc_95(temp_out,7);			
	uart_out_adr0(temp_out,9);
	}

}





















 


char index_offset0 (signed char index,signed char offset)
{
index=index+offset;
if(index>=64) index-=64; 
if(index<0) index+=64;
return index;
}


char control_check0(char index)
{
char i=0,ii=0,iii;

if(rx_buffer0[index]!=0x0A) goto error_cc;

ii=rx_buffer0[index_offset0(index,-2)];
iii=0;
for(i=0;i<=ii;i++)
	{
	iii^=rx_buffer0[index_offset0(index,-2-ii+i)];
	}
if (iii!=rx_buffer0[index_offset0(index,-1)]) goto error_cc;	



return 1;

error_cc:
return 0;



}


void uart_in0(void)
{
char temp,i ;



__disable_irq();

if(rx_buffer_overflow0)
	{
	rx_wr_index0=0;
	rx_rd_index0=0;
	rx_counter0=0;
	rx_buffer_overflow0=0;
	}    
	
if(rx_counter0&&(rx_buffer0[index_offset0(rx_wr_index0,-1)])==0x0A)
	{
	
     temp=rx_buffer0[index_offset0(rx_wr_index0,-3)];
    	if(temp<20) 
    		{
    		if(control_check0(index_offset0(rx_wr_index0,-1)))
    			{
    		
    			rx_rd_index0=index_offset0(rx_wr_index0,-3-temp);
    			for(i=0;i<temp;i++)
				{
				UIB0[i]=rx_buffer0[index_offset0(rx_rd_index0,i)];
				} 
			rx_rd_index0=rx_wr_index0;
			rx_counter0=0;
			
  uart_in_an0();
    			}
 	
    		} 
    	}	


__enable_irq();     
}




   	

