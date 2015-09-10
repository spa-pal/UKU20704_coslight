#line 1 "avar_hndl.c"
#line 1 "avar_hndl.h"


void avar_hndl(void);
void avar_unet_hndl(char in);
void reload_hndl(void);
void avar_bps_hndl(char bps, char v, char in);
void avar_bat_hndl(char bat, char in);



#line 2 "avar_hndl.c"
#line 1 "eeprom_map.h"






#line 18 "eeprom_map.h"



#line 66 "eeprom_map.h"



#line 83 "eeprom_map.h"



#line 95 "eeprom_map.h"


#line 106 "eeprom_map.h"




#line 157 "eeprom_map.h"

#line 172 "eeprom_map.h"










































































































 







#line 3 "avar_hndl.c"
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





#line 4 "avar_hndl.c"
#line 1 "full_can.h"


  
















  









 


char CRC1_in(void);
char CRC2_in(void);
char CRC1_out(void);
char CRC2_out(void);
void can1_out_adr(char* ptr,char num);
__irq void can_isr_err (void);
void can2_out(char data0,char data1,char data2,char data3,char data4,char data5,char data6,char data7);
void can_adr_hndl(void);
void can_in_an(void);
void can_in_an2(void);
__irq void can_isr_rx (void); 
__irq void can_isr_tx (void); 
short can1_init (unsigned short can_rx_vector, unsigned short can_tx_vector, unsigned int can_btr);
short can2_init (unsigned short can_rx_vector, unsigned short can_tx_vector, unsigned int can_btr);
short FullCAN_SetFilter (
  unsigned short can_port, 
  unsigned int CANID 
  );
#line 5 "avar_hndl.c"
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

#line 6 "avar_hndl.c"
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

 





#line 7 "avar_hndl.c"


     


unsigned avar_stat;	 	
unsigned avar_ind_stat; 	
unsigned avar_stat_old;
unsigned avar_stat_new,avar_stat_offed;








char    av_inv[6],av_dt[4],av_sk[4];

extern char bOUT_FREE2;	



extern signed char sec_bcd,sec__;
extern signed char min_bcd,min__;
extern signed char hour_bcd,hour__;
extern signed char day_bcd,day__;
extern signed char month_bcd,month__;
extern signed char year_bcd,year__;


extern BAT_STAT bat[2];
extern short			bat_u_old_cnt;



















extern signed short Ktsrc[2];
extern signed short Kusrc[2];
extern signed short Kisrc[2];
extern signed short Ki0src[2];
extern signed short Kubat[2];
extern signed short Kibat0[2];
extern signed short Kibat1[2];
extern signed short Ktbat[2];
extern signed short Kunet;
extern signed short Ktout[3];
extern signed short Kuload;

extern signed short MAIN_IST;
extern signed short UMAX;
extern signed short UB0;
extern signed short UB20;
extern signed short TMAX;
extern signed short TSIGN;
extern signed short AV_OFF_AVT;
extern signed short USIGN;
extern signed short UMN;
extern signed short ZV_ON;
extern signed short IKB;
extern signed short KVZ;
extern signed short IMAX;
extern signed short KIMAX;
extern signed short APV_ON;
extern signed short IZMAX;
extern signed short U0B;
extern signed short TZAS;
extern signed short VZ_HR;
extern signed short TBAT;
extern signed short U_AVT;
extern signed short DU;
extern signed short PAR;

extern signed short NUMBAT;
extern signed short NUMIST;
extern signed short NUMINV;
extern signed short NUMDT;
extern signed short NUMSK;
extern signed short NUMEXT;

extern enum  {apvON=0x0055,apvOFF=0x00aa}apv_on1,apv_on2;
extern signed short apv_on2_time;
extern enum  {bisON=0x0055,bisOFF=0x00aa}BAT_IS_ON[2];
extern signed short BAT_DAY_OF_ON[2];
extern signed short BAT_MONTH_OF_ON[2];
extern signed short BAT_YEAR_OF_ON[2];
extern signed short BAT_C_NOM[2];
extern signed short BAT_RESURS[2];
extern signed short BAT_C_REAL[2];

