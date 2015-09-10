#line 1 "control.c"
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





#line 2 "control.c"
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

#line 3 "control.c"
#line 1 "control.h"




char vz_start(char hour);
char vz_stop(void);
void vz_drv(void);
void samokalibr_init(void);
void samokalibr_hndl(void);
void kb_init(void);
void kb_hndl(void);
void ubat_old_drv(void);
void unet_drv(void);
void matemat(void);
void adc_init(void);
void adc_drv(void);
void adc_drv_(void);
void avg_hndl(void);


void rele_hndl(void);
void bps_hndl(void);
void bps_drv(char in);
void bat_hndl(void);
void bat_drv(char in);
void u_necc_hndl(void);
void cntrl_hndl(void);
void zar_drv(void);
void num_necc_hndl(void);
char ke_start(char in);
void avz_drv(void);




typedef enum {spcOFF=0,spcKE, spcVZ}enum_spc_stat;
extern enum_spc_stat spc_stat;

extern char spc_bat;
extern char spc_phase;
extern unsigned short vz_cnt_s,vz_cnt_h,vz_cnt_h_;







#line 4 "control.c"
#line 1 "mess.h"










		





void mess_hndl(void);
void mess_send(char _mess, short par0, short par1, char _time);
char mess_find(char _mess);
char mess_find_unvol(char _mess);

#line 5 "control.c"
#line 1 "gran.h"

void gran_ring_char(signed char *adr, signed char min, signed char max) ;
void gran_char(signed char *adr, signed char min, signed char max);
void gran(signed short *adr, signed short min, signed short max);
void gran_ring(signed short *adr, signed short min, signed short max);
void gran_long(signed long *adr, signed long min, signed long max); 
#line 6 "control.c"
#line 1 "common_func.h"




signed short abs(signed short in);
void clr_scrn(void);
char find(char xy);
void bin2bcd_int(unsigned int in);
void bcd2lcd_zero(char sig);
void int2lcd_m(signed short in,char xy,char des);
void int2lcd_mm(signed short in,char xy,char des);
void int2lcd_mmm(signed short in,char xy,char des);
void long2lcd_mmm(signed long in,char xy,char des);
void long2lcdyx_mmm(signed long in,char y,char x,char des);
void int2lcdyx(unsigned short in,char y,char x,char des);
void int2lcd(unsigned short in,char xy,char des);
void long2lcdhyx(unsigned long in,char y,char x);
void char2lcdh(char in,char yx);
void char2lcdhyx(char in,char y,char x);
void int2lcdhyx(unsigned short in,char y,char x);
void char2lcdbyx(char in,char y,char x);
void pointer_set(char num_of_first_row);
void tree_down(signed char offset_ind,signed char offset_sub_ind);
void tree_up(char tind, char tsub_ind, char tindex_set, char tsub_ind1);
void bgnd_par(char const *ptr0,char const *ptr1,char const *ptr2,char const *ptr3);
void sub_bgnd(char const *adr,char xy,signed char offset);
void show_mess(char* p1, char* p2, char* p3, char* p4,int m_sec);
void event2ind(char num, char simbol);
char ptr_carry(signed int in,unsigned char modul,signed int carry);
void event_data2ind(char num, char simbol);

#line 7 "control.c"
#line 1 "eeprom_map.h"






#line 18 "eeprom_map.h"



#line 66 "eeprom_map.h"



#line 83 "eeprom_map.h"



#line 95 "eeprom_map.h"


#line 106 "eeprom_map.h"




#line 157 "eeprom_map.h"

#line 172 "eeprom_map.h"










































































































 







#line 8 "control.c"
#line 1 "avar_hndl.h"


void avar_hndl(void);
void avar_unet_hndl(char in);
void reload_hndl(void);
void avar_bps_hndl(char bps, char v, char in);
void avar_bat_hndl(char bat, char in);



#line 9 "control.c"
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

#line 10 "control.c"
#line 1 "C:\\Keil\\ARM\\INC\\Philips\\LPC21XX.H"
 
 
 
 
 
 
 
 
 
 




 
#line 59 "C:\\Keil\\ARM\\INC\\Philips\\LPC21XX.H"

 




 
#line 82 "C:\\Keil\\ARM\\INC\\Philips\\LPC21XX.H"

 




 





 


 



 





 
#line 124 "C:\\Keil\\ARM\\INC\\Philips\\LPC21XX.H"

 
#line 142 "C:\\Keil\\ARM\\INC\\Philips\\LPC21XX.H"

 
#line 159 "C:\\Keil\\ARM\\INC\\Philips\\LPC21XX.H"

 
#line 171 "C:\\Keil\\ARM\\INC\\Philips\\LPC21XX.H"

 
#line 185 "C:\\Keil\\ARM\\INC\\Philips\\LPC21XX.H"

 
#line 194 "C:\\Keil\\ARM\\INC\\Philips\\LPC21XX.H"

 






 






 
#line 236 "C:\\Keil\\ARM\\INC\\Philips\\LPC21XX.H"

 



 


 
#line 253 "C:\\Keil\\ARM\\INC\\Philips\\LPC21XX.H"

 




 
#line 284 "C:\\Keil\\ARM\\INC\\Philips\\LPC21XX.H"

 
#line 310 "C:\\Keil\\ARM\\INC\\Philips\\LPC21XX.H"

 
#line 336 "C:\\Keil\\ARM\\INC\\Philips\\LPC21XX.H"

 
#line 362 "C:\\Keil\\ARM\\INC\\Philips\\LPC21XX.H"

 





#line 11 "control.c"








extern const unsigned short ADR_KI0BAT[2];

   


extern BAT_STAT bat[2];

extern signed short		bat_u_old_cnt;



extern signed short load_U;
extern signed short load_I;
extern signed short u_necc,u_necc_;
extern signed short main_cnt_5Hz;
extern signed short num_necc;
extern signed short num_necc_Imax;
extern signed short num_necc_Imin;




extern signed mat_temper;

extern signed short Ktout[3];






typedef struct  
	{
     unsigned int bAN:1; 
     unsigned int bAB1:1; 
     unsigned int bAB2:1;
     unsigned int bAS1:1;
     unsigned int bAS2:1;
     unsigned int bAS3:1;
     unsigned int bAS4:1;
     unsigned int bAS5:1;
     unsigned int bAS6:1;
     unsigned int bAS7:1;
     unsigned int bAS8:1;
     unsigned int bAS9:1;
     unsigned int bAS10:1;
     unsigned int bAS11:1;
     unsigned int bAS12:1;
     }avar_struct;
     
extern union 
{
avar_struct av;
int avar_stat;
}a,a_;



short adc_buff[16][16],adc_buff_[16];
char adc_cnt,adc_cnt1,adc_ch;
short zero_cnt;
enum {asCH=1,asNET_WAIT=2,asNET_RDY=3,asNET=4} adc_stat=asCH;
unsigned short net_buff[32],net_buff_;
char net_buff_cnt;
short ADWR,period_cnt;
char rele_stat;
char bRELE_OUT;


