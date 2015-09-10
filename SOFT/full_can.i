#line 1 "full_can.c"

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

 





#line 3 "full_can.c"
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
#line 4 "full_can.c"
#line 1 "cmd.h"


#line 5 "full_can.c"
#line 1 "mess.h"










		





void mess_hndl(void);
void mess_send(char _mess, short par0, short par1, char _time);
char mess_find(char _mess);
char mess_find_unvol(char _mess);

#line 6 "full_can.c"
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





#line 7 "full_can.c"



short volatile gCANFilter = 0;

char ptr_can1_tx_wr,ptr_can1_tx_rd;
long can1_info[8];
long can1_id[8];
long can1_data[8];
long can1_datb[8];


char ptr_can2_tx_wr,ptr_can2_tx_rd;
long can2_info[8];
long can2_id[8];
long can2_data[8];
long can2_datb[8];

unsigned short rotor_can[6];



typedef struct
{
  unsigned int Dat1; 
                     
                     
                     
  unsigned int DatA; 
  unsigned int DatB; 
} FULLCAN_MSG;



FULLCAN_MSG volatile gFullCANList[2];

char bR;
char RXBUFF[40],TXBUFF[40];
char bIN,bIN2;
char bd_dumm[25];
char bd[25];
char TX_len;
char bOUT;
char RXBUFF2[40],TXBUFF2[40];
extern char can_tx_cnt;
extern char can_tx_cnt2;
char bOUT_FREE=1;
char bOUT_FREE2=1;
char rotor_rotor_rotor[2];
char can_tx_cnt;

const char Table87[]={
0x00, 0x0E, 0x1C, 0x12, 0x38, 0x36, 0x24, 0x2A, 0x70, 0x7E, 0x6C, 0x62, 0x48, 0x46, 0x54, 0x5A,
0xE0, 0xEE, 0xFC, 0xF2, 0xD8, 0xD6, 0xC4, 0xCA, 0x90, 0x9E, 0x8C, 0x82, 0xA8, 0xA6, 0xB4, 0xBA,
0xCE, 0xC0, 0xD2, 0xDC, 0xF6, 0xF8, 0xEA, 0xE4, 0xBE, 0xB0, 0xA2, 0xAC, 0x86, 0x88, 0x9A, 0x94,
0x2E, 0x20, 0x32, 0x3C, 0x16, 0x18, 0x0A, 0x04, 0x5E, 0x50, 0x42, 0x4C, 0x66, 0x68, 0x7A, 0x74,
0x92, 0x9C, 0x8E, 0x80, 0xAA, 0xA4, 0xB6, 0xB8, 0xE2, 0xEC, 0xFE, 0xF0, 0xDA, 0xD4, 0xC6, 0xC8,
0x72, 0x7C, 0x6E, 0x60, 0x4A, 0x44, 0x56, 0x58, 0x02, 0x0C, 0x1E, 0x10, 0x3A, 0x34, 0x26, 0x28,
0x5C, 0x52, 0x40, 0x4E, 0x64, 0x6A, 0x78, 0x76, 0x2C, 0x22, 0x30, 0x3E, 0x14, 0x1A, 0x08, 0x06,
0xBC, 0xB2, 0xA0, 0xAE, 0x84, 0x8A, 0x98, 0x96, 0xCC, 0xC2, 0xD0, 0xDE, 0xF4, 0xFA, 0xE8, 0xE6,
0x2A, 0x24, 0x36, 0x38, 0x12, 0x1C, 0x0E, 0x00, 0x5A, 0x54, 0x46, 0x48, 0x62, 0x6C, 0x7E, 0x70,
0xCA, 0xC4, 0xD6, 0xD8, 0xF2, 0xFC, 0xEE, 0xE0, 0xBA, 0xB4, 0xA6, 0xA8, 0x82, 0x8C, 0x9E, 0x90,
0xE4, 0xEA, 0xF8, 0xF6, 0xDC, 0xD2, 0xC0, 0xCE, 0x94, 0x9A, 0x88, 0x86, 0xAC, 0xA2, 0xB0, 0xBE,
0x04, 0x0A, 0x18, 0x16, 0x3C, 0x32, 0x20, 0x2E, 0x74, 0x7A, 0x68, 0x66, 0x4C, 0x42, 0x50, 0x5E,
0xB8, 0xB6, 0xA4, 0xAA, 0x80, 0x8E, 0x9C, 0x92, 0xC8, 0xC6, 0xD4, 0xDA, 0xF0, 0xFE, 0xEC, 0xE2,
0x58, 0x56, 0x44, 0x4A, 0x60, 0x6E, 0x7C, 0x72, 0x28, 0x26, 0x34, 0x3A, 0x10, 0x1E, 0x0C, 0x02,
0x76, 0x78, 0x6A, 0x64, 0x4E, 0x40, 0x52, 0x5C, 0x06, 0x08, 0x1A, 0x14, 0x3E, 0x30, 0x22, 0x2C,
0x96, 0x98, 0x8A, 0x84, 0xAE, 0xA0, 0xB2, 0xBC, 0xE6, 0xE8, 0xFA, 0xF4, 0xDE, 0xD0, 0xC2, 0xCC};



