#line 1 "memo.c"
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

#line 2 "memo.c"
#line 1 "memo.h"

void memo_read (void);






#line 3 "memo.c"
#line 1 "eeprom_map.h"






#line 18 "eeprom_map.h"



#line 66 "eeprom_map.h"



#line 83 "eeprom_map.h"



#line 95 "eeprom_map.h"


#line 106 "eeprom_map.h"




#line 157 "eeprom_map.h"

#line 172 "eeprom_map.h"










































































































 







#line 4 "memo.c"


const unsigned short ADR_EE_BAT_C_NOM[2]={0x10+400+16,0x10+400+48};
const unsigned short ADR_EE_BAT_YEAR_OF_ON[2]={0x10+400+6,0x10+400+66};
const unsigned short ADR_EE_BAT_IS_ON[2]={0x10+400,0x10+400+30};
const unsigned short ADR_EE_BAT_DAY_OF_ON[2]={0x10+400+2,0x10+400+32};
const unsigned short ADR_EE_BAT_MONTH_OF_ON[2]={0x10+400+4,0x10+400+44};
const unsigned short ADR_EE_BAT_ZAR_CNT[2]={0x10+400+12,0x10+400+42};
const unsigned short ADR_EE_BAT_ZAR_CNT_KE[2]={0x10+400+14,0x10+400+44};
const unsigned short ADR_EE_BAT_RESURS[2]={0x10+400+10,0x10+400+40};
const unsigned short ADR_EE_BAT_C_REAL[2]={0x10+400+8,0x10+400+38};
const unsigned short ADR_KUBAT[2]={0x10,0x10+2};
const unsigned short ADR_KI0BAT[2]={0x10+4,0x10+6};
const unsigned short ADR_KI1BAT[2]={0x10+8,0x10+10};
const unsigned short ADR_KTBAT[2]={0x10+12,0x10+14};


const unsigned short ADR_TMAX_EXT_EN[3]={0x10+500,0x10+500+16,0x10+500+32};
const unsigned short ADR_TMAX_EXT[3]={0x10+500+2,0x10+500+18,0x10+500+34};
const unsigned short ADR_TMIN_EXT_EN[3]={0x10+500+4,0x10+500+20,0x10+500+36};
const unsigned short ADR_TMIN_EXT[3]={0x10+500+6,0x10+500+22,0x10+500+38};
const unsigned short ADR_T_EXT_REL_EN[3]={0x10+500+8,0x10+500+24,0x10+500+40};
const unsigned short ADR_T_EXT_ZVUK_EN[3]={0x10+500+10,0x10+500+26,0x10+500+42};
const unsigned short ADR_T_EXT_LCD_EN[3]={0x10+500+12,0x10+500+28,0x10+500+44};
const unsigned short ADR_T_EXT_RS_EN[3]={0x10+500+14,0x10+500+30,0x10+500+46};

const unsigned short ADR_SK_SIGN[4]={0x10+500+48,0x10+500+58,0x10+500+68,0x10+500+78};
const unsigned short ADR_SK_REL_EN[4]={0x10+500+50,0x10+500+60,0x10+500+70,0x10+500+80};
const unsigned short ADR_SK_ZVUK_EN[4]={0x10+500+52,0x10+500+62,0x10+500+72,0x10+500+82};
const unsigned short ADR_SK_LCD_EN[4]={0x10+500+54,0x10+500+64,0x10+500+74,0x10+500+84};
const unsigned short ADR_SK_RS_EN[4]={0x10+500+56,0x10+500+66,0x10+500+76,0x10+500+86};







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

extern enum {mnON=0x55,mnOFF=0xAA}MNEMO_ON;
extern unsigned short MNEMO_TIME;

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

extern enum  {apvON=0x0055,apvOFF=0x00aa}APV_ON1,APV_ON2;
extern signed short APV_ON2_TIME;

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