extern int mess_par0[10],mess_par1[10],mess_data[2];

extern signed short TBAT;
extern signed short Kunet;
extern signed short Kubat[2];
extern unsigned short ad7705_buff[2][16],ad7705_buff_[2];
extern unsigned short Kibat0[2];
extern signed short Kibat1[2];
extern signed short Ktbat[2];

short adc_buff_out_[3];
extern char kb_full_ver;
extern signed short Kuload;

signed short bat_ver_cnt=150;
extern signed short Isumm;
extern signed short Isumm_;
extern char ND_out[3];
extern signed short tout[4];


short plazma_adc_cnt;

extern char cntrl_plazma;





signed char vent_stat=0;



signed short cntrl_stat=600;
signed short cntrl_stat_old=600;
signed short cntrl_stat_new;
signed short Ibmax;



signed short samokalibr_cnt;





short avg_main_cnt=20;
short i_avg_max,i_avg_min,i_avg_summ,i_avg; 
short avg;
char bAVG;
char avg_cnt;  
char avg_num; 



signed short 	main_kb_cnt;
signed short 	kb_cnt_1lev;
signed short 	kb_cnt_2lev;
char 		kb_full_ver;
char kb_start[2];



char num_of_wrks_bps;
char bps_all_off_cnt,bps_mask_off_cnt,bps_mask_on_off_cnt;
char bps_hndl_2sec_cnt;
unsigned short bps_on_mask,bps_off_mask;



enum_spc_stat spc_stat;
char spc_bat;
char spc_phase;
unsigned short vz_cnt_s,vz_cnt_h,vz_cnt_h_;
char bAVZ;



signed short net_U,net_Ustore;
char bFF,bFF_;
signed short net_F,hz_out,hz_out_cnt;
signed char unet_drv_cnt;
char net_av;















extern signed short Ktsrc[2];
extern signed short Kusrc[2];
extern signed short Kisrc[2];
extern signed short Ki0src[2];
extern signed short Kubat[2];
extern unsigned short Kibat0[2];
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
extern signed short TBATMAX;
extern signed short TBATSIGN;

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
extern unsigned short BAT_C_NOM[2];
extern signed short BAT_RESURS[2];
extern unsigned short BAT_C_REAL[2];

extern const unsigned short ADR_EE_BAT_ZAR_CNT[2];
extern const unsigned short ADR_EE_BAT_ZAR_CNT_KE[2];

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



extern signed short main_10Hz_cnt;
extern signed short main_1Hz_cnt;
extern signed char sec_bcd,sec__;
extern signed char min_bcd,min__;
extern signed char hour_bcd,hour__;
extern signed char day_bcd,day__;
extern signed char month_bcd,month__;
extern signed char year_bcd,year__;



extern unsigned avar_stat;	 	
extern unsigned avar_ind_stat; 	
extern unsigned avar_stat_old;
extern unsigned avar_stat_new,avar_stat_offed;










extern BPS_STAT bps[12];



char ke_start(char in)
{          
char out;
out=0; 



























































































































































































 
return out;
}


char ke_drv(void)
{

























































































































 			
}


char vz_start(char hour)
{          
char out;
out=0;
if(spc_stat==spcOFF)
	{
	spc_stat=spcVZ;  
	vz_cnt_h=hour;
	vz_cnt_h_=0;
	vz_cnt_s=0;
	out=1;
	
	}



return out;
}


char vz_stop(void)
{          
vz_cnt_s=0;
vz_cnt_h=0;
vz_cnt_h_=0;
spc_stat=spcOFF;
}


void avz_next_date_hndl(void)
{
if((month__+AVZ)>12)lc640_write_int(0x10+100+68,year__+1);
else lc640_write_int(0x10+100+68,year__);



if((month__+AVZ)>12)lc640_write_int(0x10+100+66,(month__+AVZ)-12);
else lc640_write_int(0x10+100+66,month__+AVZ);                                                 



if(day__>28) lc640_write_int(0x10+100+64,28);
else lc640_write_int(0x10+100+64,day__);



lc640_write_int(0x10+100+58,hour__);
lc640_write_int(0x10+100+60,min__);
lc640_write_int(0x10+100+62,sec__);

}


void avz_drv(void)                               
{                
if(AVZ!=AVZ_OFF)
	{
	if((year__==YEAR_AVZ)&&(month__==MONTH_AVZ)&&(day__==DATE_AVZ)&&(hour__==HOUR_AVZ)&&(min__==MIN_AVZ)&&(sec__==SEC_AVZ))
		{
		bAVZ=1;
		}
	}
if(bAVZ)
	{
	if(vz_start(AVZ_TIME))
		{
		bAVZ=0;
		avz_next_date_hndl();
		}
	}	

}


void vz_drv(void)
{ 
if(spc_stat==spcVZ)
	{
	if(vz_cnt_s<3600)
		{
		vz_cnt_s++;
		if(vz_cnt_s>=3600)
			{
			vz_cnt_s=0;
			if(vz_cnt_h)
				{
				vz_cnt_h--;
				vz_cnt_h_++;
				if(vz_cnt_h==0)
					{
					spc_stat=spcOFF;
			    		
					}
				}
			}
		}
	}
} 





void kb_init(void)
{
main_kb_cnt=(TBAT*60)-60 ;
}