extern unsigned short AUSW_MAIN;
extern unsigned long 	AUSW_MAIN_NUMBER;
extern unsigned short AUSW_DAY;
extern unsigned short AUSW_MONTH;
extern unsigned short AUSW_YEAR;
extern unsigned short AUSW_UKU;
extern unsigned short AUSW_UKU_SUB;
extern unsigned long AUSW_UKU_NUMBER;
extern unsigned long	AUSW_BPS1_NUMBER;
extern unsigned long  AUSW_BPS2_NUMBER;
extern unsigned short AUSW_RS232;
extern unsigned short AUSW_PDH;
extern unsigned short AUSW_SDH;
extern unsigned short AUSW_ETH;

extern signed short TMAX_EXT_EN[3];
extern signed short TMAX_EXT[3];
extern signed short TMIN_EXT_EN[3];
extern signed short TMIN_EXT[3];
extern signed short T_EXT_REL_EN[3];
extern signed short T_EXT_ZVUK_EN[3];
extern signed short T_EXT_LCD_EN[3];
extern signed short T_EXT_RS_EN[3];

extern signed short SK_SIGN[4];
extern signed short SK_REL_EN[4];
extern signed short SK_ZVUK_EN[4];
extern signed short SK_LCD_EN[4];
extern signed short SK_RS_EN[4];

extern enum {AVZ_1=1,AVZ_2=2,AVZ_3=3,AVZ_6=6,AVZ_12=12,AVZ_OFF=0}AVZ;
extern unsigned short HOUR_AVZ;
extern unsigned short MIN_AVZ;
extern unsigned short SEC_AVZ;
extern unsigned short DATE_AVZ;
extern unsigned short MONTH_AVZ;
extern unsigned short YEAR_AVZ;
extern unsigned short AVZ_TIME;
extern enum {mnON=0x55,mnOFF=0xAA}MNEMO_ON;
extern unsigned short MNEMO_TIME;




extern signed short net_U,net_Ustore;
extern char bFF,bFF_;
extern signed short net_F,hz_out,hz_out_cnt;
extern signed char unet_drv_cnt;
extern char net_av;



extern BPS_STAT bps[12];







void avar_hndl(void)
{

char i;


if(net_av)		avar_stat = ( (avar_stat & ~((0xffffffff>>(32-1))<<0)) | (1 << 0) );
else	   			avar_stat = ( (avar_stat & ~((0xffffffff>>(32-1))<<0)) | (0 << 0) );

for(i=0;i<2;i++)
	{
	if(bat[i]._av)	avar_stat = ( (avar_stat & ~((0xffffffff>>(32-1))<<1+i)) | (1 << 1+i) );
	else	   		avar_stat = ( (avar_stat & ~((0xffffffff>>(32-1))<<1+i)) | (0 << 1+i) );
	}

for(i=0;i<12;i++)
	{
	if(bps[i]._av)	avar_stat = ( (avar_stat & ~((0xffffffff>>(32-1))<<3+i)) | (1 << 3+i) );
	else	   		avar_stat = ( (avar_stat & ~((0xffffffff>>(32-1))<<3+i)) | (0 << 3+i) );
	}

for(i=0;i<6;i++)
	{
	if(av_inv[i])	avar_stat = ( (avar_stat & ~((0xffffffff>>(32-1))<<15+i)) | (1 << 15+i) );
	else	   		avar_stat = ( (avar_stat & ~((0xffffffff>>(32-1))<<15+i)) | (0 << 15+i) );
	}

for(i=0;i<4;i++)
	{
	if(av_dt[i])	avar_stat = ( (avar_stat & ~((0xffffffff>>(32-1))<<21+i)) | (1 << 21+i) );
	else	   		avar_stat = ( (avar_stat & ~((0xffffffff>>(32-1))<<21+i)) | (0 << 21+i) );
	}
for(i=0;i<4;i++)
	{
	if(av_sk[i])	avar_stat = ( (avar_stat & ~((0xffffffff>>(32-1))<<25+i)) | (1 << 25+i) );
	else	   		avar_stat = ( (avar_stat & ~((0xffffffff>>(32-1))<<25+i)) | (0 << 25+i) );
	}

avar_stat_new=(avar_stat^avar_stat_old)&avar_stat;

avar_ind_stat|=avar_stat_new;



avar_stat_offed=~((avar_stat^avar_stat_old)&avar_stat_old);

if(!AV_OFF_AVT)avar_stat_offed|=0xfffffffe;

avar_ind_stat&=avar_stat_offed; 

avar_stat_old=avar_stat;
}