const char Table95[]={
0x00, 0x2A, 0x54, 0x7E, 0xA8, 0x82, 0xFC, 0xD6, 0x7A, 0x50, 0x2E, 0x04, 0xD2, 0xF8, 0x86, 0xAC,
0xF4, 0xDE, 0xA0, 0x8A, 0x5C, 0x76, 0x08, 0x22, 0x8E, 0xA4, 0xDA, 0xF0, 0x26, 0x0C, 0x72, 0x58,
0xC2, 0xE8, 0x96, 0xBC, 0x6A, 0x40, 0x3E, 0x14, 0xB8, 0x92, 0xEC, 0xC6, 0x10, 0x3A, 0x44, 0x6E,
0x36, 0x1C, 0x62, 0x48, 0x9E, 0xB4, 0xCA, 0xE0, 0x4C, 0x66, 0x18, 0x32, 0xE4, 0xCE, 0xB0, 0x9A,
0xAE, 0x84, 0xFA, 0xD0, 0x06, 0x2C, 0x52, 0x78, 0xD4, 0xFE, 0x80, 0xAA, 0x7C, 0x56, 0x28, 0x02,
0x5A, 0x70, 0x0E, 0x24, 0xF2, 0xD8, 0xA6, 0x8C, 0x20, 0x0A, 0x74, 0x5E, 0x88, 0xA2, 0xDC, 0xF6,
0x6C, 0x46, 0x38, 0x12, 0xC4, 0xEE, 0x90, 0xBA, 0x16, 0x3C, 0x42, 0x68, 0xBE, 0x94, 0xEA, 0xC0,
0x98, 0xB2, 0xCC, 0xE6, 0x30, 0x1A, 0x64, 0x4E, 0xE2, 0xC8, 0xB6, 0x9C, 0x4A, 0x60, 0x1E, 0x34,
0x76, 0x5C, 0x22, 0x08, 0xDE, 0xF4, 0x8A, 0xA0, 0x0C, 0x26, 0x58, 0x72, 0xA4, 0x8E, 0xF0, 0xDA,
0x82, 0xA8, 0xD6, 0xFC, 0x2A, 0x00, 0x7E, 0x54, 0xF8, 0xD2, 0xAC, 0x86, 0x50, 0x7A, 0x04, 0x2E,
0xB4, 0x9E, 0xE0, 0xCA, 0x1C, 0x36, 0x48, 0x62, 0xCE, 0xE4, 0x9A, 0xB0, 0x66, 0x4C, 0x32, 0x18,
0x40, 0x6A, 0x14, 0x3E, 0xE8, 0xC2, 0xBC, 0x96, 0x3A, 0x10, 0x6E, 0x44, 0x92, 0xB8, 0xC6, 0xEC, 
0xD8, 0xF2, 0x8C, 0xA6, 0x70, 0x5A, 0x24, 0x0E, 0xA2, 0x88, 0xF6, 0xDC, 0x0A, 0x20, 0x5E, 0x74, 
0x2C, 0x06, 0x78, 0x52, 0x84, 0xAE, 0xD0, 0xFA, 0x56, 0x7C, 0x02, 0x28, 0xFE, 0xD4, 0xAA, 0x80, 
0x1A, 0x30, 0x4E, 0x64, 0xB2, 0x98, 0xE6, 0xCC, 0x60, 0x4A, 0x34, 0x1E, 0xC8, 0xE2, 0x9C, 0xB6, 
0xEE, 0xC4, 0xBA, 0x90, 0x46, 0x6C, 0x12, 0x38, 0x94, 0xBE, 0xC0, 0xEA, 0x3C, 0x16, 0x68, 0x42};


extern struct stuct_ind 
{
enum {iMn,iSrv_sl,iNet,iSet,iBat,iSrc,iS2,iSet_prl,iK_prl,iDnd,iK,
	iSpcprl,iSpc,k,Crash_0,Crash_1,iKednd,
	iLoad,iSpc_prl_vz,iSpc_prl_ke,iKe,iVz,iAVAR,iStr,iVrs,iPrltst,iApv,
	iK_src,iK_src_sel,iK_bat,iK_bat_sel,iK_load,iK_net,iTst,iTst_klbr,iTst_BPS1,iTst_BPS2,
	iTst_BPS12,iDebug,iDef,iSet_st_prl,iK_pdp,iSet_T,iDeb,iJ_bat,iK_inv,iK_inv_sel,
	iPrl_bat_in_out,iPdp1,iJAv_sel,iJAv_net_sel,iJAv_net,iJAv_src1,
	iJAv_src2,iJAv_bat,iJAv_bat_sel,iAusw,iAusw_prl,iAusw_set,iK_t_out,
	iJ_bat_ke_sel,iJ_bat_ke,iJ_bat_vz_sel,iJ_bat_vz,iJ_bat_wrk_sel,iJ_bat_wrk,
	iExt_set,iExt_dt,iExt_sk,iAvz,iJAv_src1_sel,iJAv_src2_sel,iSM}i;

signed char s_i;
signed char s_i1;
signed char s_i2;
signed char i_s;
} aa,b[10];





















