#line 1 "common_func.c"
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





#line 2 "common_func.c"
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

#line 3 "common_func.c"
#line 1 "ret.h"




void ret_ind(char r_i,char r_s,int r_c);
void ret_ind_hndl(void);
void ret_ind_sec(char r_i,int r_c);
void ret_ind_sec_hndl(void);
void ret(short duty);
void ret_hndl(void);








 

     
#line 4 "common_func.c"
#line 1 "eeprom_map.h"






#line 18 "eeprom_map.h"



#line 66 "eeprom_map.h"



#line 83 "eeprom_map.h"



#line 95 "eeprom_map.h"


#line 106 "eeprom_map.h"




#line 157 "eeprom_map.h"

#line 172 "eeprom_map.h"










































































































 







#line 5 "common_func.c"
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

#line 6 "common_func.c"
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

#line 7 "common_func.c"

extern char lcd_buffer[200];
extern char dig[5];
extern char zero_on;
extern const char ABCDEF[];

extern char ptr_ind;

const char sm_mont[12][4]={"янв","фев","мар","апр","май","июн","июл","авг","сен","окт","ноя","дек"}; 


extern signed char sec_bcd,sec__;
extern signed char min_bcd,min__;
extern signed char hour_bcd,hour__;
extern signed char day_bcd,day__;
extern signed char month_bcd,month__;
extern signed char year_bcd,year__;



signed short abs(signed short in)
{
if(in<0)in=-in;
return in;
}


void clr_scrn(void)
{
char i;
for (i=0;i<200;i++)
	{
	lcd_buffer[i]=' ';
	}
}


char find(char xy)
{
char i=0;
do i++;
while ((lcd_buffer[i]!=xy)&&(i<200));

return i;
}



void bin2bcd_int(unsigned int in)
{

char i=5;
for(i=0;i<5;i++)
	{
	dig[i]=in%10;
	in/=10;
	}   
}

void bcd2lcd_zero(char sig)
{
char i;
zero_on=1;
for (i=5;i>0;i--)
	{
	if(zero_on&&(!dig[i-1])&&(i>sig))
		{
		dig[i-1]=0x20;
		}
	else
		{
		dig[i-1]=dig[i-1]+0x30;
		zero_on=0;
		}	
	}
}             


void int2lcd_m(signed short in,char xy,char des)
{
char i;
char n;
char bMinus;
bMinus=0;
if(in<0)
	{
	bMinus=1;
	in=(~in+1);
	}
bin2bcd_int(in);
bcd2lcd_zero(des+1);
i=find(xy);
if(i!=255)
	{
	for (n=0;n<5;n++)
		{ 
		if(n<des)
			{
			lcd_buffer[i]=dig[n];
			} 
		else if (n==des)
   			{
   			lcd_buffer[i]='.';
   			lcd_buffer[i-1]=dig[n];
   			} 	  
		else if((n>=des)&&(dig[n]!=0x20))
			{
			if(!des)lcd_buffer[i]=dig[n];	
			else lcd_buffer[i-1]=dig[n];
   			}
   		else if((n>=des)&&(dig[n]!=0x20)&&(bMinus))
	   		{
			if(!des)lcd_buffer[i]='-';	
			else lcd_buffer[i-1]='-';
			n=5;
   			}	   
		i--;	
		}
	}
}


void int2lcd_mm(signed short in,char xy,char des)
{
char i;
char n;
char minus='+';
if(in<0)
	{
	in=-in;
	minus='-';
	}
minus='-';	
bin2bcd_int(in);
bcd2lcd_zero(des+1);
i=find(xy);
for (n=0;n<5;n++)
	{
   	if(!des&&(dig[n]!=' '))
   		{
   		if((dig[n+1]==' ')&&(minus=='-'))lcd_buffer[i-1]='-';
   		lcd_buffer[i]=dig[n];	 
   		}
   	else 
   		{
   		if(n<des)lcd_buffer[i]=dig[n];
   		else if (n==des)
   			{
   			lcd_buffer[i]='.';
   			lcd_buffer[i-1]=dig[n];
   			} 
   		else if ((n>des)&&(dig[n]!=' ')) lcd_buffer[i-1]=dig[n]; 
   		else if ((minus=='-')&&(n>des)&&(dig[n]!=' ')&&(dig[n+1]==' ')) lcd_buffer[i]='-';  		
   		}  
		
	i--;	
	}
}