void kb_hndl(void)
{

static signed short ibat[2],ibat_[2];

if(++main_kb_cnt>=TBAT*60)
	{
	main_kb_cnt=0;
	
	kb_start[0]=0;
	kb_start[1]=0;

	if( (BAT_IS_ON[0]==bisON) && (bat[0]._Ub>80) && ( (abs(bat[0]._Ib<IKB)) || (bat[0]._av) ) ) kb_start[0]=1;
	if( (BAT_IS_ON[1]==bisON) && (bat[1]._Ub>80) && ( (abs(bat[1]._Ib<IKB)) || (bat[1]._av) ) ) kb_start[1]=1;
	
	if( (net_av) || (num_of_wrks_bps==0) || ( (spc_stat!=spcOFF) && (spc_stat!=spcVZ) ) ) 
		{
		kb_start[0]=0;
		kb_start[1]=0;
		}

	if((kb_start[0]==1)||(kb_start[1]==1))
		{
		kb_cnt_1lev=10;
		}
	else kb_cnt_1lev=0;
	}

if(kb_cnt_1lev)
	{
	kb_cnt_1lev--;

	if(kb_cnt_1lev>5)mess_send(225,100,30,15);
	else if(kb_cnt_1lev>0) mess_send(225,105,30,15);


	if(kb_cnt_1lev==5)
		{
		ibat[0]=abs(bat[0]._Ib);
		ibat[1]=abs(bat[1]._Ib);
		}
	
	if(kb_cnt_1lev==0)
		{
		ibat_[0]=abs(bat[0]._Ib);
		ibat_[1]=abs(bat[1]._Ib);

		kb_cnt_2lev=0;
		if( (ibat[0]+ibat_[0]) < IKB ) 
			{
			kb_cnt_2lev=10;  
			}
		else 
			{
			kb_start[0]=0;
			avar_bat_hndl(0,0);
			}
		
		if( (ibat[1]+ibat_[1]) < IKB )
			{
			kb_cnt_2lev=10;     
			}
		else 
			{
			kb_start[1]=0;
			avar_bat_hndl(1,0);
			}
		}	


	}
else if(kb_cnt_2lev)
	{
	kb_cnt_2lev--;

	if(kb_cnt_2lev>5)mess_send(225,100,200,15);
	else if(kb_cnt_2lev>0) mess_send(225,105,200,15);


	if(kb_cnt_2lev==5)
		{
		ibat[0]=abs(bat[0]._Ib);
		ibat[1]=abs(bat[1]._Ib);
		}
	
	if(kb_cnt_2lev==0)
		{
		ibat_[0]=abs(bat[0]._Ib);
		ibat_[1]=abs(bat[1]._Ib);

		kb_full_ver=0;

		if( (ibat[0]+ibat_[0]) < IKB ) 
			{
			kb_full_ver=1;  
			}
		else 			
			{
			kb_start[0]=0;
			avar_bat_hndl(0,0);
			}

		if( (ibat[1]+ibat_[1]) < IKB )
			{
			kb_full_ver=1;     
			}
		else			
			{
			kb_start[1]=0;
			avar_bat_hndl(1,0);
			}


		}	
	}

else if(kb_full_ver)
	{
	
	mess_send(225,110,0,15);

	if( abs(bat[0]._Ib) > IKB ) 
		{
		if(kb_start[0]==1)
			{
			kb_start[0]=0;
			avar_bat_hndl(0,0);
			}
		}

	if( abs(bat[1]._Ib) > IKB ) 
		{
		if(kb_start[1]==1)
			{
			kb_start[1]=0;
			avar_bat_hndl(1,0);
			}
		}

	if( (mess_find(230))	&& (mess_data[0]==231) )
		{
		kb_full_ver=0;
		if(kb_start[0]==1) avar_bat_hndl(0,1);
		if(kb_start[1]==1) avar_bat_hndl(1,1);
		}
	}

}



void samokalibr_init(void)
{
samokalibr_cnt=1785;
}

void samokalibr_hndl(void)
{
if(++samokalibr_cnt>=1800)samokalibr_cnt=0;

if(samokalibr_cnt>=1785U)
	{
	mess_send(210,100,0,15);
	mess_send(215,216,0,15);
	mess_send(220,216,0,15);
	} 

if(samokalibr_cnt==1799U)
	{
	if(Kibat0[0]!=ad7705_buff_[0]) lc640_write_int(ADR_KI0BAT[0],ad7705_buff_[0]);
	if(Kibat0[1]!=ad7705_buff_[1]) lc640_write_int(ADR_KI0BAT[1],ad7705_buff_[1]);
	
	}	 	
}




void ubat_old_drv(void)
{        
bat_u_old_cnt++;
gran_ring(&bat_u_old_cnt,0,8);

bat[0]._u_old[bat_u_old_cnt]=bat[0]._Ub;
bat[1]._u_old[bat_u_old_cnt]=bat[1]._Ub;
}


void unet_drv(void)
{
if(net_U<UMN)
	{
	if(unet_drv_cnt<10)
		{
		unet_drv_cnt++;
		if(unet_drv_cnt>=10)
			{
			net_Ustore=net_U;
		 	avar_unet_hndl(1);
			
			}
		}
	else if(unet_drv_cnt>=10)unet_drv_cnt=10;

	if(net_U<net_Ustore) net_Ustore=net_U;	
	}

else if(net_U>UMN)
	{                 
	if(unet_drv_cnt)
		{
		unet_drv_cnt--;
		if(unet_drv_cnt<=0)
			{
			avar_unet_hndl(0);
			}
		}
	else if(unet_drv_cnt<0)unet_drv_cnt=0;
	
	}

}


void matemat(void)
{

signed long temp_SL ;
char  i;



temp_SL=(signed long)net_buff_;
temp_SL*=Kunet;
temp_SL/=110000L;
net_U=(signed short)temp_SL;


temp_SL=(signed long)adc_buff_[4];
temp_SL*=Kubat[0];
temp_SL/=500L;
bat[0]._Ub=(signed short)temp_SL;

temp_SL=(signed long)adc_buff_[0];
temp_SL*=Kubat[1];
temp_SL/=500L;
bat[1]._Ub=(signed short)temp_SL;

if(!mess_find_unvol(220))
	{


	temp_SL=(signed long)ad7705_buff_[0];
	temp_SL-=(signed long)Kibat0[0];
	temp_SL*=(signed long)Kibat1[0];
	temp_SL/=1000L;
	bat[0]._Ib=(signed short)temp_SL;

	temp_SL=(signed long)ad7705_buff_[1];
	temp_SL-=(signed long)Kibat0[1];
	temp_SL*=(signed long)Kibat1[1];
	temp_SL/=1000L;
	bat[1]._Ib=(signed short)temp_SL;
	}

if((adc_buff_[12]>200)&&(adc_buff_[12]<1000))bat[0]._nd=0;
else bat[0]._nd=1;
temp_SL=(signed long)adc_buff_[12];
temp_SL*=Ktbat[0];
temp_SL/=5000L;
temp_SL-=273L;
bat[0]._Tb=(signed short)temp_SL;

if((adc_buff_[10]>200)&&(adc_buff_[10]<1000))bat[1]._nd=0;
else bat[1]._nd=1;
temp_SL=(signed long)adc_buff_[10];
temp_SL*=Ktbat[1];
temp_SL/=5000L;
temp_SL-=273L;
bat[1]._Tb=(signed short)temp_SL;




 

if((kb_full_ver)&&(abs(bat[0]._Ib)>IKB))
	{
	kb_full_ver=0;
	
	gran(&TBAT,5,60);
     bat_ver_cnt=TBAT*300;
	}











 


temp_SL=(signed long)adc_buff_[9];
temp_SL*=Kuload;
temp_SL/=500L;
load_U=(signed short)temp_SL;



	

 


 











 




if((adc_buff_out_[0]>200)&&(adc_buff_out_[0]<800))ND_out[0]=0;
else ND_out[0]=0xff;

temp_SL=(signed long)adc_buff_out_[0];
temp_SL*=Ktout[0];
temp_SL/=2000L;
temp_SL-=273L;
tout[0]=(signed short)temp_SL;


if((adc_buff_out_[1]>200)&&(adc_buff_out_[1]<800))ND_out[1]=0;
else ND_out[1]=0xff;

temp_SL=(signed long)adc_buff_out_[1];
temp_SL*=Ktout[1];
temp_SL/=2000L;
temp_SL-=273L;
tout[1]=(signed short)temp_SL;


if((adc_buff_out_[2]>200)&&(adc_buff_out_[2]<800))ND_out[2]=0;
else ND_out[2]=0xff;

temp_SL=(signed long)adc_buff_out_[2];
temp_SL*=Ktout[2];
temp_SL/=2000L;
temp_SL-=273L;
tout[2]=(signed short)temp_SL;


if((BAT_IS_ON[0]==bisON)&&(bat[0]._Ub>200)) Ibmax=bat[0]._Ib;
if((BAT_IS_ON[1]==bisON)&&(bat[1]._Ub>200)&&(bat[1]._Ib>bat[0]._Ib)) Ibmax=bat[1]._Ib;















 


for(i=0;i<NUMIST;i++)
	{
	if(bps[i]._cnt<25)
     	{
     	bps[i]._Ii=bps[i]._buff[0]+(bps[i]._buff[1]*256);
     	bps[i]._Uin=bps[i]._buff[2]+(bps[i]._buff[3]*256);
     	bps[i]._Uii=bps[i]._buff[4]+(bps[i]._buff[5]*256);
     	bps[i]._Ti=(signed)(bps[i]._buff[6]);
     	bps[i]._adr_ee=bps[i]._buff[7];
     	bps[i]._flags_tm=bps[i]._buff[8];
	     bps[i]._rotor=bps[i]._buff[10]+(bps[i]._buff[11]*256);    
     	} 
	else 
     	{
     	bps[i]._Uii=0; 
     	bps[i]._Ii=0;
     	bps[i]._Uin=0;
     	bps[i]._Ti=0;
     	bps[i]._flags_tm=0; 
	     bps[i]._rotor=0;    
     	}
     
     }



load_I=-(bat[0]._Ib/10)-(bat[1]._Ib/10);

Isumm=0;

for(i=0;i<NUMIST;i++)
     {
     if(bps[i]._cnt<5)Isumm+=bps[i]._Ii;
     }  
     
load_I=load_I+Isumm;
if(load_I<0)load_I=0;
	
}