void reload_hndl(void)
{
char data[4];
unsigned int event_ptr,lc640_adr ,event_cnt;

event_ptr=lc640_read_int(1024+1024+512+1024);
event_ptr++;	
if(event_ptr>63)event_ptr=0;	
lc640_write_int(1024+1024+512+1024,event_ptr);	
	
event_cnt=lc640_read_int(1024+1024+512+1024+2);
if(event_cnt!=63)event_cnt=event_ptr;
lc640_write_int(1024+1024+512+1024+2,event_cnt); 
	
lc640_adr=1024+(lc640_read_int(1024+1024+512+1024)*32);
	
data[0]='U';
data[1]=0;
data[2]='R';
data[3]=0;
lc640_write_long_ptr(lc640_adr,data);

data[0]=0;
data[1]=0;
data[2]=0;
data[3]=0;
lc640_write_long_ptr(lc640_adr+4,data);

data[0]=year__;
data[1]=month__;
data[2]=day__;
data[3]=0;
lc640_write_long_ptr(lc640_adr+8,data);

data[0]=hour__;
data[1]=min__;
data[2]=sec__;
data[3]=0;
lc640_write_long_ptr(lc640_adr+12,data);
	
data[0]='A';
data[1]='A';
data[2]='A';
data[3]='A';
lc640_write_long_ptr(lc640_adr+16,data);
	
data[0]='A';
data[1]='A';
data[2]='A';
data[3]='A';
lc640_write_long_ptr(lc640_adr+20,data);
	
data[0]='A';
data[1]='A';
data[2]='A';
data[3]='A';
lc640_write_long_ptr(lc640_adr+24,data);
	
data[0]='A';
data[1]='A';
data[2]='A';
data[3]='A';
lc640_write_long_ptr(lc640_adr+28,data);				
	
	
}