void int2lcd_mmm(signed short in,char xy,char des)
{
signed char i;
char n;
char s[10];
char minus='+';
char zero_on;
char simb_num;

if(in<0)
	{
	in=-in;
	minus='-';
	}

for(i=0;i<10;i++)
	{
	s[i]=in%10;
	in/=10;
	}   

zero_on=1;
simb_num=0;

for (i=9;i>=0;i--)
	{
	if(zero_on&&(!s[i])&&(i>(des)))
	     {
	     s[i]=0x20;
	     }
	else 
	     {
	     s[i]=s[i]+0x30;
	     zero_on=0;
	     simb_num++;
	     }
	 }
	          
if(minus=='-')	
     {
     s[simb_num++]=minus; 
     }    
if(des)
     {
     for(i=simb_num;i>des;i--)
          {
          s[i]=s[i-1];
          }
     s[des]='.';
     simb_num++;     
     }
	
n=find(xy);
for (i=0;i<simb_num;i++)
	{
     lcd_buffer[n-i]=s[i];
	}
}


void long2lcd_mmm(signed long in,char xy,char des)
{
signed char i;
char n;
char s[10];
char minus='+';
char zero_on;
char simb_num;

if(in<0)
	{
	in=-in;
	minus='-';
	}

for(i=0;i<10;i++)
	{
	s[i]=in%10;
	in/=10;
	}   

zero_on=1;
simb_num=0;

for (i=9;i>=0;i--)
	{
	if(zero_on&&(!s[i])&&(i>(des)))
	     {
	     s[i]=0x20;
	     }
	else 
	     {
	     s[i]=s[i]+0x30;
	     zero_on=0;
	     simb_num++;
	     }
	 }
	          
if(minus=='-')	
     {
     s[simb_num++]=minus; 
     }    
if(des)
     {
     for(i=simb_num;i>des;i--)
          {
          s[i]=s[i-1];
          }
     s[des]='.';
     simb_num++;     
     }
	
n=find(xy);
for (i=0;i<simb_num;i++)
	{
     lcd_buffer[n-i]=s[i];
	}
}


void long2lcdyx_mmm(signed long in,char y,char x,char des)
{
signed char i;
char n;
char s[10];
char minus='+';
char zero_on;
char simb_num;

if(in<0)
	{
	in=-in;
	minus='-';
	}

for(i=0;i<10;i++)
	{
	s[i]=in%10;
	in/=10;
	}   

zero_on=1;
simb_num=0;

for (i=9;i>=0;i--)
	{
	if(zero_on&&(!s[i])&&(i>(des)))
	     {
	     s[i]=0x20;
	     }
	else 
	     {
	     s[i]=s[i]+0x30;
	     zero_on=0;
	     simb_num++;
	     }
	 }
	          
if(minus=='-')	
     {
     s[simb_num++]=minus; 
     }    
if(des)
     {
     for(i=simb_num;i>des;i--)
          {
          s[i]=s[i-1];
          }
     s[des]='.';
     simb_num++;     
     }
	
n=(20*y)+x;
for (i=0;i<simb_num;i++)
	{
     lcd_buffer[n-i]=s[i];
	}



}


void int2lcdyx(unsigned short in,char y,char x,char des)
{
char i;
char n;
bin2bcd_int(in);
bcd2lcd_zero(des+1);
i=(y*20)+x;
for (n=0;n<5;n++)
	{ 
	if(n<des)
		{
		lcd_buffer[i]=dig[n];
		}   
	if((n>=des)&&(dig[n]!=0x20))
		{
		if(!des)lcd_buffer[i]=dig[n];	
		else lcd_buffer[i-1]=dig[n];
   		}   
	i--;	
	}
}