void adc_init(void)
{

(*((volatile unsigned long *) 0xE002C004)) = ( ((*((volatile unsigned long *) 0xE002C004)) & ~((0xffffffff>>(32-2))<<(28-16)*2)) | (1 << (28-16)*2) );
(*((volatile unsigned long *) 0xE002C004)) = ( ((*((volatile unsigned long *) 0xE002C004)) & ~((0xffffffff>>(32-2))<<(29-16)*2)) | (1 << (29-16)*2) );
(*((volatile unsigned long *) 0xE002C004)) = ( ((*((volatile unsigned long *) 0xE002C004)) & ~((0xffffffff>>(32-2))<<(30-16)*2)) | (1 << (30-16)*2) );	

(*((volatile unsigned long *) 0xE002C000)) = ( ((*((volatile unsigned long *) 0xE002C000)) & ~((0xffffffff>>(32-2))<<(4)*2)) | (0 << (4)*2) );
(*((volatile unsigned long *) 0xE002C000)) = ( ((*((volatile unsigned long *) 0xE002C000)) & ~((0xffffffff>>(32-2))<<(5)*2)) | (0 << (5)*2) );
(*((volatile unsigned long *) 0xE002C000)) = ( ((*((volatile unsigned long *) 0xE002C000)) & ~((0xffffffff>>(32-2))<<(6)*2)) | (0 << (6)*2) );

(*((volatile unsigned long *) 0xE0028008)) = ( ((*((volatile unsigned long *) 0xE0028008)) & ~((0xffffffff>>(32-1))<<4)) | (1 << 4) );
(*((volatile unsigned long *) 0xE0028008)) = ( ((*((volatile unsigned long *) 0xE0028008)) & ~((0xffffffff>>(32-1))<<5)) | (1 << 5) );
(*((volatile unsigned long *) 0xE0028008)) = ( ((*((volatile unsigned long *) 0xE0028008)) & ~((0xffffffff>>(32-1))<<6)) | (1 << 6) );

period_cnt=0;
zero_cnt=0;
adc_stat=asNET_WAIT;

(*((volatile unsigned long *) 0xE0034000)) = ( ((*((volatile unsigned long *) 0xE0034000)) & ~((0xffffffff>>(32-1))<<21)) | (1 << 21) );	
(*((volatile unsigned long *) 0xE0034000)) = ( ((*((volatile unsigned long *) 0xE0034000)) & ~((0xffffffff>>(32-8))<<8)) | (14 << 8) );	
(*((volatile unsigned long *) 0xE0034000)) = ( ((*((volatile unsigned long *) 0xE0034000)) & ~((0xffffffff>>(32-1))<<16)) | (0 << 16) );	
(*((volatile unsigned long *) 0xE0034000)) = ( ((*((volatile unsigned long *) 0xE0034000)) & ~((0xffffffff>>(32-3))<<17)) | (0 << 17) );	
(*((volatile unsigned long *) 0xE0034000)) = ( ((*((volatile unsigned long *) 0xE0034000)) & ~((0xffffffff>>(32-2))<<22)) | (0 << 22) );	
(*((volatile unsigned long *) 0xE0034000)) = ( ((*((volatile unsigned long *) 0xE0034000)) & ~((0xffffffff>>(32-3))<<24)) | (1 << 24) );	

}