void avar_unet_hndl(char in)
{

char data[4];
unsigned int event_ptr,lc640_adr,event_ptr_find,event_cnt;


if(in==1)
	{
	net_av=1;

	
	


	
	 
	event_ptr=lc640_read_int(1024+1024+512+1024);
	event_ptr++;	
	if(event_ptr>63)event_ptr=0;	
	lc640_write_int(1024+1024+512+1024,event_ptr);	
	
     event_cnt=lc640_read_int(1024+1024+512+1024+2);
	if(event_cnt!=63)event_cnt=event_ptr;
	lc640_write_int(1024+1024+512+1024+2,event_cnt); 
	
	lc640_adr=1024+(lc640_read_int(1024+1024+512+1024)*32);
	
	data[0]='P';
	data[1]=0;
	data[2]='A';
	data[3]=0;
	lc640_write_long_ptr(lc640_adr,data);

	data[0]=0;
	data[1]=0;
	data[2]=0;
	data[3]=0;
	lc640_write_long_ptr(lc640_adr+4,data);

	data[0]=year__;
	data[1]=month__;
	data[2]=day__;
	data[3]=0;
	lc640_write_long_ptr(lc640_adr+8,data);

	data[0]=hour__;
	data[1]=min__;
	data[2]=sec__;
	data[3]=0;
	lc640_write_long_ptr(lc640_adr+12,data);
	
	data[0]='A';
	data[1]='A';
	data[2]='A';
	data[3]='A';
	lc640_write_long_ptr(lc640_adr+16,data);
	
	data[0]='A';
	data[1]='A';
	data[2]='A';
	data[3]='A';
	lc640_write_long_ptr(lc640_adr+20,data);
	
	data[0]='A';
	data[1]='A';
	data[2]='A';
	data[3]='A';
	lc640_write_long_ptr(lc640_adr+24,data);
	
	data[0]='A';
	data[1]='A';
	data[2]='A';
	data[3]='A';
	lc640_write_long_ptr(lc640_adr+28,data);				
	










 
	
	}

else if(in==0)
	{
	net_av=0;

  


 


	

	

     
	
	avar_stat = ( (avar_stat & ~((0xffffffff>>(32-1))<<0)) | (0 << 0) );

	
	
	if(AV_OFF_AVT) avar_ind_stat = ( (avar_ind_stat & ~((0xffffffff>>(32-1))<<0)) | (0 << 0) );

     event_ptr=lc640_read_int(1024+1024+512+1024);
	event_ptr_find=event_ptr;
avar_unet_hndl_lbl1:
	lc640_adr=1024+(event_ptr_find*32);

     lc640_read_long_ptr(lc640_adr,data);
     
     if(!((data[0]=='P')&&(data[1]==0)&&(data[2]=='A')))
     	{        
     	if(event_ptr_find)event_ptr_find--;
     	else event_ptr_find=63;
     	if(event_ptr_find==event_ptr)goto avar_unet_hndl_end;
     	else goto avar_unet_hndl_lbl1;
     	}
     else 
     	{
     	lc640_read_long_ptr(lc640_adr+16,data);
     	if(!((data[0]=='A')&&(data[1]=='A')&&(data[2]=='A')&&(data[3]=='A')))
     		{        
     		if(event_ptr_find)event_ptr_find--;
         		else event_ptr_find=63;
         		if(event_ptr_find==event_ptr)goto avar_unet_hndl_end;
     		else goto avar_unet_hndl_lbl1;
     		}

     	}	
	
	data[0]=year__;
	data[1]=month__;
	data[2]=day__;
	data[3]=0;
	lc640_write_long_ptr(lc640_adr+16,data);

	data[0]=hour__;
	data[1]=min__;
	data[2]=sec__;
	data[3]=0;
	lc640_write_long_ptr(lc640_adr+20,data); 
	
	data[0]=*((char*)(&net_Ustore));
	data[1]=*(((char*)(&net_Ustore))+1);
	data[2]='B';
	data[3]='B';
	lc640_write_long_ptr(lc640_adr+24,data);
	
	data[0]='B';
	data[1]='B';
	data[2]='B';
	data[3]='B';
	lc640_write_long_ptr(lc640_adr+28,data);	
	









 
     	
	}
avar_unet_hndl_end:
	__nop();		
}



