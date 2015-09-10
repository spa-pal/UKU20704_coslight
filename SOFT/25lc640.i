#line 1 "25lc640.c"
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

#line 2 "25lc640.c"
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

 





#line 3 "25lc640.c"
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





#line 4 "25lc640.c"






char spi1(char in)
{
(*((volatile unsigned short*) 0xE0030008))=in;
while(!((*((volatile unsigned char *) 0xE0030004))&(1<<7)));
return (*((volatile unsigned short*) 0xE0030008));
}





void spi1_config(void)
{ 

(*((volatile unsigned long *) 0xE002C004)) = ( ((*((volatile unsigned long *) 0xE002C004)) & ~((0xffffffff>>(32-2))<<1*2)) | (2 << 1*2) );
(*((volatile unsigned long *) 0xE002C004)) = ( ((*((volatile unsigned long *) 0xE002C004)) & ~((0xffffffff>>(32-2))<<2*2)) | (2 << 2*2) );
(*((volatile unsigned long *) 0xE002C004)) = ( ((*((volatile unsigned long *) 0xE002C004)) & ~((0xffffffff>>(32-2))<<3*2)) | (2 << 3*2) );
(*((volatile unsigned long *) 0xE002C004)) = ( ((*((volatile unsigned long *) 0xE002C004)) & ~((0xffffffff>>(32-2))<<4*2)) | (2 << 4*2) );

(*((volatile unsigned char *) 0xE003000C))=12;
(*((volatile unsigned short*) 0xE0030000))=0x20;
}



void spi1_unconfig(void)
{ 

(*((volatile unsigned long *) 0xE002C004))=((*((volatile unsigned long *) 0xE002C004))&0xfffffc03)|0x00000000;

(*((volatile unsigned short*) 0xE0030000))=0x00;
}



void lc640_wren(void)
{

spi1_config();

(*((volatile unsigned long *) 0xE0028008))|=(1UL<<21);(*((volatile unsigned long *) 0xE002800C))|=(1UL<<21);

spi1(0x06); 

(*((volatile unsigned long *) 0xE0028008))|=(1UL<<21);(*((volatile unsigned long *) 0xE0028004))|=(1UL<<21);

spi1_unconfig();
}



char lc640_rdsr(void)
{
char temp;

spi1_config();
(*((volatile unsigned long *) 0xE0028008))|=(1UL<<21);(*((volatile unsigned long *) 0xE002800C))|=(1UL<<21);
spi1(0x05);
temp=spi1(0xff);
(*((volatile unsigned long *) 0xE0028008))|=(1UL<<21);(*((volatile unsigned long *) 0xE0028004))|=(1UL<<21);
spi1_unconfig();
return temp;
}



int lc640_read(int ADR)
{
int temp;
temp=0;

while(lc640_rdsr()&0x01)
	{
	}
spi1_config();
(*((volatile unsigned long *) 0xE0028008))|=(1UL<<21);(*((volatile unsigned long *) 0xE002800C))|=(1UL<<21);
(*((volatile unsigned long *) 0xE0028008))|=(1UL<<21);(*((volatile unsigned long *) 0xE002800C))|=(1UL<<21);




spi1(0x03);
temp=*(((char*)&ADR)+1);
spi1(temp);
temp=*((char*)&ADR);
spi1(temp);
temp=spi1(0xff);

(*((volatile unsigned long *) 0xE0028008))|=(1UL<<21);(*((volatile unsigned long *) 0xE0028004))|=(1UL<<21);
(*((volatile unsigned long *) 0xE0028008))|=(1UL<<21);(*((volatile unsigned long *) 0xE0028004))|=(1UL<<21);
spi1_unconfig();
return temp;

}



int lc640_read_int(int ADR)
{
char temp;
int temp_i;


while(lc640_rdsr()&0x01)
	{
	}




spi1_config();
(*((volatile unsigned long *) 0xE0028008))|=(1UL<<21);(*((volatile unsigned long *) 0xE002800C))|=(1UL<<21);
spi1(0x03);
temp=*(((char*)&ADR)+1);
spi1(temp);
temp=*((char*)&ADR);
spi1(temp);
temp=spi1(0xff);
temp_i=spi1(0xff);
temp_i<<=8;
temp_i+=temp;
(*((volatile unsigned long *) 0xE0028008))|=(1UL<<21);(*((volatile unsigned long *) 0xE0028004))|=(1UL<<21);
(*((volatile unsigned long *) 0xE0028008))|=(1UL<<21);(*((volatile unsigned long *) 0xE0028004))|=(1UL<<21);
spi1_unconfig();
return temp_i;
}



long lc640_read_long(int ADR)
{
char temp0,temp1,temp2;
long temp_i;
while(lc640_rdsr()&0x01)
	{
	}
spi1_config();
(*((volatile unsigned long *) 0xE0028008))|=(1UL<<21);(*((volatile unsigned long *) 0xE002800C))|=(1UL<<21);
spi1(0x03);
temp0=*(((char*)&ADR)+1);
spi1(temp0);
temp0=*((char*)&ADR);
spi1(temp0);
temp0=spi1(0xff);
temp1=spi1(0xff);
temp2=spi1(0xff);
temp_i=spi1(0xff);
temp_i<<=8;
temp_i+=temp2;
temp_i<<=8;
temp_i+=temp1;
temp_i<<=8;
temp_i+=temp0;
(*((volatile unsigned long *) 0xE0028008))|=(1UL<<21);(*((volatile unsigned long *) 0xE0028004))|=(1UL<<21);
(*((volatile unsigned long *) 0xE0028008))|=(1UL<<21);(*((volatile unsigned long *) 0xE0028004))|=(1UL<<21);
spi1_unconfig();
return temp_i;
}