void adc_drv(void)
{
short temp_S;
char i;
if(( ((*((volatile unsigned long *) 0xE0034004)) & ((0xffffffff>>(32-1))<<31)) >> 31))
	{
	plazma_adc_cnt++;
	ADWR=(short)(( ((*((volatile unsigned long *) 0xE0034004)) & ((0xffffffff>>(32-10))<<6)) >> 6));

	if(adc_stat==asNET_WAIT)
		{
		if(ADWR<20)
			{
			if(zero_cnt<20) 
				{
				zero_cnt++;
				if(zero_cnt>=20)
					{
					adc_stat=asNET_RDY;
					period_cnt=0;
			(*((volatile unsigned long *) 0xE0028008))|=(1<<25);
			(*((volatile unsigned long *) 0xE002800C))|=(1<<25);
					}
				}

			}
		else zero_cnt=0;
		
		period_cnt++;
		if(period_cnt>50)
			{
			adc_stat=asNET_RDY;
			period_cnt=0;
			(*((volatile unsigned long *) 0xE0028008))|=(1<<25);
			(*((volatile unsigned long *) 0xE002800C))|=(1<<25);
			
			}

		}
	 else if(adc_stat==asNET_RDY)
		{
		if(ADWR>20)
			{
			adc_stat=asNET;
			period_cnt=0;
			(*((volatile unsigned long *) 0xE0028008))|=(1<<25);
			(*((volatile unsigned long *) 0xE0028004))|=(1<<25);
			net_buff[net_buff_cnt]=0;
			}
		period_cnt++;
		if(period_cnt>200)
			{
			adc_stat=asNET;
			period_cnt=0;
	
	
			net_buff[net_buff_cnt]=0;
			}
		 }

	else if(adc_stat==asNET)
		{

		net_buff[net_buff_cnt]+=ADWR;
		
		period_cnt++;
		if((ADWR<20)||(period_cnt>100))
			{
			adc_stat=asCH;
			period_cnt=0;
	
	
			
			net_buff_cnt++;
			if(net_buff_cnt>=32)
				{
				unsigned long tempUL=0;
				char i;
				net_buff_cnt=0;
				tempUL=0;
				for(i=0;i<32;i++)
					{
					tempUL+=net_buff[i];
					}
				net_buff_=(unsigned short)(tempUL>>5);	
				}
		
			}
		}

	else if(adc_stat==asCH)
		{
		if(++period_cnt>=10)
			{
			period_cnt=0;
			adc_buff[adc_ch][adc_cnt]=ADWR;
		
			if(++adc_ch>=16) 
				{
				adc_ch=0;
				adc_cnt++;
				if(adc_cnt>=16)adc_cnt=0;
				}	

			if((adc_cnt&0x03)==0)
				{
				temp_S=0;
				for(i=0;i<16;i++)
					{
					temp_S+=adc_buff[adc_ch][i];
					adc_buff_[adc_ch]=temp_S>>4;
					}
				}
			
		
			if((adc_ch&0x03)==0) 
				{
				adc_stat=asNET_WAIT;
				(*((volatile unsigned long *) 0xE0028008))|=(1<<25);
				(*((volatile unsigned long *) 0xE0028004))|=(1<<25);
				period_cnt=0;
				zero_cnt=0;
				bRELE_OUT=1;
				}
			}






















 


		} 













 
	
 


































































 





 	
	} 
	













 










 


(*((volatile unsigned long *) 0xE0028018))|=(1<<25);
(*((volatile unsigned long *) 0xE0028014))|=(1<<25);

if(bRELE_OUT==1)
	{
	char i,temp;

 
	(*((volatile unsigned long *) 0xE002800C))|=(1<<6);
	(*((volatile unsigned long *) 0xE002800C))|=(1<<6);
	(*((volatile unsigned long *) 0xE002800C))|=(1<<6);
	(*((volatile unsigned long *) 0xE002800C))|=(1<<6);
	(*((volatile unsigned long *) 0xE002800C))|=(1<<6);
	(*((volatile unsigned long *) 0xE002800C))|=(1<<6);
	(*((volatile unsigned long *) 0xE002800C))|=(1<<6);
	(*((volatile unsigned long *) 0xE002800C))|=(1<<6);
	(*((volatile unsigned long *) 0xE002800C))|=(1<<6);
	(*((volatile unsigned long *) 0xE002800C))|=(1<<6);
	
	bRELE_OUT=0;

	temp=rele_stat;
	for(i=0;i<8;i++)
		{
		if(temp&0x80)(*((volatile unsigned long *) 0xE0028004))|=(1<<4);
		else (*((volatile unsigned long *) 0xE002800C))|=(1<<4);
		__nop(); 
		__nop();
		__nop();
		__nop();
		(*((volatile unsigned long *) 0xE0028004))|=(1<<6);
		__nop();
		__nop();
		__nop();
		__nop();
		__nop(); 
		__nop();
		__nop();
		__nop();
		(*((volatile unsigned long *) 0xE002800C))|=(1<<6);
		__nop();
		__nop();
		__nop();
		__nop();
		temp<<=1;		
		}
	(*((volatile unsigned long *) 0xE0028018))|=(1<<25);
	(*((volatile unsigned long *) 0xE002801C))|=(1<<25);		
	(*((volatile unsigned long *) 0xE0028018))|=(1<<25);
	(*((volatile unsigned long *) 0xE0028014))|=(1<<25);

	
		
	}
else 
	{

	if(adc_ch&0x02)	(*((volatile unsigned long *) 0xE0028004)) = ( ((*((volatile unsigned long *) 0xE0028004)) & ~((0xffffffff>>(32-1))<<5)) | (1 << 5) );
	else 			(*((volatile unsigned long *) 0xE002800C)) = ( ((*((volatile unsigned long *) 0xE002800C)) & ~((0xffffffff>>(32-1))<<5)) | (1 << 5) );
	if(adc_ch&0x04)	(*((volatile unsigned long *) 0xE0028004)) = ( ((*((volatile unsigned long *) 0xE0028004)) & ~((0xffffffff>>(32-1))<<6)) | (1 << 6) );
	else 			(*((volatile unsigned long *) 0xE002800C)) = ( ((*((volatile unsigned long *) 0xE002800C)) & ~((0xffffffff>>(32-1))<<6)) | (1 << 6) );
	if(adc_ch&0x08)	(*((volatile unsigned long *) 0xE0028004)) = ( ((*((volatile unsigned long *) 0xE0028004)) & ~((0xffffffff>>(32-1))<<4)) | (1 << 4) );
	else 			(*((volatile unsigned long *) 0xE002800C)) = ( ((*((volatile unsigned long *) 0xE002800C)) & ~((0xffffffff>>(32-1))<<4)) | (1 << 4) ); 

	}	
	
if((adc_stat==asNET)
||(adc_stat==asNET_WAIT)
||(adc_stat==asNET_RDY)) 	(*((volatile unsigned long *) 0xE0034000)) = ( ((*((volatile unsigned long *) 0xE0034000)) & ~((0xffffffff>>(32-8))<<0)) | (2 << 0) );
else if(adc_ch&0x01)		(*((volatile unsigned long *) 0xE0034000)) = ( ((*((volatile unsigned long *) 0xE0034000)) & ~((0xffffffff>>(32-8))<<0)) | (8 << 0) );
else 					(*((volatile unsigned long *) 0xE0034000)) = ( ((*((volatile unsigned long *) 0xE0034000)) & ~((0xffffffff>>(32-8))<<0)) | (4 << 0) ); 
					   
(*((volatile unsigned long *) 0xE0034000)) = ( ((*((volatile unsigned long *) 0xE0034000)) & ~((0xffffffff>>(32-3))<<24)) | (1 << 24) );	
}
 































































 




void avg_hndl(void)
{ 
char i;


if(avg_main_cnt)
	{
	avg_main_cnt--;
	goto avg_hndl_end;
	}                 

avg_num=0;

for(i=0;i<NUMIST;i++)
	{
	if((bps[i]._state==bsWRK)&&(bps[i]._cnt<20))avg_num++;
	}



 

	
if(avg_num<2)
	{
	goto avg_hndl_end;
	}
	
else
	{
	i_avg_min=5000;
	i_avg_max=0;
	i_avg_summ=0;
	for(i=0;i<NUMIST;i++)
		{
		if(bps[i]._state==bsWRK)
			{
			if(bps[i]._Ii>i_avg_max)i_avg_max=bps[i]._Ii;
			if(bps[i]._Ii<i_avg_min)i_avg_min=bps[i]._Ii;
			
			i_avg_summ+=bps[i]._Ii;
			}
		}
	i_avg=i_avg_summ/avg_num;	
	
	if(i_avg_min==0)i_avg_min=1;

	avg=i_avg_max;
	avg*=100;
	avg/=i_avg_min;

	if(avg>160) bAVG=1;
	if(avg<120) bAVG=0;

	if(bAVG==1)
		{
		for(i=0;i<NUMIST;i++)
			{
			if(bps[i]._state==bsWRK)
				{
				if(bps[i]._Ii>i_avg)bps[i]._x_--;
				if(bps[i]._Ii<i_avg)bps[i]._x_++;
			
				if(bps[i]._x_<-50)bps[i]._x_=-50;
				if(bps[i]._x_>50)bps[i]._x_=50;	
				}
			}		
		}			
	}   	 


avg_hndl_end:
__nop();  
}












 