void event2ind(char num, char simbol)
{
char iii;
char dt[4],dt_[4],dt__[4];
unsigned int tempii;    
		
tempii=lc640_read_int(1024+1024+512+1024);
tempii=ptr_carry(tempii,64,-1*((signed)num));
tempii*=32;
tempii+=1024;
     
lc640_read_long_ptr(tempii,dt);
lc640_read_long_ptr(tempii+8,dt_);
lc640_read_long_ptr(tempii+12,dt__);

iii=find(simbol);
     
if(dt[0]=='U')
    	{ 
    	if(dt[2]=='R')
    		{
    		lcd_buffer[iii++]='В';
    		lcd_buffer[iii++]='к';
    		lcd_buffer[iii++]='л';
    		}
    	
	lcd_buffer[iii++]=' ';
	lcd_buffer[iii++]=' ';     		
   	lcd_buffer[iii++]=' ';
   	lcd_buffer[iii++]=' ';

    	if((dt_[0]==year__)&&(dt_[1]==month__)&&(dt_[2]==day__))
    		{
    	    	lcd_buffer[iii++]='0';
     	lcd_buffer[iii++]='!';
     	lcd_buffer[iii++]=':'; 
     	lcd_buffer[iii++]='0';
     	lcd_buffer[iii++]='@';
     	lcd_buffer[iii++]=':';
     	lcd_buffer[iii++]='0';
     	lcd_buffer[iii++]='#';
     	int2lcd(dt__[0],'!',0);
     	int2lcd(dt__[1],'@',0);
     	int2lcd(dt__[2],'#',0);    		     		
     	}	                   
	else      	
          {
 		lcd_buffer[iii++]=' ';
     	lcd_buffer[iii++]='0';
     	lcd_buffer[iii++]='!';
     	lcd_buffer[iii++]='@'; 
     	lcd_buffer[iii++]=' ';
     	lcd_buffer[iii++]=' ';
     	lcd_buffer[iii++]='0';
     	lcd_buffer[iii++]='#';
     	int2lcd(dt_[2],'!',0);
     	int2lcd(dt_[0],'#',0);   
     	if(!((dt_[1]>=1)&&(dt_[1]<=12)))dt_[1]=1;
		sub_bgnd(sm_mont[dt_[1]-1],'@',0);  
  		}	   
     }   
     
else if(dt[0]=='P')
	{
     lcd_buffer[iii++]='П';
     lcd_buffer[iii++]='С';
    	lcd_buffer[iii++]=' ';
     lcd_buffer[iii++]=' ';     		
     lcd_buffer[iii++]=' ';
     lcd_buffer[iii++]=' ';
     lcd_buffer[iii++]=' ';
     	
     if((dt_[0]==year__)&&(dt_[1]==month__)&&(dt_[2]==day__))
     	{
         	lcd_buffer[iii++]='0';
     	lcd_buffer[iii++]='!';
    	    	lcd_buffer[iii++]=':'; 
    		lcd_buffer[iii++]='0';
    		lcd_buffer[iii++]='@';
     	lcd_buffer[iii++]=':';
     	lcd_buffer[iii++]='0';
     	lcd_buffer[iii++]='#';
         	int2lcd(dt__[0],'!',0);
     	int2lcd(dt__[1],'@',0);
     	int2lcd(dt__[2],'#',0);    		     		
     	}	                   
    	else      	
     	{
      	lcd_buffer[iii++]=' ';
     	lcd_buffer[iii++]='0';
     	lcd_buffer[iii++]='!';
     	lcd_buffer[iii++]='@'; 
      	lcd_buffer[iii++]=' ';
      	lcd_buffer[iii++]=' ';
      	lcd_buffer[iii++]='0';
      	lcd_buffer[iii++]='#';
      	int2lcd(dt_[2],'!',0);
     	int2lcd(dt_[0],'#',0);   
      	if(!((dt_[1]>=1)&&(dt_[1]<=12)))dt_[1]=1;
	 	sub_bgnd(sm_mont[dt_[1]-1],'@',0);  
  		}     	
     }   

else if(dt[0]=='B')
    	{
    	if(dt[2]=='C')
    		{
    		lcd_buffer[iii++]='Б';
    		lcd_buffer[iii++]='а';
    		lcd_buffer[iii++]='т';
		if(dt[1]<9)
    			{
    			lcd_buffer[iii++]=0x31+dt[1];
    			lcd_buffer[iii++]='А';
    			lcd_buffer[iii++]=' ';
    			}
    		else if((dt[1]>=9)&&(dt[1]<99))
    			{
    			lcd_buffer[iii++]=0x30+((dt[1]+1)/10);
    			lcd_buffer[iii++]=0x30+((dt[1]+1)%10);
    			lcd_buffer[iii++]='А';
    			}
    		else 
    			{
    			lcd_buffer[iii++]=' ';
    			lcd_buffer[iii++]=' '; 
    			lcd_buffer[iii++]=' ';    		
    			} 
    		lcd_buffer[iii++]=' ';
     	
    		if((dt_[0]==year__)&&(dt_[1]==month__)&&(dt_[2]==day__))
    			{
    		    	lcd_buffer[iii++]='0';
   	 		lcd_buffer[iii++]='!';
    		    	lcd_buffer[iii++]=':'; 
    			lcd_buffer[iii++]='0';
    			lcd_buffer[iii++]='@';
   	 		lcd_buffer[iii++]=':';
   	 		lcd_buffer[iii++]='0';
   	 		lcd_buffer[iii++]='#';
   	 	    	int2lcd(dt__[0],'!',0);
   	 		int2lcd(dt__[1],'@',0);
   	 		int2lcd(dt__[2],'#',0);    		     		
    			}	                   
    		else      	
    			{
    	 		lcd_buffer[iii++]=' ';
    			lcd_buffer[iii++]='0';
    			lcd_buffer[iii++]='!';
    	    		lcd_buffer[iii++]='@'; 
    			lcd_buffer[iii++]=' ';
    			lcd_buffer[iii++]=' ';
    			lcd_buffer[iii++]='0';
    			lcd_buffer[iii++]='#';
    			int2lcd(dt_[2],'!',0);
    			int2lcd(dt_[0],'#',0);   
    	    		if(!((dt_[1]>=1)&&(dt_[1]<=12)))dt_[1]=1;
			sub_bgnd(sm_mont[dt_[1]-1],'@',0);  
    			}
    		}
    	if(dt[2]=='Z')
    		{
    		lcd_buffer[iii++]='В';
    		lcd_buffer[iii++]='З';
    		lcd_buffer[iii++]=' ';    		
    		lcd_buffer[iii++]=' ';
    		lcd_buffer[iii++]=' ';  
    		lcd_buffer[iii++]=' ';
    		lcd_buffer[iii++]=' ';
    		
    		if((dt_[0]==year__)&&(dt_[1]==month__)&&(dt_[2]==day__))
    			{
    	    		lcd_buffer[iii++]='0';
    			lcd_buffer[iii++]='!';
    	    		lcd_buffer[iii++]=':'; 
    			lcd_buffer[iii++]='0';
    			lcd_buffer[iii++]='@';
    			lcd_buffer[iii++]=':';
    			lcd_buffer[iii++]='0';
    			lcd_buffer[iii++]='#';
    	    		int2lcd(dt__[0],'!',0);
    			int2lcd(dt__[1],'@',0);
    			int2lcd(dt__[2],'#',0);    		     		
    			}	                   
 		else      	
    			{
    	 		lcd_buffer[iii++]=' ';
    			lcd_buffer[iii++]='0';
    			lcd_buffer[iii++]='!';
    			lcd_buffer[iii++]='@'; 
    			lcd_buffer[iii++]=' ';
    			lcd_buffer[iii++]=' ';
    			lcd_buffer[iii++]='0';
    			lcd_buffer[iii++]='#';
    			int2lcd(dt_[2],'!',0);
    			
    			int2lcd(dt_[0],'#',0);   
    			if(!((dt_[1]>=1)&&(dt_[1]<=12)))dt_[1]=1;
			sub_bgnd(sm_mont[dt_[1]-1],'@',0);  
    			}  		
    		}    		

    	if(dt[2]=='W')
    		{
    		lcd_buffer[iii++]='Б';
    		lcd_buffer[iii++]='а';
    		lcd_buffer[iii++]='т';
		if(dt[1]<9)
    			{
    			lcd_buffer[iii++]=0x31+dt[1];
    			lcd_buffer[iii++]='р';
    			lcd_buffer[iii++]=' ';
    			}
    		else if((dt[1]>=9)&&(dt[1]<99))
    			{
    			lcd_buffer[iii++]=0x30+((dt[1]+1)/10);
    			lcd_buffer[iii++]=0x30+((dt[1]+1)%10);
    			lcd_buffer[iii++]='р';
    			}
    		else 
    			{
    			lcd_buffer[iii++]=' ';
    			lcd_buffer[iii++]=' '; 
    			lcd_buffer[iii++]=' ';    		
    			} 
    		lcd_buffer[iii++]=' ';    		
    		
    		
 
















  		
    		if((dt_[0]==year__)&&(dt_[1]==month__)&&(dt_[2]==day__))
    			{
    	    		lcd_buffer[iii++]='0';
    			lcd_buffer[iii++]='!';
    	    		lcd_buffer[iii++]=':'; 
    			lcd_buffer[iii++]='0';
    			lcd_buffer[iii++]='@';
    			lcd_buffer[iii++]=':';
    			lcd_buffer[iii++]='0';
    			lcd_buffer[iii++]='#';
    	    		int2lcd(dt__[0],'!',0);
    			int2lcd(dt__[1],'@',0);
    			int2lcd(dt__[2],'#',0);    		     		
    			}	                   
 		else      	
    			{
    	 		lcd_buffer[iii++]=' ';
    			lcd_buffer[iii++]='0';
    			lcd_buffer[iii++]='!';
    			lcd_buffer[iii++]='@'; 
    			lcd_buffer[iii++]=' ';
    			lcd_buffer[iii++]=' ';
    			lcd_buffer[iii++]='0';
    			lcd_buffer[iii++]='#';
    			int2lcd(dt_[2],'!',0);
    			
    			int2lcd(dt_[0],'#',0);   
    			if(!((dt_[1]>=1)&&(dt_[1]<=12)))dt_[1]=1;
			sub_bgnd(sm_mont[dt_[1]-1],'@',0);  
    			}  		
    		}    		
 
 	if(dt[2]=='K')
    		{
    		lcd_buffer[iii++]='Б';
    		lcd_buffer[iii++]='а';
    		lcd_buffer[iii++]='т';
		if(dt[1]<9)
    			{
    			lcd_buffer[iii++]=0x31+dt[1];
    			lcd_buffer[iii++]='к';
    			lcd_buffer[iii++]='е';
    			}
    		else if((dt[1]>=9)&&(dt[1]<99))
    			{
    			lcd_buffer[iii++]=0x30+((dt[1]+1)/10);
    			lcd_buffer[iii++]=0x30+((dt[1]+1)%10);
    			lcd_buffer[iii++]='к';
    			}
    		else 
    			{
    			lcd_buffer[iii++]=' ';
    			lcd_buffer[iii++]=' '; 
    			lcd_buffer[iii++]=' ';    		
    			} 
    		lcd_buffer[iii++]=' ';    		
    		
    		if((dt_[0]==year__)&&(dt_[1]==month__)&&(dt_[2]==day__))
    			{
    	    		lcd_buffer[iii++]='0';
    			lcd_buffer[iii++]='!';
    	    		lcd_buffer[iii++]=':'; 
    			lcd_buffer[iii++]='0';
    			lcd_buffer[iii++]='@';
    			lcd_buffer[iii++]=':';
    			lcd_buffer[iii++]='0';
    			lcd_buffer[iii++]='#';
    	    		int2lcd(dt__[0],'!',0);
    			int2lcd(dt__[1],'@',0);
    			int2lcd(dt__[2],'#',0);    		     		
    			}	                   
 		else      	
    			{
    	 		lcd_buffer[iii++]=' ';
    			lcd_buffer[iii++]='0';
    			lcd_buffer[iii++]='!';
    			lcd_buffer[iii++]='@'; 
    			lcd_buffer[iii++]=' ';
    			lcd_buffer[iii++]=' ';
    			lcd_buffer[iii++]='0';
    			lcd_buffer[iii++]='#';
    			int2lcd(dt_[2],'!',0);
    			
    			int2lcd(dt_[0],'#',0);   
    			if(!((dt_[1]>=1)&&(dt_[1]<=12)))dt_[1]=1;
			sub_bgnd(sm_mont[dt_[1]-1],'@',0);  
    			}  		
    		}    		

    		     	     	
    	}     	    
     	
else if(dt[0]=='S')
    	{
    	lcd_buffer[iii++]='Б';
    	lcd_buffer[iii++]='П';
    	lcd_buffer[iii++]='С';
 	if(dt[1]<9)
    		{
    		lcd_buffer[iii++]=0x31+dt[1];
    		lcd_buffer[iii++]=' ';
    		}
    	else if((dt[1]>=9)&&(dt[1]<99))
    		{
    		lcd_buffer[iii++]=0x30+((dt[1]+1)/10);
    		lcd_buffer[iii++]=0x30+((dt[1]+1)%10);
    		}
    	else 
    		{
    		lcd_buffer[iii++]=' ';
    		lcd_buffer[iii++]=' ';     		
    		} 
    	lcd_buffer[iii++]=' '; 
    	lcd_buffer[iii++]=' ';
    	
    	if((dt_[0]==year__)&&(dt_[1]==month__)&&(dt_[2]==day__))
    		{
    	    	lcd_buffer[iii++]='0';
    		lcd_buffer[iii++]='!';
    	    	lcd_buffer[iii++]=':'; 
    		lcd_buffer[iii++]='0';
    		lcd_buffer[iii++]='@';
    		lcd_buffer[iii++]=':';
    		lcd_buffer[iii++]='0';
    		lcd_buffer[iii++]='#';
    	    	int2lcd(dt__[0],'!',0);
    		int2lcd(dt__[1],'@',0);
    		int2lcd(dt__[2],'#',0);    		     		
    		}	                   
 	else      	
    		{
    	 	lcd_buffer[iii++]=' ';
    		lcd_buffer[iii++]='0';
    		lcd_buffer[iii++]='!';
    		lcd_buffer[iii++]='@'; 
    		lcd_buffer[iii++]=' ';
    		lcd_buffer[iii++]=' ';
    		lcd_buffer[iii++]='0';
    		lcd_buffer[iii++]='#';
    		int2lcd(dt_[2],'!',0);
    		int2lcd(dt_[0],'#',0);   
    		if(!((dt_[1]>=1)&&(dt_[1]<=12)))dt_[1]=1;
		sub_bgnd(sm_mont[dt_[1]-1],'@',0);  
		}    	
    	}
     	
else if(dt[0]=='B')
    	{
    	lcd_buffer[iii++]='Б';
    	lcd_buffer[iii++]='а';
    	lcd_buffer[iii++]='т';
 	if(dt[1]<9)
    		{
    		lcd_buffer[iii++]=0x31+dt[1];
    		lcd_buffer[iii++]=' ';
    		}
    	else if((dt[1]>=9)&&(dt[1]<99))
    		{
    		lcd_buffer[iii++]=0x30+((dt[1]+1)/10);
    		lcd_buffer[iii++]=0x30+((dt[1]+1)%10);
    		}
    	else 
    		{
    		lcd_buffer[iii++]=' ';
    		lcd_buffer[iii++]=' ';     		
    		} 
    	lcd_buffer[iii++]=' ';
    	}     	    
     	
else if(dt[0]=='I')
    	{
    	lcd_buffer[iii++]='И';
    	lcd_buffer[iii++]='н';
    	lcd_buffer[iii++]='в';
	if(dt[1]<9)
    		{
    		lcd_buffer[iii++]=0x31+dt[1];
    		lcd_buffer[iii++]=' ';
    		}
    	else if((dt[1]>=9)&&(dt[1]<99))
    		{
    		lcd_buffer[iii++]=0x30+((dt[1]+1)/10);
    		lcd_buffer[iii++]=0x30+((dt[1]+1)%10);
    		}
    	else 
    		{
    		lcd_buffer[iii++]=' ';
    		lcd_buffer[iii++]=' ';     		
    		} 
    	lcd_buffer[iii++]=' ';
    	}    
}	



