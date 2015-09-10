#line 1 "beep.c"
#line 1 "beep.h"


void beep_init(long zvuk,char fl);
void beep_hndl(void);
void beep_drv(void); 







#line 2 "beep.c"
#line 1 "uku206.h"












typedef struct  
{
enum {iMn,iSrv_sl,iNet,iSet,iBat,iBps,iS2,iSet_prl,iK_prl,iDnd,iK,
	iSpcprl,iSpc,k,Crash_0,Crash_1,iKednd,iAv_view_avt,iAKE,
	iLoad,iSpc_prl_vz,iSpc_prl_ke,iKe,iVz,iAvz,iAVAR,iStr,iVrs,iPrltst,iApv,
	iK_bps,iK_bps_sel,iK_bat,iK_bat_sel,iK_load,iK_net,iTst,iTst_klbr,iTst_BPS1,iTst_BPS2,
	iTst_BPS12,iDebug,iDef,iSet_st_prl,iK_pdp,iSet_T,iDeb,iJ_bat,iK_inv,iK_inv_sel,
	iPrl_bat_in_out,iPdp1,iJAv_sel,iJAv_net_sel,iJAv_net,iJAv_src1,
	 iAusw,iAusw_prl,iAusw_set,iK_t_out,iAv_view,
	iBatLogKe,iJ_bat_ke,iBatLogVz,iJ_bat_vz,iBatLogWrk ,iExtern,
	iExt_set,iExt_dt,iExt_sk, iSM,iLog,iLog_,iBatLog}i;

signed char s_i;
signed char s_i1;
signed char s_i2;
signed char i_s;
} stuct_ind_;







extern stuct_ind_ aa,b[10];


void bitmap_hndl(void);
void ind_hndl(void);
__irq void timer1_interrupt(void);
__irq void timer0_interrupt(void); 

#line 3 "beep.c"
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





#line 4 "beep.c"
#line 1 "C:\\Keil\\ARM\\INC\\Philips\\LPC21XX.h"
 
 
 
 
 
 
 
 
 
 




 
#line 59 "C:\\Keil\\ARM\\INC\\Philips\\LPC21XX.h"

 




 
#line 82 "C:\\Keil\\ARM\\INC\\Philips\\LPC21XX.h"

 




 





 


 



 





 
#line 124 "C:\\Keil\\ARM\\INC\\Philips\\LPC21XX.h"

 
#line 142 "C:\\Keil\\ARM\\INC\\Philips\\LPC21XX.h"

 
#line 159 "C:\\Keil\\ARM\\INC\\Philips\\LPC21XX.h"

 
#line 171 "C:\\Keil\\ARM\\INC\\Philips\\LPC21XX.h"

 
#line 185 "C:\\Keil\\ARM\\INC\\Philips\\LPC21XX.h"

 
#line 194 "C:\\Keil\\ARM\\INC\\Philips\\LPC21XX.h"

 






 






 
#line 236 "C:\\Keil\\ARM\\INC\\Philips\\LPC21XX.h"

 



 


 
#line 253 "C:\\Keil\\ARM\\INC\\Philips\\LPC21XX.h"

 




 
#line 284 "C:\\Keil\\ARM\\INC\\Philips\\LPC21XX.h"

 
#line 310 "C:\\Keil\\ARM\\INC\\Philips\\LPC21XX.h"

 
#line 336 "C:\\Keil\\ARM\\INC\\Philips\\LPC21XX.h"

 
#line 362 "C:\\Keil\\ARM\\INC\\Philips\\LPC21XX.h"

 





#line 5 "beep.c"

extern signed short ZV_ON;
extern BAT_STAT bat[2];

unsigned long beep_stat_temp,beep_stat;
char beep_stat_cnt;
char beep_cnt;













extern unsigned avar_stat;	 	
extern unsigned avar_ind_stat; 	
extern unsigned avar_stat_old;
extern unsigned avar_stat_new,avar_stat_offed;










void beep_init(long zvuk,char fl) 
{
if(fl=='O')
	{
	beep_stat_temp=zvuk;
	beep_stat=0x0L;
	beep_stat_cnt=32;
	} 
else if(fl=='A')
	{
	beep_stat_temp=zvuk;
	beep_stat=zvuk;
	beep_stat_cnt=32;
	}	 

else if(fl=='R')
	{
	beep_stat=zvuk;
	}	
		          
else if(fl=='S')
	{
	beep_stat_temp=0x0L;
	beep_stat=0x0L;
	beep_stat_cnt=32;
	}	
}


void beep_hndl(void) 
{ 
static char bcnt;
bcnt++; 
if(bcnt>9)bcnt=0;

if(avar_ind_stat)beep_init(0x33333333,'R');

else if((bat[0]._temper_stat&0x03)||(bat[1]._temper_stat&0x03))beep_init(0x00000005,'R');

else beep_init(0x00000000,'S');


 














 




}


void beep_drv(void)
{
(*((volatile unsigned long *) 0xE0028018)) = ( ((*((volatile unsigned long *) 0xE0028018)) & ~((0xffffffff>>(32-1))<<27)) | (1 << 27) );
if(((*(char*)(&beep_stat_temp))&0x01)&&(ZV_ON))
    	{
    	(*((volatile unsigned long *) 0xE0028014)) = ( ((*((volatile unsigned long *) 0xE0028014)) & ~((0xffffffff>>(32-1))<<27)) | (1 << 27) );
    	beep_cnt=6;
    	}
else (*((volatile unsigned long *) 0xE002801C)) = ( ((*((volatile unsigned long *) 0xE002801C)) & ~((0xffffffff>>(32-1))<<27)) | (1 << 27) );

beep_stat_temp>>=1;
if(--beep_stat_cnt==0)
	{
	beep_stat_cnt=32;
	beep_stat_temp=beep_stat;
	}
}

    