void rele_hndl(void)
{
static char cnt_rel_sam;
char temp;




 















 


if(mess_find(5))
	{
	cnt_rel_sam=10;
	
	
	}



 














 


temp=0;

if(bat[0]._rel_stat)
	{
	temp|=(1<<6);
	}  


if(bat[1]._rel_stat)
	{
	temp|=(1<<4);
	}




if(cnt_rel_sam) cnt_rel_sam--;

(*((volatile unsigned long *) 0xE0028018))|=(1UL<<21);	
if(mess_find_unvol((210))&&(100)) (*((volatile unsigned long *) 0xE0028014))=(1UL<<21);
else if (cnt_rel_sam) (*((volatile unsigned long *) 0xE0028014))=(1UL<<21);
else (*((volatile unsigned long *) 0xE002801C))=(1UL<<21);



if((mess_find_unvol(210))&&	(mess_data[0]==101))
	{
	if(mess_data[1]==0) temp|=(1<<1);
	}
else 
	{
	if(!(avar_ind_stat)) temp|=(1<<1);
	}

if((mess_find_unvol(210))&&	(mess_data[0]==102))
	{
	if(mess_data[1]==0) temp|=(1<<5);
	}
else 
	{
	if(!(avar_ind_stat&0x00000001)) temp|=(1<<5);
	}


if((mess_find_unvol(210))&&	(mess_data[0]==103))
	{
	if(mess_data[1]==0) temp|=(1<<3);
	}
else 
	{
	if(!(avar_ind_stat&0x00000006)) temp|=(1<<3);
	}

if((mess_find_unvol(210))&&	(mess_data[0]==103))
	{
	if(mess_data[1]==0) temp|=(1<<2);
	}
else 
	{
	if(!vent_stat) temp|=(1<<2);
	}

rele_stat=temp;

}


void bps_hndl(void)
{
static unsigned char sh_cnt0 ,b1Hz_sh ;
char ptr__,i;

if(sh_cnt0<10)
	{
	sh_cnt0++;
	if(sh_cnt0>=10)
		{
		sh_cnt0=0;
		b1Hz_sh=1;
		}
	}









 








































 



  
bps_on_mask=0;
bps_off_mask=0;

if(mess_find_unvol(205))
	{
	if(mess_data[0]==206)
		{
		bps_off_mask=0xffff;
		}

	if(mess_data[0]==207)
		{
		bps_off_mask=mess_data[1];
		}

	if(mess_data[0]==209)
		{
		bps_on_mask=mess_data[1];
		}

	if(mess_data[0]==210)
		{
		bps_on_mask=0xffff;
		}

	if(mess_data[0]==208)
		{
		bps_on_mask=mess_data[1];
		bps_off_mask=~(mess_data[1]);
		}


	for(i=0;i<=NUMIST;i++)
		{
		if(bps_off_mask&(1<<i)) bps[i]._blok_cnt++;
		else bps[i]._blok_cnt=0;
		gran(&bps[i]._blok_cnt,0,50);
		if(bps[i]._blok_cnt>20) bps[i]._flags_tu=1;
		if(bps_on_mask&(1<<i)) bps[i]._flags_tu=0;
	     }

	

































 										
	}


else if(b1Hz_sh)
	{
	ptr__=0;
     for(i=0;i<=NUMIST;i++)
		{
	     bps[i]._flags_tu=1;
	     }	
  	     
  	for(i=0;(i<NUMIST)&&(ptr__<num_necc);i++)
  		{
  	     if((bps[i]._state==bsRDY)||(bps[i]._state==bsWRK))
  	         	{
  	         	bps[i]._flags_tu=0;
  	         	ptr__++;
  	         	}
  	     }
	if(main_1Hz_cnt<60)
		{
     	for(i=0;i<=NUMIST;i++)
			{
	     	bps[i]._flags_tu=0;
	     	}	
		}	 
  	}


for(i=0;i<NUMIST;i++)
     {
     if(bps[i]._ist_blok_host_cnt!=0)
          {
          bps[i]._flags_tu=99;
	     bps[i]._ist_blok_host_cnt--;
          }
     }




b1Hz_sh=0;


num_of_wrks_bps=0;
for(i=0;i<NUMIST;i++)
	{
	if(bps[i]._state==bsWRK)num_of_wrks_bps++;
	}
}







void bps_drv(char in)
{
char temp;

temp=bps[in]._flags_tm;

if(temp&(1<<1))
	{
	if(bps[in]._temp_av_cnt<1200) 
		{
		bps[in]._temp_av_cnt++;
		if(bps[in]._temp_av_cnt>=1200)
			{
			bps[in]._temp_av_cnt=1200;
		   	if(!(bps[in]._av&(1<<0)))avar_bps_hndl(in,0,1);
			}
		}
	}

else if(!(temp&(1<<1)))
	{
	if(bps[in]._temp_av_cnt) 
		{
		bps[in]._temp_av_cnt--;
		if(!bps[in]._temp_av_cnt)
			{
			if(bps[in]._av&(1<<0))avar_bps_hndl(in,0,0);
			}
		} 	

	}

if((temp&(1<<3)))
	{
	if(bps[in]._umax_av_cnt<10) 
		{
		bps[in]._umax_av_cnt++;
		if(bps[in]._umax_av_cnt>=10)
			{ 
			bps[in]._umax_av_cnt=10;
			if(!(bps[in]._av&(1<<1)))avar_bps_hndl(in,1,1);
		  	






 
						
			}
		} 
	}		
else if(!(temp&(1<<3)))
	{
	if(bps[in]._umax_av_cnt>0) 
		{
		bps[in]._umax_av_cnt--;
		if(bps[in]._umax_av_cnt==0)
			{
			bps[in]._umax_av_cnt=0;
			avar_bps_hndl(in,1,0);
	 
	
	 
			}
		}
	else if(bps[in]._umax_av_cnt<0) bps[in]._umax_av_cnt=0;		 
	}

if(temp&(1<<4))
	{
	if(bps[in]._umin_av_cnt<10) 
		{
		bps[in]._umin_av_cnt++;
		if(bps[in]._umin_av_cnt>=10)
			{ 
			bps[in]._umin_av_cnt=10;
			if(!(bps[in]._av&(1<<2)))avar_bps_hndl(in,2,1);
		  	






 				
			}
		} 
	}	
	
else if(!(temp&(1<<4)))
	{
	if(bps[in]._umin_av_cnt) 
		{
		bps[in]._umin_av_cnt--;
		if(bps[in]._umin_av_cnt==0)
			{
			bps[in]._umin_av_cnt=0;
			avar_bps_hndl(in,2,0);
		
		
		
			}
		}
	else if(bps[in]._umin_av_cnt>10)bps[in]._umin_av_cnt--;	 
	}



if (bps[in]._av&0x0f)					bps[in]._state=bsAV;
else if ( (net_av) && 
		(bps[in]._Uii<200))				bps[in]._state=bsOFF_AV_NET;
else if (bps[in]._flags_tm&(((0x100000) | 0x100000>>3 | 0x100000>>6 | 0x100000>>9) & 0xf | ((0x100000) | 0x100000>>3 | 0x100000>>6 | 0x100000>>9)>>12 & 0xf0))	bps[in]._state=bsRDY;
else if (bps[in]._cnt<20)				bps[in]._state=bsWRK;























     















  


if(bps[in]._cnt>=10) bps[in]._flags_tu|=(((0x10000000) | 0x10000000>>3 | 0x10000000>>6 | 0x10000000>>9) & 0xf | ((0x10000000) | 0x10000000>>3 | 0x10000000>>6 | 0x10000000>>9)>>12 & 0xf0);
else bps[in]._flags_tu&=(((0x1111111) | 0x1111111>>3 | 0x1111111>>6 | 0x1111111>>9) & 0xf | ((0x1111111) | 0x1111111>>3 | 0x1111111>>6 | 0x1111111>>9)>>12 & 0xf0);
	
bps[in]._vol_u=cntrl_stat+bps[in]._x_;	
 
}