void avar_bps_hndl(char dev, char v, char in)
{
char data[4];
unsigned short event_ptr,lc640_adr,event_ptr_find,event_cnt;
char avar_simbol;

avar_simbol='T';
if(v==0)avar_simbol='T';
else if(v==1)avar_simbol='U';
else if(v==2)avar_simbol='u';
else if(v==3)avar_simbol='L';

if(in==1)
	{
	



	
	if(v==0)bps[dev]._av|=(1<<0);
	else if(v==1) bps[dev]._av|=(1<<1);
	else if(v==2) bps[dev]._av|=(1<<2);
	else if(v==3) bps[dev]._av|=(1<<3);

	bps[dev]._last_avar=v;

	

	event_ptr=lc640_read_int(1024+1024+512+1024);
	event_ptr++;	
	if(event_ptr>63)event_ptr=0;	
	lc640_write_int(1024+1024+512+1024,event_ptr);	
	
     event_cnt=lc640_read_int(1024+1024+512+1024+2);
	if(event_cnt!=63)event_cnt=event_ptr;
	lc640_write_int(1024+1024+512+1024+2,event_cnt); 
	
	lc640_adr=1024+(lc640_read_int(1024+1024+512+1024)*32);
	
	data[0]='S';
	data[1]=dev; 
	data[2]=avar_simbol;
	data[3]=0;
	lc640_write_long_ptr(lc640_adr,data);

	data[0]=0;
	data[1]=0;
	data[2]=0;
	data[3]=0;
	lc640_write_long_ptr(lc640_adr+4,data);

	data[0]=year__;
	data[1]=month__;
	data[2]=day__;
	data[3]=0;
	lc640_write_long_ptr(lc640_adr+8,data);

	data[0]=hour__;
	data[1]=min__;
	data[2]=sec__;
	data[3]=0;
	lc640_write_long_ptr(lc640_adr+12,data);
	
	data[0]='A';
	data[1]='A';
	data[2]='A';
	data[3]='A';
	lc640_write_long_ptr(lc640_adr+16,data);
	
	data[0]='A';
	data[1]='A';
	data[2]='A';
	data[3]='A';
	lc640_write_long_ptr(lc640_adr+20,data);
	
	data[0]='A';
	data[1]='A';
	data[2]='A';
	data[3]='A';
	lc640_write_long_ptr(lc640_adr+24,data);
	
	data[0]='A';
	data[1]='A';
	data[2]='A';
	data[3]='A';
	lc640_write_long_ptr(lc640_adr+28,data);		
 	
	}

else if(in==0)
	{      


	
	

     if(v==0) bps[dev]._av&=(~(1<<0));
     else if(v==1) bps[dev]._av&=(~(1<<1));
	else if(v==2) bps[dev]._av&=(~(1<<2));
	else if(v==3) bps[dev]._av&=(~(1<<3));
     


		
		

 
	event_ptr=lc640_read_int(1024+1024+512+1024);
	event_ptr_find=event_ptr;
	
avar_src_hndl_lbl1: 

	lc640_adr=1024+(event_ptr_find*32);

     lc640_read_long_ptr(lc640_adr,data);
     
     if(!((data[0]=='S')&&(data[1]==dev)&&(data[2]==avar_simbol)))
     	{        
     	if(event_ptr_find)event_ptr_find--;
     	else event_ptr_find=63;
     	if(event_ptr_find==event_ptr)goto avar_src_hndl_end;
     	else goto avar_src_hndl_lbl1;
     	}
     else 
     	{
     	lc640_read_long_ptr(lc640_adr+16,data);
     	if(!((data[0]=='A')&&(data[1]=='A')&&(data[2]=='A')&&(data[3]=='A')))
     		{        
     		if(event_ptr_find)event_ptr_find--;
         		else event_ptr_find=63;
         		if(event_ptr_find==event_ptr)goto avar_src_hndl_end;
     		else goto avar_src_hndl_lbl1;
     		}

     	}	


	
	data[0]=year__;
	data[1]=month__;
	data[2]=day__;
	data[3]=0;
	lc640_write_long_ptr(lc640_adr+16,data);

	data[0]=hour__;
	data[1]=min__;
	data[2]=sec__;
	data[3]=0;
	lc640_write_long_ptr(lc640_adr+20,data);
	
	data[0]='B';
	data[1]='B';
	data[2]='B';
	data[3]='B';
	lc640_write_long_ptr(lc640_adr+24,data);
	
	data[0]='B';
	data[1]='B';
	data[2]='B';
	data[3]='B';
	lc640_write_long_ptr(lc640_adr+28,data);
	
	}
	
avar_src_hndl_end:
__nop();		
}


void wrk_mem_hndl(char b)
{
char data[4];
unsigned short event_ptr,lc640_adr ,event_cnt;



signed short temp_temp;

if(bat[b]._Iintegr_==0) goto wrk_mem_hndl_end;

temp_temp=bat[b]._u_old[((bat_u_old_cnt+6)&0x07)]; 


event_ptr=lc640_read_int(1024+1024+512+1024);
event_ptr++;	
if(event_ptr>63)event_ptr=0;	
lc640_write_int(1024+1024+512+1024,event_ptr);	
	
event_cnt=lc640_read_int(1024+1024+512+1024+2);
if(event_cnt!=63)event_cnt=event_ptr;
lc640_write_int(1024+1024+512+1024+2,event_cnt); 
	
lc640_adr=1024+(lc640_read_int(1024+1024+512+1024)*32);
	
data[0]='B';
data[1]=b; 
data[2]='W';
data[3]=0;

lc640_write_long_ptr(lc640_adr,data);

data[0]=*((char*)&bat[b]._Iintegr_);
data[1]=*(((char*)(&bat[b]._Iintegr_))+1);
data[2]=*((char*)&temp_temp);
data[3]=*(((char*)(&temp_temp))+1);
lc640_write_long_ptr(lc640_adr+4,data);

lc640_write_long_ptr(lc640_adr+8,(char*)&bat[b]._wrk_date[0]);
	
lc640_write_long_ptr(lc640_adr+12,(char*)&bat[b]._wrk_date[1]);

data[0]=year__;
data[1]=month__;
data[2]=day__;
data[3]=0;
lc640_write_long_ptr(lc640_adr+16,data);

data[0]=hour__;
data[1]=min__;
data[2]=sec__;
data[3]=0;
lc640_write_long_ptr(lc640_adr+20,data);
	


	
wrk_mem_hndl_end:	
__nop();
}  


