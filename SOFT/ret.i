#line 1 "ret.c"
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





#line 2 "ret.c"
#line 1 "ret.h"




void ret_ind(char r_i,char r_s,int r_c);
void ret_ind_hndl(void);
void ret_ind_sec(char r_i,int r_c);
void ret_ind_sec_hndl(void);
void ret(short duty);
void ret_hndl(void);








 

     
#line 3 "ret.c"
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

#line 4 "ret.c"

char retind,retsub,retindsec;
int retcnt,retcntsec;
unsigned char f0,fc0,f1,fc1;
short ret_duty;

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








void ret_ind(char r_i,char r_s,int r_c)
{
retcnt=r_c;
retind=r_i;
retsub=r_s;
}    


void ret_ind_hndl(void)
{
if(retcnt)
	{
	if((--retcnt)==0)
		{
 		aa . i=retind;
   		aa . s_i=retsub;
   		aa . i_s=aa . s_i;
   		f0=0;
   		fc0=0;
   		f1=0;
   		fc1=0;
	 	}
     }
}  


 

void ret_ind_sec(char r_i,int r_c)
{
retcntsec=r_c;
retindsec=r_i;
}


void ret_ind_sec_hndl(void)
{
if(retcntsec)
 	{
	if((--retcntsec)==0)
	 	{
 		aa . i=retindsec;
 		aa . s_i=0;
  		f0=0;
   		fc0=0;
   		f1=0;
   		fc1=0; 		
	 	}
   	}		
}


void ret(short duty)
{
ret_duty=duty;
}


void ret_hndl(void)
{
if(ret_duty)
     {
     ret_duty--;
     if(!ret_duty)
          {
          tree_down(0,0);
          }
     }
}


    
 
       