void lc640_read_long_ptr(int ADR,char* out_ptr)
{
char temp0 ;

while(lc640_rdsr()&0x01)
	{
	}
spi1_config();
(*((volatile unsigned long *) 0xE0028008))|=(1UL<<21);(*((volatile unsigned long *) 0xE002800C))|=(1UL<<21);
spi1(0x03);
temp0=*(((char*)&ADR)+1);
spi1(temp0);
temp0=*((char*)&ADR);
spi1(temp0);
out_ptr[0]=spi1(0xff);
out_ptr[1]=spi1(0xff);
out_ptr[2]=spi1(0xff);
out_ptr[3]=spi1(0xff);
(*((volatile unsigned long *) 0xE0028008))|=(1UL<<21);(*((volatile unsigned long *) 0xE0028004))|=(1UL<<21);
(*((volatile unsigned long *) 0xE0028008))|=(1UL<<21);(*((volatile unsigned long *) 0xE0028004))|=(1UL<<21);
spi1_unconfig();
}



void lc640_read_str(int ADR, char* ram_ptr, char num)
{
char temp0,i;
while(lc640_rdsr()&0x01)
	{
	}
spi1_config();
(*((volatile unsigned long *) 0xE0028008))|=(1UL<<21);(*((volatile unsigned long *) 0xE002800C))|=(1UL<<21);
spi1(0x03);
temp0=*(((char*)&ADR)+1);
spi1(temp0);
temp0=*((char*)&ADR);
spi1(temp0);

for(i=0;i<num;i++)
	{
	*ram_ptr++=spi1(0xff);
	}
(*((volatile unsigned long *) 0xE0028008))|=(1UL<<21);(*((volatile unsigned long *) 0xE0028004))|=(1UL<<21);
(*((volatile unsigned long *) 0xE0028008))|=(1UL<<21);(*((volatile unsigned long *) 0xE0028004))|=(1UL<<21);
spi1_unconfig();
}



char lc640_write(int ADR,char in)
{
char temp; 

while(lc640_rdsr()&0x01)
	{
	}
lc640_wren();
spi1_config();	
(*((volatile unsigned long *) 0xE0028008))|=(1UL<<21);(*((volatile unsigned long *) 0xE002800C))|=(1UL<<21);
spi1(0x02);
temp=*(((char*)&ADR)+1);
spi1(temp);
temp=*((char*)&ADR);
spi1(temp);
temp=spi1(in);
(*((volatile unsigned long *) 0xE0028008))|=(1UL<<21);(*((volatile unsigned long *) 0xE0028004))|=(1UL<<21);
(*((volatile unsigned long *) 0xE0028008))|=(1UL<<21);(*((volatile unsigned long *) 0xE0028004))|=(1UL<<21);
spi1_unconfig(); 
return temp;
}



char lc640_write_int(short ADR,short in)
{
char temp; 
while(lc640_rdsr()&0x01)
	{
	}
lc640_wren();
spi1_config();	
(*((volatile unsigned long *) 0xE0028008))|=(1UL<<21);(*((volatile unsigned long *) 0xE002800C))|=(1UL<<21);
spi1(0x02);
temp=*(((char*)&ADR)+1);
spi1(temp);
temp=*((char*)&ADR);
spi1(temp);
temp=*((char*)&in);
spi1(temp);
temp=*(((char*)&in)+1);
spi1(temp);
(*((volatile unsigned long *) 0xE0028008))|=(1UL<<21);(*((volatile unsigned long *) 0xE0028004))|=(1UL<<21);
(*((volatile unsigned long *) 0xE0028008))|=(1UL<<21);(*((volatile unsigned long *) 0xE0028004))|=(1UL<<21);
spi1_unconfig();
return temp;
}  



char lc640_write_long(int ADR,long in)
{
char temp; 

while(lc640_rdsr()&0x01)
	{
	}
lc640_wren();	
spi1_config();
(*((volatile unsigned long *) 0xE0028008))|=(1UL<<21);(*((volatile unsigned long *) 0xE002800C))|=(1UL<<21);
spi1(0x02);
temp=*(((char*)&ADR)+1);
spi1(temp);
temp=*((char*)&ADR);
spi1(temp);
temp=*((char*)&in);
spi1(temp);
temp=*(((char*)&in)+1);
spi1(temp);
temp=*(((char*)&in)+2);
spi1(temp);
temp=*(((char*)&in)+3);
spi1(temp);           
(*((volatile unsigned long *) 0xE0028008))|=(1UL<<21);(*((volatile unsigned long *) 0xE0028004))|=(1UL<<21);
(*((volatile unsigned long *) 0xE0028008))|=(1UL<<21);(*((volatile unsigned long *) 0xE0028004))|=(1UL<<21);  
spi1_unconfig();
return temp;
}




char lc640_write_long_ptr(int ADR,char* in)
{
char temp; 

while(lc640_rdsr()&0x01)
	{
	}
lc640_wren();	
spi1_config();
(*((volatile unsigned long *) 0xE0028008))|=(1UL<<21);(*((volatile unsigned long *) 0xE002800C))|=(1UL<<21);
spi1(0x02);
temp=*(((char*)&ADR)+1);
spi1(temp);
temp=*((char*)&ADR);
spi1(temp);
temp=in[0];
spi1(temp);
temp=in[1];
spi1(temp);
temp=in[2];
spi1(temp);
temp=in[3];
spi1(temp);

(*((volatile unsigned long *) 0xE0028008))|=(1UL<<21);(*((volatile unsigned long *) 0xE0028004))|=(1UL<<21);
(*((volatile unsigned long *) 0xE0028008))|=(1UL<<21);(*((volatile unsigned long *) 0xE0028004))|=(1UL<<21);  
spi1_unconfig();
return temp;
}			 