extern BPS_STAT bps[12];



char CRC1_in(void)
{
char r,j,lb;
lb=(RXBUFF[1]&0x1f)+0x04;
r=RXBUFF[0];
for(j=1;j<(lb+1);j++)
	{
	r=(RXBUFF[j]^Table87[r]);
	}
if(r==0)r=0xFF;
return r;	
} 


char CRC2_in(void)
{
char r,j,lb;
lb=(RXBUFF[1]&0x1f)+0x04;
r=RXBUFF[0];
for(j=1;j<(lb+1);j++)
	{
	r=(RXBUFF[j]^Table95[r]);
	}
if(r==0)r=0xFF;
return r;	
}  


char CRC1_out(void)
{
char r,j,lb;
lb=(TXBUFF[1]&0x1f)+0x04;
r=TXBUFF[0];
for(j=1;j<(lb+1);j++)
	{
	r=(TXBUFF[j]^Table87[r]);
	}
if(r==0)r=0xFF;
return r;	
} 


char CRC2_out(void)
{
char r,j,lb;
lb=(TXBUFF[1]&0x1f)+0x04;
r=TXBUFF[0];
for(j=1;j<(lb+1);j++)
	{
	r=(TXBUFF[j]^Table95[r]);
	}
if(r==0)r=0xFF;
return r;	
}