void int2lcd(unsigned short in,char xy,char des)
{
char i;
char n;

bin2bcd_int(in);
bcd2lcd_zero(des+1);
i=find(xy);
for (n=0;n<5;n++)
	{
   	if(!des&&(dig[n]!=' '))
   		{
   		lcd_buffer[i]=dig[n];	 
   		}
   	else 
   		{
   		if(n<des)lcd_buffer[i]=dig[n];
   		else if (n==des)
   			{
   			lcd_buffer[i]='.';
   			lcd_buffer[i-1]=dig[n];
   			} 
   		else if ((n>des)&&(dig[n]!=' ')) lcd_buffer[i-1]=dig[n];   		
   		}  
		
	i--;	
	}
}


void long2lcdhyx(unsigned long in,char y,char x)
{
char i;
char n;

i=(20*y)+x;

n=*((char*)&in);
lcd_buffer[i]=ABCDEF[n%16];
i--;
lcd_buffer[i]=ABCDEF[n/16];
i--;

n=*(((char*)&in)+1);
lcd_buffer[i]=ABCDEF[n%16];
i--;
lcd_buffer[i]=ABCDEF[n/16];
i--;

n=*(((char*)&in)+2);
lcd_buffer[i]=ABCDEF[n%16];
i--;
lcd_buffer[i]=ABCDEF[n/16];
i--;

n=*(((char*)&in)+3);
lcd_buffer[i]=ABCDEF[n%16];
i--;
lcd_buffer[i]=ABCDEF[n/16];
i--;
}


