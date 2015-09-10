#line 1 "gran.c"
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





#line 2 "gran.c"
#line 1 "gran.h"

void gran_ring_char(signed char *adr, signed char min, signed char max) ;
void gran_char(signed char *adr, signed char min, signed char max);
void gran(signed short *adr, signed short min, signed short max);
void gran_ring(signed short *adr, signed short min, signed short max);
void gran_long(signed long *adr, signed long min, signed long max); 
#line 3 "gran.c"


void gran_ring_char(signed char *adr, signed char min, signed char max)
{
if (*adr<min) *adr=max;
if (*adr>max) *adr=min; 
} 
 

void gran_char(signed char *adr, signed char min, signed char max)
{
if (*adr<min) *adr=min;
if (*adr>max) *adr=max; 
} 


void gran(signed short *adr, signed short min, signed short max)
{
if (*adr<min) *adr=min;
if (*adr>max) *adr=max; 
} 


void gran_ring(signed short *adr, signed short min, signed short max)
{
if (*adr<min) *adr=max;
if (*adr>max) *adr=min; 
} 


void gran_long(signed long *adr, signed long min, signed long max)
{
if (*adr<min) *adr=max;
if (*adr>max) *adr=min; 
} 