void can1_out_adr(char* ptr,char num)
{

if(num<=8)
	{
	can1_info[ptr_can1_tx_wr]=(((long)num)<<16)&0x000f0000UL;
	can1_id[ptr_can1_tx_wr]=0x0000009eUL;
	*((char*)&can1_data[ptr_can1_tx_wr])=ptr[0];
	*(((char*)&can1_data[ptr_can1_tx_wr])+1)=ptr[1];
	*(((char*)&can1_data[ptr_can1_tx_wr])+2)=ptr[2];
	*(((char*)&can1_data[ptr_can1_tx_wr])+3)=ptr[3];
	*((char*)&can1_datb[ptr_can1_tx_wr])=ptr[4];
	*(((char*)&can1_datb[ptr_can1_tx_wr])+1)=ptr[5];
	*(((char*)&can1_datb[ptr_can1_tx_wr])+2)=ptr[6];
	*(((char*)&can1_datb[ptr_can1_tx_wr])+3)=ptr[7];	
	ptr_can1_tx_wr++;
	if(ptr_can1_tx_wr>=8)ptr_can1_tx_wr=0;
	}
	
else if(num<=16)
	{
	can1_info[ptr_can1_tx_wr]=(8UL<<16)&0x000f0000UL;
	can1_id[ptr_can1_tx_wr]=0x0000009eUL;
	*((char*)&can1_data[ptr_can1_tx_wr])=ptr[0];
	*(((char*)&can1_data[ptr_can1_tx_wr])+1)=ptr[1];
	*(((char*)&can1_data[ptr_can1_tx_wr])+2)=ptr[2];
	*(((char*)&can1_data[ptr_can1_tx_wr])+3)=ptr[3];
	*((char*)&can1_datb[ptr_can1_tx_wr])=ptr[4];
	*(((char*)&can1_datb[ptr_can1_tx_wr])+1)=ptr[5];
	*(((char*)&can1_datb[ptr_can1_tx_wr])+2)=ptr[6];
	*(((char*)&can1_datb[ptr_can1_tx_wr])+3)=ptr[7];	
	ptr_can1_tx_wr++;
	if(ptr_can1_tx_wr>=8)ptr_can1_tx_wr=0;
	
	can1_info[ptr_can1_tx_wr]=(((long)(num-8))<<16)&0x000f0000UL;
	can1_id[ptr_can1_tx_wr]=0x0000009eUL;
	*((char*)&can1_data[ptr_can1_tx_wr])=ptr[8];
	*(((char*)&can1_data[ptr_can1_tx_wr])+1)=ptr[9];
	*(((char*)&can1_data[ptr_can1_tx_wr])+2)=ptr[10];
	*(((char*)&can1_data[ptr_can1_tx_wr])+3)=ptr[11];
	*((char*)&can1_datb[ptr_can1_tx_wr])=ptr[12];
	*(((char*)&can1_datb[ptr_can1_tx_wr])+1)=ptr[13];
	*(((char*)&can1_datb[ptr_can1_tx_wr])+2)=ptr[14];
	*(((char*)&can1_datb[ptr_can1_tx_wr])+3)=ptr[15];	
	ptr_can1_tx_wr++;
	if(ptr_can1_tx_wr>=8)ptr_can1_tx_wr=0;	
	}	

else if(num<=24)
	{
	can1_info[ptr_can1_tx_wr]=(8UL<<16)&0x000f0000UL;
	can1_id[ptr_can1_tx_wr]=0x0000009eUL;
	*((char*)&can1_data[ptr_can1_tx_wr])=ptr[0];
	*(((char*)&can1_data[ptr_can1_tx_wr])+1)=ptr[1];
	*(((char*)&can1_data[ptr_can1_tx_wr])+2)=ptr[2];
	*(((char*)&can1_data[ptr_can1_tx_wr])+3)=ptr[3];
	*((char*)&can1_datb[ptr_can1_tx_wr])=ptr[4];
	*(((char*)&can1_datb[ptr_can1_tx_wr])+1)=ptr[5];
	*(((char*)&can1_datb[ptr_can1_tx_wr])+2)=ptr[6];
	*(((char*)&can1_datb[ptr_can1_tx_wr])+3)=ptr[7];	
	ptr_can1_tx_wr++;
	if(ptr_can1_tx_wr>=8)ptr_can1_tx_wr=0;

	can1_info[ptr_can1_tx_wr]=(8UL<<16)&0x000f0000UL;
	can1_id[ptr_can1_tx_wr]=0x0000009eUL;
	*((char*)&can1_data[ptr_can1_tx_wr])=ptr[8];
	*(((char*)&can1_data[ptr_can1_tx_wr])+1)=ptr[9];
	*(((char*)&can1_data[ptr_can1_tx_wr])+2)=ptr[10];
	*(((char*)&can1_data[ptr_can1_tx_wr])+3)=ptr[11];
	*((char*)&can1_datb[ptr_can1_tx_wr])=ptr[12];
	*(((char*)&can1_datb[ptr_can1_tx_wr])+1)=ptr[13];
	*(((char*)&can1_datb[ptr_can1_tx_wr])+2)=ptr[14];
	*(((char*)&can1_datb[ptr_can1_tx_wr])+3)=ptr[15];	
	ptr_can1_tx_wr++;
	if(ptr_can1_tx_wr>=8)ptr_can1_tx_wr=0;
	
	can1_info[ptr_can1_tx_wr]=(((long)(num-16))<<16)&0x000f0000UL;
	can1_id[ptr_can1_tx_wr]=0x0000009eUL;
	*((char*)&can1_data[ptr_can1_tx_wr])=ptr[16];
	*(((char*)&can1_data[ptr_can1_tx_wr])+1)=ptr[17];
	*(((char*)&can1_data[ptr_can1_tx_wr])+2)=ptr[16];
	*(((char*)&can1_data[ptr_can1_tx_wr])+3)=ptr[19];
	*((char*)&can1_datb[ptr_can1_tx_wr])=ptr[20];
	*(((char*)&can1_datb[ptr_can1_tx_wr])+1)=ptr[21];
	*(((char*)&can1_datb[ptr_can1_tx_wr])+2)=ptr[22];
	*(((char*)&can1_datb[ptr_can1_tx_wr])+3)=ptr[23];	
	ptr_can1_tx_wr++;
	if(ptr_can1_tx_wr>=8)ptr_can1_tx_wr=0;	
	}	

else if(num<=32)
	{
	can1_info[ptr_can1_tx_wr]=(8UL<<16)&0x000f0000UL;
	can1_id[ptr_can1_tx_wr]=0x0000009eUL;
	*((char*)&can1_data[ptr_can1_tx_wr])=ptr[0];
	*(((char*)&can1_data[ptr_can1_tx_wr])+1)=ptr[1];
	*(((char*)&can1_data[ptr_can1_tx_wr])+2)=ptr[2];
	*(((char*)&can1_data[ptr_can1_tx_wr])+3)=ptr[3];
	*((char*)&can1_datb[ptr_can1_tx_wr])=ptr[4];
	*(((char*)&can1_datb[ptr_can1_tx_wr])+1)=ptr[5];
	*(((char*)&can1_datb[ptr_can1_tx_wr])+2)=ptr[6];
	*(((char*)&can1_datb[ptr_can1_tx_wr])+3)=ptr[7];	
	ptr_can1_tx_wr++;
	if(ptr_can1_tx_wr>=8)ptr_can1_tx_wr=0;

	can1_info[ptr_can1_tx_wr]=(8UL<<16)&0x000f0000UL;
	can1_id[ptr_can1_tx_wr]=0x0000009eUL;
	*((char*)&can1_data[ptr_can1_tx_wr])=ptr[8];
	*(((char*)&can1_data[ptr_can1_tx_wr])+1)=ptr[9];
	*(((char*)&can1_data[ptr_can1_tx_wr])+2)=ptr[10];
	*(((char*)&can1_data[ptr_can1_tx_wr])+3)=ptr[11];
	*((char*)&can1_datb[ptr_can1_tx_wr])=ptr[12];
	*(((char*)&can1_datb[ptr_can1_tx_wr])+1)=ptr[13];
	*(((char*)&can1_datb[ptr_can1_tx_wr])+2)=ptr[14];
	*(((char*)&can1_datb[ptr_can1_tx_wr])+3)=ptr[15];	
	ptr_can1_tx_wr++;
	if(ptr_can1_tx_wr>=8)ptr_can1_tx_wr=0;
	
	can1_info[ptr_can1_tx_wr]=(8UL<<16)&0x000f0000UL;
	can1_id[ptr_can1_tx_wr]=0x0000009eUL;
	*((char*)&can1_data[ptr_can1_tx_wr])=ptr[16];
	*(((char*)&can1_data[ptr_can1_tx_wr])+1)=ptr[17];
	*(((char*)&can1_data[ptr_can1_tx_wr])+2)=ptr[18];
	*(((char*)&can1_data[ptr_can1_tx_wr])+3)=ptr[19];
	*((char*)&can1_datb[ptr_can1_tx_wr])=ptr[20];
	*(((char*)&can1_datb[ptr_can1_tx_wr])+1)=ptr[21];
	*(((char*)&can1_datb[ptr_can1_tx_wr])+2)=ptr[22];
	*(((char*)&can1_datb[ptr_can1_tx_wr])+3)=ptr[23];	
	ptr_can1_tx_wr++;
	if(ptr_can1_tx_wr>=8)ptr_can1_tx_wr=0;
	
	can1_info[ptr_can1_tx_wr]=(((long)(num-24))<<16)&0x000f0000UL;
	can1_id[ptr_can1_tx_wr]=0x0000009eUL;
	*((char*)&can1_data[ptr_can1_tx_wr])=ptr[24];
	*(((char*)&can1_data[ptr_can1_tx_wr])+1)=ptr[25];
	*(((char*)&can1_data[ptr_can1_tx_wr])+2)=ptr[26];
	*(((char*)&can1_data[ptr_can1_tx_wr])+3)=ptr[27];
	*((char*)&can1_datb[ptr_can1_tx_wr])=ptr[28];
	*(((char*)&can1_datb[ptr_can1_tx_wr])+1)=ptr[29];
	*(((char*)&can1_datb[ptr_can1_tx_wr])+2)=ptr[30];
	*(((char*)&can1_datb[ptr_can1_tx_wr])+3)=ptr[31];	
	ptr_can1_tx_wr++;
	if(ptr_can1_tx_wr>=8)ptr_can1_tx_wr=0;	
	}	


if(bOUT_FREE)
	{
	(*((volatile unsigned long *) 0xE0044030))=can1_info[ptr_can1_tx_rd];
     (*((volatile unsigned long *) 0xE0044034))=can1_id[ptr_can1_tx_rd];
     (*((volatile unsigned long *) 0xE0044038))=can1_data[ptr_can1_tx_rd];
     (*((volatile unsigned long *) 0xE004403C))=can1_datb[ptr_can1_tx_rd];
     (*((volatile unsigned long *) 0xE0044004))=0x00000021;
     ptr_can1_tx_rd++;
     if(ptr_can1_tx_rd>=8)ptr_can1_tx_rd=0;
     bOUT_FREE=0;	
	}

}	