void bat_hndl(void)
{






























 

if(mess_find_unvol(200))
	{ 
	char i;
	
	if(mess_data[0]==201)
		{
		for(i=0;i<2;i++)
			{
			if(bat[i]._cnt_to_block<50)bat[i]._cnt_to_block++;
			}
		}

	else if(mess_data[0]==202)
		{
		for(i=0;i<2;i++)
			{
			if(mess_data[1]&(1<<i))
				{
				if(bat[i]._cnt_to_block<50) bat[i]._cnt_to_block++;
				}
			else bat[i]._cnt_to_block=0;
			}
		}
	else 
	 	{
		for(i=0;i<2;i++)
			{
			bat[i]._cnt_to_block=0;
			}

		}
	for(i=0;i<2;i++)
		{
		if(bat[i]._cnt_to_block>20)bat[i]._rel_stat=1;
		else bat[i]._rel_stat=0;
		}

	}

else 
	{
	char i;
	for(i=0;i<2;i++)
		{
		bat[i]._cnt_to_block=0;
		bat[i]._rel_stat=0;
		}

	}















 
}


void bat_drv(char in)
{
unsigned short tempUS,tempUS_;
unsigned long tempUL,tempUL_;
unsigned short b_zar;
static unsigned short time_cnt[2];



if(++(bat[in]._time_cnt)>=10)
	{
	bat[in]._time_cnt=0;
	
	}

if(main_10Hz_cnt==50)
	{
	if(!bat[in]._rel_stat)
		{
		if(bat[in]._Ub<80) 
			{
			if(!(bat[in]._av))avar_bat_hndl(in,1);
			}
		}
	}

if(abs(bat[in]._Ib)>IKB) 
	{
	if((bat[in]._av))avar_bat_hndl(in,0);
	}



if(bat[in]._Ib>(-IKB))
	{
	if(bat[in]._cnt_wrk<10)
		{
		bat[in]._cnt_wrk++;
		if((bat[in]._cnt_wrk>=10)&&(bat[in]._wrk)) 
			{
			bat[in]._wrk=0;
			beep_init(0x7L,'O');
			
			
			}
		}
	else bat[in]._cnt_wrk=10;	
	}	

else if(bat[in]._Ib<(-IKB))
	{
	if(bat[in]._cnt_wrk)
		{
		bat[in]._cnt_wrk--;
		if((bat[in]._cnt_wrk==0)&&(bat[in]._wrk==0)) 
			{
			bat[in]._wrk=1;
			}

		}
	else bat[in]._cnt_wrk=0;	 
	
	}					












 










                            
if(bat[in]._time_cnt==0)
	{
	bat[in]._zar_cnt+=(signed long)bat[in]._Ib;
	
	if(bat[in]._zar_cnt>=36000L)
		{
		if(BAT_C_REAL[in]==0x5555) tempUS_=BAT_C_NOM[in];
		else tempUS_=BAT_C_REAL[in];
		
		b_zar=lc640_read_int(ADR_EE_BAT_ZAR_CNT[in]);

		if(b_zar<(tempUS_*10))
			{
			bat[in]._zar_cnt-=36000L;

			lc640_write_int(ADR_EE_BAT_ZAR_CNT[in],b_zar+1);
			}
		else 
			{
			bat[in]._zar_cnt=36000L;
			}

		}

	else if(bat[in]._zar_cnt<=-36000L)
		{
		if(BAT_C_REAL[in]==0x5555) tempUS_=BAT_C_NOM[in];
		else tempUS_=BAT_C_REAL[in];
		
		b_zar=lc640_read_int(ADR_EE_BAT_ZAR_CNT[in]);

		if(b_zar)
			{
			bat[in]._zar_cnt+=36000L;

			lc640_write_int(ADR_EE_BAT_ZAR_CNT[in],b_zar-1);
			}
		else 
			{
			bat[in]._zar_cnt=-36000L;
			}

		}















































 	
			
	tempUL=(unsigned long)lc640_read_int(ADR_EE_BAT_ZAR_CNT[in]);
	
	if(BAT_C_REAL[in]==0x5555) tempUL_=(unsigned long)BAT_C_NOM[in];
	else tempUL_=(unsigned long)BAT_C_REAL[in];
		           	
	tempUL*=1000L;


	if(tempUL_==0) tempUL=0;
	else tempUL/=tempUL_;

	tempUL/=100L;

	bat[in]._zar=(unsigned short)tempUL;
	
	
     }
     
if(bat[in]._wrk==1)
	{
	if(bat[in]._Iintegr<36000)
		{          
		bat[in]._Iintegr+=abs(bat[in]._Ib);
		if(bat[in]._Iintegr>=36000)
			{
			bat[in]._Iintegr=0;
			bat[in]._Iintegr_++;
			}
		}
	else 
		{
		bat[in]._Iintegr=0;
		}	
	}     

if((bat[in]._Tb>TBATSIGN)&&(!bat[in]._nd))	
	{
	bat[in]._sign_temper_cnt++;
	}
else 
	{
	bat[in]._sign_temper_cnt--;
	}

gran(&bat[in]._sign_temper_cnt,0,600);
if(bat[in]._sign_temper_cnt>=590)	bat[in]._temper_stat|=(1<<0);
if(bat[in]._sign_temper_cnt<=10)	bat[in]._temper_stat&=~(1<<0);


if((bat[in]._Tb>TBATMAX)&&(!bat[in]._nd))	
	{
	bat[in]._max_temper_cnt++;
	}
else 
	{
	bat[in]._max_temper_cnt--;
	}

gran(&bat[in]._max_temper_cnt,0,600);
if(bat[in]._max_temper_cnt>=590)	bat[in]._temper_stat|=(1<<1);
if(bat[in]._max_temper_cnt<=10)	bat[in]._temper_stat&=~(1<<1);
}






	