void avar_bat_hndl(char b, char in)
{



char data[4];
unsigned short event_ptr,lc640_adr,event_ptr_find,event_cnt;

if(in==1)
	{











 

	bat[b]._av=1;
    
	event_ptr=lc640_read_int(1024+1024+512+1024);
	event_ptr++;	
	if(event_ptr>63)event_ptr=0;	
	lc640_write_int(1024+1024+512+1024,event_ptr);	
	
     event_cnt=lc640_read_int(1024+1024+512+1024+2);
	if(event_cnt!=63)event_cnt=event_ptr;
	lc640_write_int(1024+1024+512+1024+2,event_cnt); 
	
	lc640_adr=1024+(lc640_read_int(1024+1024+512+1024)*32);
	
	data[0]='B';
	data[1]=b;
	data[2]='C';
	data[3]=0;
	lc640_write_long_ptr(lc640_adr,data);

	data[0]=0;
	data[1]=0;
	data[2]=0;
	data[3]=0;
	lc640_write_long_ptr(lc640_adr+4,data);

	data[0]=year__;
	data[1]=month__;
	data[2]=day__;
	data[3]=0;
	lc640_write_long_ptr(lc640_adr+8,data);

	data[0]=hour__;
	data[1]=min__;
	data[2]=sec__;
	data[3]=0;
	lc640_write_long_ptr(lc640_adr+12,data);
	
	data[0]='A';
	data[1]='A';
	data[2]='A';
	data[3]='A';
	lc640_write_long_ptr(lc640_adr+16,data);
	
	data[0]='A';
	data[1]='A';
	data[2]='A';
	data[3]='A';
	lc640_write_long_ptr(lc640_adr+20,data);
	
	data[0]='A';
	data[1]='A';
	data[2]='A';
	data[3]='A';
	lc640_write_long_ptr(lc640_adr+24,data);
	
	data[0]='A';
	data[1]='A';
	data[2]='A';
	data[3]='A';
	lc640_write_long_ptr(lc640_adr+28,data);				
	
	}

else if(in==0)
	{









 
				
	bat[b]._av=0;

     event_ptr=lc640_read_int(1024+1024+512+1024);
	event_ptr_find=event_ptr;
	
avar_bat_hndl_lbl1: 

	lc640_adr=1024+(event_ptr_find*32);

     lc640_read_long_ptr(lc640_adr,data);
     
     if(!((data[0]=='B')&&(data[1]==b)&&(data[2]=='C')))
     	{        
     	if(event_ptr_find)event_ptr_find--;
     	else event_ptr_find=63;
     	if(event_ptr_find==event_ptr)goto avar_bat_hndl_end;
     	else goto avar_bat_hndl_lbl1;
     	}
     else 
     	{
     	lc640_read_long_ptr(lc640_adr+16,data);
     	if(!((data[0]=='A')&&(data[1]=='A')&&(data[2]=='A')&&(data[3]=='A')))
     		{        
     		if(event_ptr_find)event_ptr_find--;
         		else event_ptr_find=63;
         	    	if(event_ptr_find==event_ptr)goto avar_bat_hndl_end;
     		else goto avar_bat_hndl_lbl1;
     		}

     	}
     		
	data[0]=year__;
	data[1]=month__;
	data[2]=day__;
	data[3]=0;
	lc640_write_long_ptr(lc640_adr+16,data);

	data[0]=hour__;
	data[1]=min__;
	data[2]=sec__;
	data[3]=0;
	lc640_write_long_ptr(lc640_adr+20,data);
	
	data[0]='B';
	data[1]='B';
	data[2]='B';
	data[3]='B';
	lc640_write_long_ptr(lc640_adr+24,data);
	
	data[0]='B';
	data[1]='B';
	data[2]='B';
	data[3]='B';
	lc640_write_long_ptr(lc640_adr+28,data);
	

	
	}
	
avar_bat_hndl_end:
__nop();		
}
  