void can2_out(char data0,char data1,char data2,char data3,char data4,char data5,char data6,char data7)
{

can2_info[ptr_can2_tx_wr]=((8UL)<<16)&0x000f0000UL;
can2_id[ptr_can2_tx_wr]=0x0000009eUL;
*((char*)&can2_data[ptr_can2_tx_wr])=data0;
*(((char*)&can2_data[ptr_can2_tx_wr])+1)=data1;
*(((char*)&can2_data[ptr_can2_tx_wr])+2)=data2;
*(((char*)&can2_data[ptr_can2_tx_wr])+3)=data3;
*((char*)&can2_datb[ptr_can2_tx_wr])=data4;
*(((char*)&can2_datb[ptr_can2_tx_wr])+1)=data5;
*(((char*)&can2_datb[ptr_can2_tx_wr])+2)=data6;
*(((char*)&can2_datb[ptr_can2_tx_wr])+3)=data7;	
ptr_can2_tx_wr++;
if(ptr_can2_tx_wr>=8)ptr_can2_tx_wr=0;



if(bOUT_FREE2)
	{
	(*((volatile unsigned long *) 0xE0048030))=can2_info[ptr_can2_tx_rd];
     (*((volatile unsigned long *) 0xE0048034))=can2_id[ptr_can2_tx_rd];
     (*((volatile unsigned long *) 0xE0048038))=can2_data[ptr_can2_tx_rd];
     (*((volatile unsigned long *) 0xE004803C))=can2_datb[ptr_can2_tx_rd];
     (*((volatile unsigned long *) 0xE0048004))=0x00000021;
     ptr_can2_tx_rd++;
     if(ptr_can2_tx_rd>=8)ptr_can2_tx_rd=0;
     bOUT_FREE2=0;	
	}

}	


void can_adr_hndl(void)
{
	TXBUFF[2]=RXBUFF[3];
	TXBUFF[3]=RXBUFF[2];
	TXBUFF[4]=((RXBUFF[4]&0xF0)>>4)|((RXBUFF[4]&0x0f)<<4);
	TXBUFF[5]=((RXBUFF[5]&0xF0)>>4)|((RXBUFF[5]&0x0f)<<4);	
}	


void can_in_an(void)
{
if(!bIN) goto CAN_IN_AN_end; 


CAN_IN_AN_end:
bIN=0;
}