void u_necc_hndl(void)
{
signed long temp_SL;

static unsigned char unh_cnt0,unh_cnt1 ,b1Hz_unh ;
signed short t[2];
char i;




if(unh_cnt0<10)
	{
	unh_cnt0++;
	if(unh_cnt0>=10)
		{
		unh_cnt0=0;
		b1Hz_unh=1;
		}
	}

if(unh_cnt1<5)
	{
	unh_cnt1++;
	if(unh_cnt1==5)
		{
		unh_cnt1=0;

		}
	} 



if(mess_find_unvol(190))
	{		
	if(mess_data[0]==191)
		{
		u_necc=mess_data[1];
		}		
	}


else if(b1Hz_unh)
	{
	
	if((BAT_IS_ON[0]!=bisON) && (BAT_IS_ON[1]!=bisON))
		{
		u_necc=U0B;
		}
	else 
		{
		for(i=0;i<2;i++)
			{
			if(BAT_IS_ON[i]==bisON)
				{
				if(bat[1]._nd)t[i]=20;
				else t[i]=bat[i]._Tb;
				}
			else
				{
				t[i]=-20;
				}
			}
		if(t[0]>t[1])mat_temper=t[0];
		else mat_temper=t[1];
		
	
		if(mat_temper<0)temp_SL=UB0; 
		else 
			{
			if(mat_temper>40)mat_temper=40; 
			temp_SL=(UB20-UB0)*10;
			temp_SL*=mat_temper;
			temp_SL/=200;
			temp_SL+=UB0;
			}
		if(spc_stat==spcVZ)
			{
			temp_SL*=KVZ;
			temp_SL/=1000U;
			}
		u_necc=(unsigned int)temp_SL;
		}  
	}






gran(&u_necc,400,UMAX);
}



void num_necc_hndl(void)
{
char num_necc_up,num_necc_down;
static short num_necc_block_cnt;
if(num_necc_block_cnt) num_necc_block_cnt--;

Isumm_=Isumm;

if(bat[0]._Ib<0) Isumm_+=(abs(bat[0]._Ib))/10;
if(bat[1]._Ib<0) Isumm_+=(abs(bat[1]._Ib))/10;

num_necc_up=(Isumm_/((signed short)IMAX))+1;

Isumm_+=(signed short)((IMAX*(10-KIMAX))/10);

num_necc_down=(Isumm_/((signed short)IMAX))+1;

if(num_necc_up>num_necc)
	{
	num_necc=num_necc_up;
	num_necc_block_cnt=60;
	}
else if(num_necc_down<num_necc)
	{
	if(!num_necc_block_cnt)
		{
		num_necc=num_necc_down;
		num_necc_block_cnt=60;
		}
	}

if(PAR) num_necc=NUMIST;

gran(&num_necc,1,NUMIST);

}


void cntrl_hndl(void)
{
static char	ch_cnt0,b1Hz_ch;
static unsigned short IZMAX_;

IZMAX_=IZMAX;

if((bat[0]._temper_stat&0x03)||(bat[1]._temper_stat&0x03))IZMAX_=IZMAX/10;


if(ch_cnt0<10)
	{
	ch_cnt0++;
	if(ch_cnt0>=10)
		{
		ch_cnt0=0;
		b1Hz_ch=1;
		}
	}









 




  




 























  





















 






if(mess_find_unvol(225))
	{
	if(mess_data[0]==100)
		{
		cntrl_stat=cntrl_stat_old+mess_data[1];
		}
	else if(mess_data[0]==105)
		{
		cntrl_stat=cntrl_stat_old-mess_data[1];
		}
	else if(mess_data[0]==110)
		{
		cntrl_stat--;

		if((cntrl_stat<=30)||(load_U<USIGN)) mess_send(230,231,0,10);

		}
	else if(mess_data[0]==229)
		{
		cntrl_stat=mess_data[1];
		}

	else if(mess_data[0]==230)
		{
		if(load_U>u_necc)
			{
			if(((load_U-u_necc)>10)&&(cntrl_stat>0))cntrl_stat-=5;
			else if((cntrl_stat)&&b1Hz_ch)cntrl_stat--;
			}
		else if(load_U<u_necc)
			{	
			if(((u_necc-load_U)>10)&&(cntrl_stat<1015))cntrl_stat+=5;
			else	if((cntrl_stat<1020)&&b1Hz_ch)cntrl_stat++;
			}	
		 }

	}

else if(b1Hz_ch)
	{
	cntrl_stat_new=cntrl_stat_old;
	
	if((Ibmax/10)>(2*IZMAX_))
		{
		cntrl_stat_new-=50;
		}		
	else if(((Ibmax/10)<(IZMAX_*2))&&(Ibmax>(IZMAX_*11)))
		{
		cntrl_stat_new-=5;
		}   
	else if((Ibmax<(IZMAX_*11))&&((Ibmax/10)>IZMAX_))
		{
		cntrl_stat_new--;
		}
		
	else if(load_U<u_necc)
		{
		if(load_U<(u_necc-(UB0-UB20)))
			{
			if(Ibmax<0)
				{
				cntrl_stat_new+=50;
				}
			else if(Ibmax<(IZMAX_*5))
				{
				cntrl_stat_new+=5;
				}
			else if(Ibmax<((IZMAX_*95)/10))
				{
				cntrl_stat_new++;
				}					
			}
		else if(load_U<(u_necc-((UB0-UB20)/4)))
			{
			if(Ibmax<(IZMAX_*5))
				{
				cntrl_stat_new+=5;
				}
			else if(Ibmax<((IZMAX_*95)/10))
				{
				cntrl_stat_new++;
				}					
			}	
		else if(load_U<(u_necc-1))
			{
			if(Ibmax<((IZMAX_*95)/10))
				{
				cntrl_stat_new++;
				}					
			}					
		}	
	else if((load_U>u_necc) )
		{
		if(load_U>(u_necc+(UB0-UB20)))
			{
			cntrl_stat_new-=30;
			}
		else if(load_U>(u_necc+((UB0-UB20)/4)))
			{
			cntrl_stat_new-=5;
			}	
		else if(load_U>(u_necc+1))
			{
			cntrl_stat_new--;
			}					
		}
	gran(&cntrl_stat_new,10,1010);			
	cntrl_stat_old=cntrl_stat_new;
	cntrl_stat=cntrl_stat_new;	
	}

	
gran(&cntrl_stat,10,1010); 
b1Hz_ch=0;
}












































  
		


























 

 


































 