void char2lcdh(char in,char yx)
{
char i;

i=find(yx);

lcd_buffer[i]=ABCDEF[in%16];
i--;
lcd_buffer[i]=ABCDEF[in/16];
i--;
}


void char2lcdhyx(char in,char y,char x)
{
char i;

i=(20*y)+x;

lcd_buffer[i]=ABCDEF[in%16];
i--;
lcd_buffer[i]=ABCDEF[in/16];
i--;
}


void int2lcdhyx(unsigned short in,char y,char x)
{
char i;

i=(20*y)+x;

lcd_buffer[i]=ABCDEF[in%16];
i--;
in/=16;
lcd_buffer[i]=ABCDEF[in%16];
i--;
in/=16;
lcd_buffer[i]=ABCDEF[in%16];
i--;
in/=16;
lcd_buffer[i]=ABCDEF[in];

}


void char2lcdbyx(char in,char y,char x)
{
char i;

i=(20*y)+x;

lcd_buffer[i--]=ABCDEF[in%2];
in/=2;
lcd_buffer[i--]=ABCDEF[in%2];
in/=2;
lcd_buffer[i--]=ABCDEF[in%2];
in/=2;
lcd_buffer[i--]=ABCDEF[in%2];
in/=2;
lcd_buffer[i--]=ABCDEF[in%2];
in/=2;
lcd_buffer[i--]=ABCDEF[in%2];
in/=2;
lcd_buffer[i--]=ABCDEF[in%2];
in/=2;
lcd_buffer[i--]=ABCDEF[in%2];
in/=2;
}


