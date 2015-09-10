#include "beep.h"
#include "main.h"
#include "LPC17XX.H"
#include "avar_hndl.h"

unsigned long beep_stat_temp,beep_stat;
char beep_stat_cnt;
char beep_cnt;
char bU_BAT2REL_AV_BAT;

//-----------------------------------------------
void beep_drv(void)
{
LPC_GPIO1->FIODIR|=(1UL<<31);
if((beep_stat_temp&0x00000001UL)&&(ZV_ON))
    	{
    	LPC_GPIO1->FIOSET|=(1UL<<31);
    	beep_cnt=6;
    	}
else LPC_GPIO1->FIOCLR|=(1UL<<31);

beep_stat_temp>>=1;
if(--beep_stat_cnt==0)
	{
	beep_stat_cnt=32;
	beep_stat_temp=beep_stat;
	}

//IO1SET|=(1UL<<27);
//FIO1SET|=(1UL<<27);
}

//-----------------------------------------------
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

//-----------------------------------------------
void beep_hndl(void) 
{ 
static char bcnt;
bcnt++; 
if(bcnt>9)bcnt=0;
//bU_BAT2REL_AV_BAT=0;
if((avar_ind_stat)||(ips_bat_av_stat))beep_init(0x33333333,'R');


else if ( (((bat[0]._Ub<(USIGN*10))&&(BAT_IS_ON[0]==bisON))||((bat[1]._Ub<(USIGN*10))&&(BAT_IS_ON[1]==bisON)))) 
	{
	if(!bSILENT)beep_init(0x01010101,'R');
	//bU_BAT2REL_AV_BAT=1;
	}

else if ( (((bat[0]._Ib<(-IKB))&&(BAT_IS_ON[0]==bisON))||((bat[1]._Ib<(-IKB))&&(BAT_IS_ON[1]==bisON)))) 
	{
	if(!bSILENT)beep_init(0x00010001,'R');
	//bU_BAT2REL_AV_BAT=1;
	}

else if ( ((bat[0]._temper_stat&0x03)||(bat[1]._temper_stat&0x03)) )
	{
	if(!bSILENT) beep_init(0x00000005,'R');
	}


else 
	{
	beep_init(0x00000000,'S');
	bSILENT=0;
	} 


//if(!avar_ind_stat)beep_init(0x00000000,'R');

/*if(K[MNL]==ON)
	{ */
//if(((av_beep&0xffff)&&(ind!=iK)&&(ind!=iTst))
//	/*||((!T_EXT_ZVUK_EN[0])&&((tout_stat[0]==tMIN)||(tout_stat[0]==tMAX)))*/)beep_init(0x55555555,'R'); 

//else if(bUrazr&&(!bUOFF))beep_init(0x00010001,'R');

//else if(bIrazr&&(cnt_beep==0))beep_init(0x01010101,'R');

/*
else if(bTsi||bTsb)
	{
	if(!bcnt)beep_init(0x00000001,'O');
     }

else if(bIbr) beep_init(0x00000001,'R');
*/


//else beep_init(0x00000000,'S');



bU_BAT2REL_AV_BAT=0;
#ifdef UKU206_220
if  (((bat[0]._Ub<(USIGN*10))&&(BAT_IS_ON[0]==bisON))) 
	{
	bU_BAT2REL_AV_BAT=1;
	}
#endif

}
