#line 1 "mess.c"
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





#line 2 "mess.c"
#line 1 "mess.h"










		





void mess_hndl(void);
void mess_send(char _mess, short par0, short par1, char _time);
char mess_find(char _mess);
char mess_find_unvol(char _mess);

#line 3 "mess.c"


char mess[10],mess_old[10],mess_cnt[10];
int mess_par0[10],mess_par1[10],mess_data[2];



void mess_hndl(void)
{
char i;
for(i=0;i<10;i++)
	{
	if((mess[i])&&(mess[i]==mess_old[i])&&(mess_cnt[i]))
		{
		mess_cnt[i]--;
		if(!mess_cnt[i])mess[i]=0;
		
		}
	mess_old[i]=mess[i];
	} 
}


void mess_send(char _mess, short par0, short par1, char _time)
{
char i;
i=0;

do
	{
	i++;
	}
while((mess[i])&&(mess[i]!=_mess)&&(i<10));

mess[i]=_mess;  
mess_par0[i]=par0;
mess_par1[i]=par1;
mess_cnt[i]=_time; 
 
}


char mess_find(char _mess)
{
char i;
i=0;

do
	{
	i++;
	}
while((mess[i]!=_mess)&&(i<10));

if(mess[i]==_mess)
	{ 
	mess_data[0]=mess_par0[i];  
	mess_data[1]=mess_par1[i];
	mess[i]=0;
	mess_cnt[i]=0;
	return 1; 
	}
else return 0; 
 
}


char mess_find_unvol(char _mess)
{
char i;
i=0;

do
	{
	i++;
	}
while((mess[i]!=_mess)&&(i<10));

if(mess[i]==_mess)
	{ 
	mess_data[0]=mess_par0[i];  
	mess_data[1]=mess_par1[i];
	return 1; 
	}
else return 0; 
 
}