void pointer_set(char num_of_first_row)
{
if(aa . s_i==aa . i_s)lcd_buffer[num_of_first_row*20]=1;
else if(aa . s_i==(aa . i_s+1))lcd_buffer[(num_of_first_row+1)*20]=1;
else if(aa . s_i==(aa . i_s+2))lcd_buffer[(num_of_first_row+2)*20]=1;
else if(aa . s_i==(aa . i_s+3))lcd_buffer[(num_of_first_row+3)*20]=1;
else if(aa . s_i==(aa . i_s+4))lcd_buffer[(num_of_first_row+4)*20]=1;
else if(aa . s_i==(aa . i_s+5))lcd_buffer[(num_of_first_row+5)*20]=1;
else if(aa . s_i==(aa . i_s+6))lcd_buffer[(num_of_first_row+6)*20]=1;
else if(aa . s_i==(aa . i_s+7))lcd_buffer[(num_of_first_row+7)*20]=1;
}



void tree_down(signed char offset_ind,signed char offset_sub_ind)
{
ptr_ind--;
ptr_ind+=offset_ind;
aa=b[ptr_ind];

aa . s_i+=offset_sub_ind;
}


void tree_up(char tind, char tsub_ind, char tindex_set, char tsub_ind1)
{
b[ptr_ind++]=aa;
aa . i=tind;
aa . s_i=tsub_ind;
aa . i_s=tindex_set;
aa . s_i1=tsub_ind1;
}