void can_in_an2(void)
{


char slave_num;

if(!bIN2) goto CAN_IN_AN2_end; 



if((RXBUFF2[0]==aa . s_i1)&&(RXBUFF2[1]==0x91)&&(RXBUFF2[2]==0xdd)&&(RXBUFF2[3]==0xdd)&&(aa . s_i==6))
	{
	mess_send(215,217,0,10);
	}


if((RXBUFF2[1]==0xDA)&&((RXBUFF2[0]&0x1f)>=0)&&((RXBUFF2[0]&0x1f)<20))
     {
     slave_num=RXBUFF2[0]&0x1f;
     
     if((RXBUFF2[0]&0xe0)==0)bps[slave_num]._device=dSRC;
     else if((RXBUFF2[0]&0xe0)==0x40)bps[slave_num]._device=dINV;
     	
	bps[slave_num]._buff[0]=RXBUFF2[2]; 
	bps[slave_num]._buff[1]=RXBUFF2[3];
	bps[slave_num]._buff[2]=RXBUFF2[4];
	bps[slave_num]._buff[3]=RXBUFF2[5];
	bps[slave_num]._buff[4]=RXBUFF2[6];
	bps[slave_num]._buff[5]=RXBUFF2[7];
	
	bps[slave_num]._cnt=0;
	bps[slave_num]._is_on_cnt=10;
	
 	if((bps[slave_num]._cnt==0)&&(bps[slave_num]._av&(1<<3))) avar_bps_hndl(slave_num,3,0);
     }

if((RXBUFF2[1]==0xDB)&&((RXBUFF2[0]&0x1f)>=0)&&((RXBUFF2[0]&0x1f)<9))
     {
     slave_num=RXBUFF2[0]&0x1f;  

     if((RXBUFF2[0]&0xe0)==0)bps[slave_num]._device=dSRC;
     else if((RXBUFF2[0]&0xe0)==0x40)bps[slave_num]._device=dINV;
     
	bps[slave_num]._buff[6]=RXBUFF2[2]; 
	bps[slave_num]._buff[7]=RXBUFF2[3];
	bps[slave_num]._buff[8]=RXBUFF2[4];
	bps[slave_num]._buff[9]=RXBUFF2[5];
	bps[slave_num]._buff[10]=RXBUFF2[6];
	bps[slave_num]._buff[11]=RXBUFF2[7];
	
	bps[slave_num]._cnt=0;
	bps[slave_num]._is_on_cnt=10; 

   	
     }



CAN_IN_AN2_end:
bIN2=0;
}
  





  
__irq void can_isr_rx (void) 
{
unsigned int buf;
unsigned int *pDest;
char temp;
char *ptr,j;


rotor_can[0]++;
 if((*((volatile unsigned long *) 0xE004400C)) & 0x00000001L)
	{
	if (!((*((volatile unsigned long *) 0xE0044020)) & 0xC0000400L))
    		{ 

    		
    		
    		
    		pDest = (unsigned int *) &(gFullCANList[((*((volatile unsigned long *) 0xE0044020)) & 0x000003FFL)].Dat1);
    
    		
    		buf = (*((volatile unsigned long *) 0xE0044020)) & 0xC00F0000L; 
    		buf |= 0x01002000L; 
    		buf |= (*((volatile unsigned long *) 0xE0044024)) & 0x000007FFL; 

    		
    		*pDest = buf; 
    		pDest++; 
    		*pDest = (*((volatile unsigned long *) 0xE0044028)); 
    		pDest++; 
    		*pDest = (*((volatile unsigned long *) 0xE004402C)); 

    		
    		buf |= 0x03000000L; 
    		pDest -= 2; 
    		*pDest = buf; 
    
		temp=(char)gFullCANList[0].DatA;
		if(temp==0x30) bR=0;
		else bR++;
	
		temp=(char)(((gFullCANList[0].Dat1)>>16)&0x0f); 
     
     	ptr=(char*)(&gFullCANList[0].DatA);
	
		if(!bR)
			{
			for(j=0;j<temp;j++)
				{
				RXBUFF[j]=*ptr;
				ptr++;
				}
			}
		else if(bR==1)
			{
			for(j=8;j<(temp+8);j++)
				{
				RXBUFF[j]=*ptr;
				ptr++;
				}                      
			
			} 		
	
	
	
		
		temp=((RXBUFF[1]&0x1f)+4);
    		
		if((CRC1_in()==RXBUFF[temp+1])&&(CRC2_in()==RXBUFF[temp+2])&&bR)
			{
  
			bIN=1;
  			
  			can_in_an();
			}    
    
  		}

	(*((volatile unsigned long *) 0xE0044004)) = 0x04; 
	}
	
if((*((volatile unsigned long *) 0xE004800C)) & 0x00000001L)
	{	
	if (!((*((volatile unsigned long *) 0xE0048020)) & 0xC0000400L))
  		{ 

		
    		
    		
    		pDest = (unsigned int *) &(gFullCANList[((*((volatile unsigned long *) 0xE0048020)) & 0x000003FFL)].Dat1);
    
    		
    		buf = (*((volatile unsigned long *) 0xE0048020)) & 0xC00F0000L; 
    		buf |= 0x01002000L; 
    		buf |= (*((volatile unsigned long *) 0xE0048024)) & 0x000007FFL; 

    		
    		*pDest = buf; 
    		pDest++; 
    		*pDest = (*((volatile unsigned long *) 0xE0048028)); 
    		pDest++; 
    		*pDest = (*((volatile unsigned long *) 0xE004802C)); 

    		
    		buf |= 0x03000000L; 
    		pDest -= 2; 
    		*pDest = buf; 
    
		temp=(char)gFullCANList[0].DatA;
		
 
	
		temp=(char)(((gFullCANList[0].Dat1)>>16)&0x0f); 
     
     	ptr=(char*)(&gFullCANList[0].DatA);
	
		for(j=0;j<temp;j++)
			{
			RXBUFF2[j]=*ptr;
			ptr++;
			}
		}
			
	bIN2=1;
	can_in_an2();


	(*((volatile unsigned long *) 0xE0048004)) = 0x04; 
	}

(*((volatile unsigned long *) 0xFFFFF030)) = 0xFFFFFFFFL; 

}







  

