#line 1 "ad7705.c"
#line 1 "ad7705.h"


void spi1_ad7705_config(void);
void ad7705_reset(void);
void ad7705_write(char in);
void ad7705_read(char num);
void ad7705_drv(void);



#line 2 "ad7705.c"
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

#line 3 "ad7705.c"
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

 





#line 4 "ad7705.c"
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





#line 5 "ad7705.c"


unsigned short ad7705_res1,ad7705_res2;
unsigned short ad7705_buff[2][16],ad7705_buff_[2];
unsigned short ad7705_res;
char b7705ch,ad7705_wrk_cnt;
unsigned short cnt_ad7705_vis,cnt_ad7705_vis_wrk;




void spi1_ad7705_config(void)
{
(*((volatile unsigned long *) 0xE002C004)) = ( ((*((volatile unsigned long *) 0xE002C004)) & ~((0xffffffff>>(32-2))<<1*2)) | (2 << 1*2) );
(*((volatile unsigned long *) 0xE002C004)) = ( ((*((volatile unsigned long *) 0xE002C004)) & ~((0xffffffff>>(32-2))<<2*2)) | (2 << 2*2) );
(*((volatile unsigned long *) 0xE002C004)) = ( ((*((volatile unsigned long *) 0xE002C004)) & ~((0xffffffff>>(32-2))<<3*2)) | (2 << 3*2) );
(*((volatile unsigned long *) 0xE002C004)) = ( ((*((volatile unsigned long *) 0xE002C004)) & ~((0xffffffff>>(32-2))<<4*2)) | (2 << 4*2) ); 

(*((volatile unsigned char *) 0xE003000C))=100;
(*((volatile unsigned short*) 0xE0030000))=0x3f;
}

void ad7705_reset(void)
{

(*((volatile unsigned long *) 0xE0028018))|=(1UL<<23);
(*((volatile unsigned long *) 0xE002801C))|=(1UL<<23);
{long xx; xx=(unsigned long)10 * 12000UL; while(xx)xx--;};
(*((volatile unsigned long *) 0xE0028014))|=(1UL<<23);
}


void ad7705_write(char in)
{
char i;
(*((volatile unsigned long *) 0xE0028008))|=(1UL<<11);
(*((volatile unsigned long *) 0xE0028004))|=(1UL<<11);
spi1_ad7705_config();
for(i=0;i<5;i++)(*((volatile unsigned long *) 0xE002800C))|=(1UL<<11);
spi1(in);
for(i=0;i<5;i++)(*((volatile unsigned long *) 0xE002800C))|=(1UL<<11);
for(i=0;i<5;i++)(*((volatile unsigned long *) 0xE0028004))|=(1UL<<11);
spi1_unconfig();                   
}



void ad7705_read(char num)
{

char i;
 
(*((volatile unsigned long *) 0xE0028008))|=(1UL<<11);

(*((volatile unsigned long *) 0xE0028004))|=(1UL<<11);
spi1_ad7705_config();

for(i=0;i<5;i++)(*((volatile unsigned long *) 0xE002800C))|=(1UL<<11);

ad7705_res=0;
if(num==1) 
	{
	ad7705_res=spi1(0);
	}
else if(num==2)
	{
	*(((char*)(&ad7705_res))+1)=spi1(0); 
	*(((char*)(&ad7705_res)))=spi1(0);
	}	   

for(i=0;i<5;i++)(*((volatile unsigned long *) 0xE002800C))|=(1UL<<11);

for(i=0;i<5;i++)(*((volatile unsigned long *) 0xE0028004))|=(1UL<<11);

spi1_unconfig();                                            
}


void ad7705_drv(void)
{
__disable_irq();

(*((volatile unsigned long *) 0xE0028008))|=(1UL<<11);
(*((volatile unsigned long *) 0xE0028008))&=~(1UL<<10);

if(!((*((volatile unsigned long *) 0xE0028000))&(1UL<<10)))
	{
	ad7705_write(0x38);
	ad7705_read(2);
	
	if(!b7705ch)
		{
		ad7705_buff[0][ad7705_wrk_cnt]=ad7705_res;
		ad7705_res1=ad7705_res;
		}
	else if(b7705ch) 
		{
		ad7705_buff[1][ad7705_wrk_cnt]=ad7705_res;
		ad7705_res2=ad7705_res;
		}

	if(b7705ch)
		{
		b7705ch=0;
		ad7705_wrk_cnt++;
		if(ad7705_wrk_cnt>=16)ad7705_wrk_cnt=0;
		
		if((ad7705_wrk_cnt&0x01)==0)
			{
			unsigned temp_U;
			char i,ii;

			for(i=0;i<2;i++)
				{
				temp_U=0;
				for(ii=0;ii<16;ii++)
					{
					temp_U+=(unsigned long)ad7705_buff[i][ii];
					}
				ad7705_buff_[i]=(unsigned short)(temp_U>>4);
				}	
			}
		}	
		
		
		
	else b7705ch=1;
	
	if(!b7705ch) ad7705_write(0x20);
	else if(b7705ch) ad7705_write(0x21);

	ad7705_write((((0x1101) | 0x1101>>3 | 0x1101>>6 | 0x1101>>9) & 0xf | ((0x1101) | 0x1101>>3 | 0x1101>>6 | 0x1101>>9)>>12 & 0xf0)); 

	if(!b7705ch) ad7705_write(0x10);
	else if(b7705ch) ad7705_write(0x11);

	ad7705_write(0x44);
	}

	__enable_irq();

if(((ad7705_res1&0x0fff)==0x0000)||((ad7705_res1&0x0fff)==0x0fff)||((ad7705_res2&0x0fff)==0x0000)||((ad7705_res2&0x0fff)==0x0fff))
{
if(cnt_ad7705_vis<50)
	{
	cnt_ad7705_vis++;
	if(cnt_ad7705_vis>=50) cnt_ad7705_vis_wrk=50;
		
	}
}
else cnt_ad7705_vis=0;

if(cnt_ad7705_vis_wrk)
	{
	cnt_ad7705_vis_wrk--;

	if(cnt_ad7705_vis_wrk==30)
		{
		ad7705_reset();
		ad7705_write(0x20);
		ad7705_write((((0x1101) | 0x1101>>3 | 0x1101>>6 | 0x1101>>9) & 0xf | ((0x1101) | 0x1101>>3 | 0x1101>>6 | 0x1101>>9)>>12 & 0xf0)); 
		ad7705_write(0x10);
		ad7705_write(0x44); 
	     }
	else if(cnt_ad7705_vis_wrk==20)
		{              
		ad7705_reset();
		ad7705_write(0x20);
		ad7705_write((((0x1101) | 0x1101>>3 | 0x1101>>6 | 0x1101>>9) & 0xf | ((0x1101) | 0x1101>>3 | 0x1101>>6 | 0x1101>>9)>>12 & 0xf0)); 
		ad7705_write(0x10);
		ad7705_write(0x44); 
	     }	
	else if(cnt_ad7705_vis_wrk==10)
		{              
		ad7705_reset();
		ad7705_write(0x20);
		ad7705_write((((0x1101) | 0x1101>>3 | 0x1101>>6 | 0x1101>>9) & 0xf | ((0x1101) | 0x1101>>3 | 0x1101>>6 | 0x1101>>9)>>12 & 0xf0)); 
		ad7705_write(0x10);
		ad7705_write(0x44); 
	     }
	else if(cnt_ad7705_vis_wrk==2)
		{

	     }		        		          
	}         
else 
	{

	}	
	
}

 