void bgnd_par(char const *ptr0,char const *ptr1,char const *ptr2,char const *ptr3)
{
char i,*ptr_ram;
clr_scrn();

ptr_ram=lcd_buffer;
for(i=0;i<20;i++)
	{
	*ptr_ram++=*ptr0++;
	}
for(i=0;i<20;i++)
	{
	*ptr_ram++=*ptr1++;
	}
for(i=0;i<20;i++)
	{
	*ptr_ram++=*ptr2++;
	}
for(i=0;i<20;i++)
	{
	*ptr_ram++=*ptr3++;
	}


}


void sub_bgnd(char const *adr,char xy,signed char offset)
{
char temp;
temp=find(xy);


if(temp!=255)
while (*adr)
	{
	lcd_buffer[temp+offset]=*adr++;
	temp++;
    	}
}


void show_mess(char* p1, char* p2, char* p3, char* p4,int m_sec)
{
bgnd_par(p1,p2,p3,p4);
tree_up(iSM,aa . s_i,aa . s_i1,aa . s_i2);
ret((char)(m_sec/100));
}


char ptr_carry(signed int in,unsigned char modul,signed int carry)
{
signed int tempSI;
tempSI=in;                                                             
tempSI+=carry;
if(tempSI<0)tempSI+=modul;
else if(tempSI>=modul)tempSI-=modul;

return (char)tempSI;
}