void memo_read (void)
{











Kubat[0]=lc640_read_int(0x10);
Kubat[1]=lc640_read_int(0x10+2);
Kibat0[0]=lc640_read_int(0x10+4);
Kibat0[1]=lc640_read_int(0x10+6);
Kibat1[0]=lc640_read_int(0x10+8);
Kibat1[1]=lc640_read_int(0x10+10);
Ktbat[0]=lc640_read_int(0x10+12);
Ktbat[1]=lc640_read_int(0x10+14);
Kunet=lc640_read_int(0x10+16);
Kuload=lc640_read_int(0x10+20);

Ktout[0]=lc640_read_int(0x10+100+50);
Ktout[1]=lc640_read_int(0x10+100+52);
Ktout[2]=lc640_read_int(0x10+100+54);
	
MAIN_IST=lc640_read_int(0x10+100+2);
UMAX=lc640_read_int(0x10+100+4);
UB0=lc640_read_int(0x10+100+6);
UB20=lc640_read_int(0x10+100+8);
TMAX=lc640_read_int(0x10+100+10);
TSIGN=lc640_read_int(0x10+100+82);
DU=lc640_read_int(0x10+100+84);
USIGN=lc640_read_int(0x10+100+14);
UMN=lc640_read_int(0x10+100+16);
ZV_ON=lc640_read_int(0x10+100+18);
IKB=lc640_read_int(0x10+100+20);
KVZ=lc640_read_int(0x10+100+22);
IMAX=lc640_read_int(0x10+100+24);
KIMAX=lc640_read_int(0x10+100+26);
APV_ON=lc640_read_int(0x10+100+28);
IZMAX=lc640_read_int(0x10+100+30);
U0B=lc640_read_int(0x10+100+32);
TZAS=lc640_read_int(0x10+100+34);
NUMIST=lc640_read_int(0x10+100+36);
NUMINV=lc640_read_int(0x10+100+38);
NUMSK=lc640_read_int(0x10+500+88);
NUMDT=lc640_read_int(0x10+500+90);
NUMEXT=NUMSK+NUMDT;
AV_OFF_AVT=lc640_read_int(0x10+100+12);
MNEMO_ON=lc640_read_int(0x10+100+72);
MNEMO_TIME=lc640_read_int(0x10+100+74);
U_AVT=lc640_read_int(0x10+100+80);
PAR=lc640_read_int(0x10+100+86);
TBATMAX=lc640_read_int(0x10+100+88);
TBATSIGN=lc640_read_int(0x10+100+90);

BAT_IS_ON[0]=lc640_read_int(0x10+400);
BAT_IS_ON[1]=lc640_read_int(0x10+400+30);
NUMBAT=0;
if(BAT_IS_ON[0]==bisON)NUMBAT+=1;
if(BAT_IS_ON[1]==bisON)NUMBAT+=1;

BAT_DAY_OF_ON[0]=lc640_read_int(0x10+400+2);
BAT_MONTH_OF_ON[0]=lc640_read_int(0x10+400+4);
BAT_YEAR_OF_ON[0]=lc640_read_int(0x10+400+6);
BAT_C_REAL[0]=lc640_read_int(0x10+400+8);
BAT_C_NOM[0]=lc640_read_int(0x10+400+16);
BAT_RESURS[0]=lc640_read_int(0x10+400+10);

BAT_DAY_OF_ON[1]=lc640_read_int(0x10+400+32);
BAT_MONTH_OF_ON[1]=lc640_read_int(0x10+400+44);
BAT_YEAR_OF_ON[1]=lc640_read_int(0x10+400+66);
BAT_C_REAL[1]=lc640_read_int(0x10+400+38);
BAT_C_NOM[1]=lc640_read_int(0x10+400+48);
BAT_RESURS[1]=lc640_read_int(0x10+400+40);

APV_ON1=lc640_read_int(0x10+100+44);
APV_ON2=lc640_read_int(0x10+100+46);
APV_ON2_TIME=lc640_read_int(0x10+100+48);
VZ_HR=lc640_read_int(0x10+100+76);
TBAT=lc640_read_int(0x10+100+78);

AUSW_MAIN=lc640_read_int(0x10+300);
	AUSW_MAIN_NUMBER=lc640_read_long(0x10+300+2);
	AUSW_DAY=lc640_read_int(0x10+300+10);
	AUSW_MONTH=lc640_read_int(0x10+300+12);
	AUSW_YEAR=lc640_read_int(0x10+300+14);
	AUSW_BPS1_NUMBER=lc640_read_long(0x10+300+16);
	AUSW_BPS2_NUMBER=lc640_read_long(0x10+300+18);
	AUSW_RS232=lc640_read_int(0x10+300+20);
	AUSW_PDH=lc640_read_int(0x10+300+22);
	AUSW_SDH=lc640_read_int(0x10+300+24);
	AUSW_ETH=lc640_read_int(0x10+300+26);
	AUSW_UKU=lc640_read_int(0x10+300+4);
	AUSW_UKU_SUB=lc640_read_int(0x10+300+6);
	AUSW_UKU_NUMBER=lc640_read_long(0x10+300+8);			


TMAX_EXT_EN[0]=lc640_read_int(0x10+500);
TMAX_EXT[0]=lc640_read_int(0x10+500+2);
TMIN_EXT_EN[0]=lc640_read_int(0x10+500+4);
TMIN_EXT[0]=lc640_read_int(0x10+500+6);	
T_EXT_REL_EN[0]=lc640_read_int(0x10+500+8);
T_EXT_ZVUK_EN[0]=lc640_read_int(0x10+500+10);
T_EXT_LCD_EN[0]=lc640_read_int(0x10+500+12);
T_EXT_RS_EN[0]=lc640_read_int(0x10+500+14);
SK_SIGN[0]=lc640_read_int(0x10+500+48);
SK_REL_EN[0]=lc640_read_int(0x10+500+50);
SK_ZVUK_EN[0]=lc640_read_int(0x10+500+52);
SK_LCD_EN[0]=lc640_read_int(0x10+500+54);	
SK_RS_EN[0]=lc640_read_int(0x10+500+56);
SK_SIGN[1]=lc640_read_int(0x10+500+58);
SK_REL_EN[1]=lc640_read_int(0x10+500+60);
SK_ZVUK_EN[1]=lc640_read_int(0x10+500+62);
SK_LCD_EN[1]=lc640_read_int(0x10+500+64);	
SK_RS_EN[1]=lc640_read_int(0x10+500+66);

AVZ=(char)(lc640_read_int(0x10+100+70));
AVZ_TIME=lc640_read_int(0x10+100+56);
HOUR_AVZ=lc640_read_int(0x10+100+58);
MIN_AVZ=lc640_read_int(0x10+100+60);
SEC_AVZ=lc640_read_int(0x10+100+62);
DATE_AVZ=lc640_read_int(0x10+100+64);
MONTH_AVZ=lc640_read_int(0x10+100+66);
if(!((MONTH_AVZ>0)&&(MONTH_AVZ<13)))MONTH_AVZ=0;
YEAR_AVZ=lc640_read_int(0x10+100+68);

}