__irq void can_isr_tx (void) 
{





can_tx_cnt++;

rotor_can[2]++;

if((*((volatile unsigned long *) 0xE004400C)) & 0x00000002L)
	{
	if(ptr_can1_tx_wr!=ptr_can1_tx_rd)
		{
		(*((volatile unsigned long *) 0xE0044030))=can1_info[ptr_can1_tx_rd];
     	(*((volatile unsigned long *) 0xE0044034))=can1_id[ptr_can1_tx_rd];
     	(*((volatile unsigned long *) 0xE0044038))=can1_data[ptr_can1_tx_rd];
     	(*((volatile unsigned long *) 0xE004403C))=can1_datb[ptr_can1_tx_rd];
     	(*((volatile unsigned long *) 0xE0044004))=0x00000021;
     	ptr_can1_tx_rd++;
     	if(ptr_can1_tx_rd>=8)ptr_can1_tx_rd=0;
		}
	else bOUT_FREE=1;
	}
	
else if((*((volatile unsigned long *) 0xE004800C)) & 0x00000002L)
	{
	if(ptr_can2_tx_wr!=ptr_can2_tx_rd)
		{
		(*((volatile unsigned long *) 0xE0048030))=can1_info[ptr_can2_tx_rd];
     	(*((volatile unsigned long *) 0xE0048034))=can1_id[ptr_can2_tx_rd];
     	(*((volatile unsigned long *) 0xE0048038))=can1_data[ptr_can2_tx_rd];
     	(*((volatile unsigned long *) 0xE004803C))=can1_datb[ptr_can2_tx_rd];
     	(*((volatile unsigned long *) 0xE0048004))=0x00000021;
     	ptr_can2_tx_rd++;
     	if(ptr_can2_tx_rd>=8)ptr_can2_tx_rd=0;
		}
	else bOUT_FREE2=1;
	}
(*((volatile unsigned long *) 0xFFFFF030)) = 0xFFFFFFFFL; 
}

 
__irq void can_isr_err (void) 
{








if((*((volatile unsigned long *) 0xE004800C)) & 0x00000080L)
	{
	(*((volatile unsigned long *) 0xE0048008)) = ( ((*((volatile unsigned long *) 0xE0048008)) & ~((0xffffffff>>(32-8))<<24)) | (3 << 24) );
	(*((volatile unsigned long *) 0xE0048000))=0;
	bOUT_FREE2=1;
	}
(*((volatile unsigned long *) 0xFFFFF030)) = 0xFFFFFFFFL; 
}





  
short can1_init (unsigned short can_rx_vector, unsigned short can_tx_vector, unsigned int can_btr)
{
unsigned int *pSFR; 
unsigned int *pSFR2; 
unsigned int offset; 
                                               
(*((volatile unsigned long *) 0xE002C004)) |= 0x00040000L; 
offset = 0x00000000L; 


gCANFilter = 0;


(*((volatile unsigned long *) 0xE003C000)) = 0x00000001L;

pSFR = (unsigned int *) &(*((volatile unsigned long *) 0xE0044000)) + offset; 
*pSFR = 1; 

pSFR = (unsigned int *) &(*((volatile unsigned long *) 0xE0044010)) + offset; 
*pSFR = 0;

pSFR = (unsigned int *) &(*((volatile unsigned long *) 0xE0044008)) + offset; 
*pSFR = 0; 

pSFR = (unsigned int *) &(*((volatile unsigned long *) 0xE0044014)) + offset; 
*pSFR = can_btr; 

  
pSFR = (unsigned int *) &(*((volatile unsigned long *) 0xFFFFF100));
pSFR += can_rx_vector; 
  
pSFR2 = (unsigned int *) &(*((volatile unsigned long *) 0xFFFFF200));
pSFR2 += can_rx_vector; 


*pSFR = (unsigned long) can_isr_rx; 

*pSFR2 = 0x20 | 26;

(*((volatile unsigned long *) 0xFFFFF010)) = 0x04000000L;  

  
pSFR = (unsigned int *) &(*((volatile unsigned long *) 0xFFFFF100));
pSFR += can_tx_vector; 
  
pSFR2 = (unsigned int *) &(*((volatile unsigned long *) 0xFFFFF200));
pSFR2 += can_tx_vector; 


*pSFR = (unsigned long) can_isr_tx; 

*pSFR2 = 0x20 | 20;

(*((volatile unsigned long *) 0xFFFFF010)) = 0x00100000L;

pSFR = (unsigned int *) &(*((volatile unsigned long *) 0xE0044010)) + offset; 
*pSFR = 3; 


pSFR = (unsigned int *) &(*((volatile unsigned long *) 0xE0044000)) + offset; 
*pSFR = 0; 

return 1;
}




  
short can2_init (unsigned short can_rx_vector, unsigned short can_tx_vector, unsigned int can_btr)
{
unsigned int *pSFR; 
unsigned int *pSFR2; 
unsigned int offset; 
                                               
(*((volatile unsigned long *) 0xE002C004)) |= 0x00014000L; 
offset = 0x00001000L; 


gCANFilter = 0;


(*((volatile unsigned long *) 0xE003C000)) = 0x00000001L;

pSFR = (unsigned int *) &(*((volatile unsigned long *) 0xE0044000)) + offset; 
*pSFR = 1; 

pSFR = (unsigned int *) &(*((volatile unsigned long *) 0xE0044010)) + offset; 
*pSFR = 0;

pSFR = (unsigned int *) &(*((volatile unsigned long *) 0xE0044008)) + offset; 
*pSFR = 0; 

pSFR = (unsigned int *) &(*((volatile unsigned long *) 0xE0044014)) + offset; 
*pSFR = can_btr; 



  
pSFR = (unsigned int *) &(*((volatile unsigned long *) 0xFFFFF100));
pSFR += 12; 
  
pSFR2 = (unsigned int *) &(*((volatile unsigned long *) 0xFFFFF200));
pSFR2 += 12; 


*pSFR = (unsigned long) can_isr_err; 

*pSFR2 = 0x20 | 19;

(*((volatile unsigned long *) 0xFFFFF010)) = 1<<19; 



  
pSFR = (unsigned int *) &(*((volatile unsigned long *) 0xFFFFF100));
pSFR += can_rx_vector; 
  
pSFR2 = (unsigned int *) &(*((volatile unsigned long *) 0xFFFFF200));
pSFR2 += can_rx_vector; 


*pSFR = (unsigned long) can_isr_rx; 

*pSFR2 = 0x20 | 27;

(*((volatile unsigned long *) 0xFFFFF010)) = 0x08000000L;  

  
pSFR = (unsigned int *) &(*((volatile unsigned long *) 0xFFFFF100));
pSFR += can_tx_vector; 
  
pSFR2 = (unsigned int *) &(*((volatile unsigned long *) 0xFFFFF200));
pSFR2 += can_tx_vector; 


*pSFR = (unsigned long) can_isr_tx; 

*pSFR2 = 0x20 | 21;

(*((volatile unsigned long *) 0xFFFFF010)) = 0x00200000L;

pSFR = (unsigned int *) &(*((volatile unsigned long *) 0xE0044010)) + offset; 
*pSFR = 128+3; 


pSFR = (unsigned int *) &(*((volatile unsigned long *) 0xE0044000)) + offset; 
*pSFR = 0; 

return 1;
}




  
short FullCAN_SetFilter (
  unsigned short can_port, 
  unsigned int CANID 
  )
{
unsigned int p, n;
unsigned int buf0, buf1;
unsigned int ID_lower, ID_upper;
unsigned int candata;
unsigned int *pAddr;

  
  if ((can_port < 1) || (can_port > 2))
  { 
    return 0;
  }

  
  (*((volatile unsigned long *) 0xE003C000)) = 0x00000001L;

  if (gCANFilter == 0)
  { 
    gFullCANList[0].Dat1 = 0x000037FFL; 
  }
  if (gCANFilter >= 2)
  {
    return 0;
  }

  CANID &= 0x000007FFL; 
  CANID |= (can_port << 13); 

  
  
  p = 0;
  while (p < gCANFilter) 
  {
    if ((gFullCANList[p].Dat1 & 0x0000FFFFL) > CANID)
    {
      break;
    }
    p++;
  }

  
  buf0 = gFullCANList[p].Dat1; 
  gFullCANList[p].Dat1 = CANID; 

  
  gCANFilter++;
  while (p < gCANFilter)
  {
    p++;
    buf1 = gFullCANList[p].Dat1;
    gFullCANList[p].Dat1 = buf0;
    buf0 = buf1;
  }

  
  
  p = 0;

  
  
  (*((volatile unsigned long *) 0xE003C004)) = p;

  pAddr = (unsigned int *) ((0xE0000000) + 0x00038000);
  for (n = 0; n < ((gCANFilter+1)/2); n++)
  {
    ID_lower = gFullCANList[n * 2].Dat1 & 0x0000FFFFL;
    ID_upper = gFullCANList[n * 2 + 1].Dat1 & 0x0000FFFFL;
    candata = (ID_lower << 16) + ID_upper;
    *pAddr = candata;
    p += 4;
    pAddr++;
  }

  
  
  
  
  (*((volatile unsigned long *) 0xE003C008)) = p;

  
  
  (*((volatile unsigned long *) 0xE003C00C)) = p;

  
  
  (*((volatile unsigned long *) 0xE003C010)) = p;

  
  
  (*((volatile unsigned long *) 0xE003C014)) = p;

  
  (*((volatile unsigned long *) 0xE003C000)) = 0;
  
  return 1;
}