void event_data2ind(char num, char simbol)
{
char iii;
char dt[4],dt_[4],dt__[4];
unsigned int tempii;    
		

 
tempii=(signed)num;
tempii*=32;
tempii+=1024;
     
lc640_read_long_ptr(tempii,dt);
lc640_read_long_ptr(tempii+8,dt_);
lc640_read_long_ptr(tempii+12,dt__);

iii=find(simbol);

lcd_buffer[iii++]=' ';
lcd_buffer[iii++]='0';
lcd_buffer[iii++]='!';
lcd_buffer[iii++]='@'; 
lcd_buffer[iii++]=' ';
lcd_buffer[iii++]=' ';
lcd_buffer[iii++]='0';
lcd_buffer[iii++]='#';
int2lcd(dt_[2],'!',0);
int2lcd(dt_[0],'#',0);   
if(!((dt_[1]>=1)&&(dt_[1]<=12)))dt_[1]=1;
sub_bgnd(sm_mont[dt_[1]-1],'@',0); 
lcd_buffer[iii++]=' ';		
lcd_buffer[iii++]='0';
lcd_buffer[iii++]='!';
lcd_buffer[iii++]=':'; 
lcd_buffer[iii++]='0';
lcd_buffer[iii++]='@';
int2lcd(dt__[0],'!',0);
int2lcd(dt__[1],'@',0);
   		     		
lcd_buffer[iii++]=' ';
}	
