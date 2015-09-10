
#include <lpc17xx.h>
#include "modbus.h"
//#include "LPC17xx.H"
#include "main.h"
#include <string.h>

#include "eeprom_map.h"

extern int  mem_copy (void *dp, void *sp, int len);

unsigned char modbus_buf[20];
short modbus_crc16;
char modbus_timeout_cnt;
char bMODBUS_TIMEOUT;
unsigned char modbus_rx_buffer[30];	//�����, ���� ���������� ����������� ������� ���������� ���������� �� ������ ����� 
unsigned char modbus_an_buffer[30];    	//�����, ���� ��� ����� ���������� ��� �������
unsigned char modbus_rx_buffer_ptr;	//��������� �� ������� ������� ������������ ������
unsigned char modbus_rx_counter;		//���������� �������� ����, ������������ ��� ������� ����������� ������� � ��� �����������

short modbus_plazma;				//�������
short modbus_plazma1;				//�������
short modbus_plazma2;				//�������
short modbus_plazma3;				//�������

unsigned short modbus_rx_arg0;		//���������� � ������� ������ ��������
unsigned short modbus_rx_arg1;		//���������� � ������� ������ ��������
unsigned short modbus_rx_arg2;		//���������� � ������� ������ ��������
unsigned short modbus_rx_arg3;		//���������� � ������� ��������� ��������

//-----------------------------------------------
unsigned short CRC16_2(char* buf, short len)
{
unsigned short crc = 0xFFFF;
short pos;
short i;

for (pos = 0; pos < len; pos++)
  	{
    	crc ^= (unsigned short)buf[pos];          // XOR byte into least sig. byte of crc

    	for ( i = 8; i != 0; i--) 
		{    // Loop over each bit
      	if ((crc & 0x0001) != 0) 
			{      // If the LSB is set
        		crc >>= 1;                    // Shift right and XOR 0xA001
        		crc ^= 0xA001;
      		}
      	else  crc >>= 1;                    // Just shift right
    		}
  	}
  // Note, this number has low and high bytes swapped, so use it accordingly (or swap bytes)
return crc;
}

//-----------------------------------------------
void modbus_in(void)
{
short crc16_calculated;		//����������� �� �������� ������ CRC
short crc16_incapsulated;	//����������� � ������� CRC
unsigned short modbus_rx_arg0;		//���������� � ������� ������ ��������
unsigned short modbus_rx_arg1;		//���������� � ������� ������ ��������
unsigned short modbus_rx_arg2;		//���������� � ������� ������ ��������
unsigned short modbus_rx_arg3;		//���������� � ������� ��������� ��������
unsigned char modbus_func;			//���������� � ������� ��� �������

modbus_plazma++;

mem_copy(modbus_an_buffer,modbus_rx_buffer,modbus_rx_buffer_ptr);
modbus_rx_counter=modbus_rx_buffer_ptr;
modbus_rx_buffer_ptr=0;
bMODBUS_TIMEOUT=0;
	
crc16_calculated  = CRC16_2(modbus_an_buffer, modbus_rx_counter-2);
crc16_incapsulated = *((short*)&modbus_an_buffer[modbus_rx_counter-2]);

modbus_plazma1=modbus_rx_counter;
modbus_plazma2=crc16_calculated;
modbus_plazma3=crc16_incapsulated;

modbus_func=modbus_an_buffer[1];
modbus_rx_arg0=(((unsigned short)modbus_an_buffer[2])*((unsigned short)256))+((unsigned short)modbus_an_buffer[3]);
modbus_rx_arg1=(((unsigned short)modbus_an_buffer[4])*((unsigned short)256))+((unsigned short)modbus_an_buffer[5]);
modbus_rx_arg2=(((unsigned short)modbus_an_buffer[6])*((unsigned short)256))+((unsigned short)modbus_an_buffer[7]);
modbus_rx_arg3=(((unsigned short)modbus_an_buffer[8])*((unsigned short)256))+((unsigned short)modbus_an_buffer[9]);


if(crc16_calculated==crc16_incapsulated)
	{
	if(modbus_an_buffer[0]==MODBUS_ADRESS)
		{
		if(modbus_func==3)		//������ ������������� ���-�� ��������� ��������
			{
			modbus_hold_registers_transmit(MODBUS_ADRESS,modbus_func,modbus_rx_arg0,modbus_rx_arg1);
			}

		if(modbus_func==4)		//������ ������������� ���-�� ���������	������
			{
			modbus_input_registers_transmit(MODBUS_ADRESS,modbus_func,modbus_rx_arg0,modbus_rx_arg1);
			}

		else if(modbus_func==6) 	//������ ��������� ��������
			{
			if(modbus_rx_arg0==11)		//��������� ������� 
				{
				LPC_RTC->YEAR=(uint16_t)modbus_rx_arg1;
				}
			if(modbus_rx_arg0==12)		//��������� ������� 
				{
				LPC_RTC->MONTH=(uint16_t)modbus_rx_arg1;
				}
			if(modbus_rx_arg0==13)		//��������� ������� 
				{
				LPC_RTC->DOM=(uint16_t)modbus_rx_arg1;
				}
			if(modbus_rx_arg0==14)		//��������� ������� 
				{
				LPC_RTC->HOUR=(uint16_t)modbus_rx_arg1;
				}
			if(modbus_rx_arg0==15)		//��������� ������� 
				{
				LPC_RTC->MIN=(uint16_t)modbus_rx_arg1;
				}
			if(modbus_rx_arg0==16)		//��������� ������� 
				{
				LPC_RTC->SEC=(uint16_t)modbus_rx_arg1;
				}
			if(modbus_rx_arg0==20)		//��� ������������ ��� ������ ������������ ����
				{
				if((modbus_rx_arg1>0)&&(modbus_rx_arg1<5))
				lc640_write_int(EE_NUMIST,modbus_rx_arg1);  
				}
			if(modbus_rx_arg0==21)		//��� ������������ ��� ������ ������������ ����
				{
				if((modbus_rx_arg1==0)||(modbus_rx_arg1==1))
				lc640_write_int(EE_PAR,modbus_rx_arg1);  
				}
			if(modbus_rx_arg0==22)		//��� ������������ ��� ������ ������������ ����
				{
				if((modbus_rx_arg1==0)||(modbus_rx_arg1==1))
				lc640_write_int(EE_ZV_ON,modbus_rx_arg1);  
				}
			if(modbus_rx_arg0==23)		//��� ������������ ��� ������ ������������ ����
				{
				if((modbus_rx_arg1==0)||(modbus_rx_arg1==1))
				lc640_write_int(EE_TERMOKOMP,modbus_rx_arg1);  
				}
			if(modbus_rx_arg0==24)		//��� ������������ ��� ������ ������������ ����
				{
				if((modbus_rx_arg1>=0)||(modbus_rx_arg1<=20))
				lc640_write_int(EE_UBM_AV,modbus_rx_arg1);  
				}


			if(modbus_rx_arg0==30)		//���������� ������������ ��� ������ ������������ ����������
				{
				if(modbus_rx_arg1<0)TBAT=0;
				else if((modbus_rx_arg1>0)&&(modbus_rx_arg1<=5))modbus_rx_arg1=0;
				else if(modbus_rx_arg1>=60)TBAT=60;
				else TBAT=modbus_rx_arg1;
				lc640_write_int(EE_TBAT,TBAT);
	     		}
			if(modbus_rx_arg0==31)		//
				{
				lc640_write_int(EE_UMAX,modbus_rx_arg1);
	     		}
			if(modbus_rx_arg0==32)		//
				{
				lc640_write_int(EE_DU,UB20-modbus_rx_arg1);
	     		}
			if(modbus_rx_arg0==33)		//
				{
				lc640_write_int(EE_UB0,modbus_rx_arg1);
	     		}
			if(modbus_rx_arg0==34)		//
				{
				lc640_write_int(EE_UB20,modbus_rx_arg1);
	     		}
			if(modbus_rx_arg0==35)		//
				{
				lc640_write_int(EE_USIGN,modbus_rx_arg1);
	     		}
			if(modbus_rx_arg0==36)		//
				{
				lc640_write_int(EE_UMN,modbus_rx_arg1);
	     		}
			if(modbus_rx_arg0==37)		//
				{
				lc640_write_int(EE_U0B,modbus_rx_arg1);
	     		}
			if(modbus_rx_arg0==38)		//
				{
				lc640_write_int(EE_IKB,modbus_rx_arg1);
	     		}
			if(modbus_rx_arg0==39)		//
				{
				lc640_write_int(EE_IZMAX,modbus_rx_arg1);
	     		}
			if(modbus_rx_arg0==40)		//
				{
				lc640_write_int(EE_IMAX,modbus_rx_arg1);
	     		}
			if(modbus_rx_arg0==41)		//
				{
				lc640_write_int(EE_IMIN,modbus_rx_arg1);
	     		}
			if(modbus_rx_arg0==42)		//
				{
				lc640_write_int(EE_UVZ,modbus_rx_arg1);
	     		}
			if(modbus_rx_arg0==43)		//
				{
				lc640_write_int(EE_TZAS,modbus_rx_arg1);
	     		}
			if(modbus_rx_arg0==44)		//
				{
				lc640_write_int(EE_TMAX,modbus_rx_arg1);
	     		}
			if(modbus_rx_arg0==45)		//
				{
				lc640_write_int(EE_TSIGN,modbus_rx_arg1);
	     		}
			if(modbus_rx_arg0==46)		//
				{
				lc640_write_int(EE_TBATMAX,modbus_rx_arg1);
	     		}
			if(modbus_rx_arg0==47)		//
				{
				lc640_write_int(EE_TBATSIGN,modbus_rx_arg1);
	     		}
			if(modbus_rx_arg0==19)		//���/���� ��������� ����.
				{
	/*			if(modbus_rx_arg1==1)
					{
					if(work_stat!=wsPS)
						{
						work_stat=wsPS;
						time_proc=0;
						time_proc_remain=T_PROC_PS;
						restart_on_PS();
						lc640_write_int(EE_MAIN_MENU_MODE,mmmIN);
						}
					}
				if(modbus_rx_arg1==0)
					{
					if(work_stat==wsPS)
						{
						work_stat=wsOFF;
						restart_off();
						}
					} */
				}
			if(modbus_rx_arg0==20)		//���/���� ��������� ����
				{
/*				if(modbus_rx_arg1==1)
					{
					if(work_stat!=wsGS)
						{
						work_stat=wsGS;
						time_proc=0;
						time_proc_remain=T_PROC_GS;
						lc640_write_int(EE_MAIN_MENU_MODE,mmmIT);
						}
					}
				if(modbus_rx_arg1==0)
					{
					if(work_stat==wsGS)
						{
						work_stat=wsOFF;
						restart_off();
						}
					}*/
				}
			modbus_hold_register_transmit(MODBUS_ADRESS,modbus_func,modbus_rx_arg0);
			}
		} 
	//modbus_plazma++;
	}
// modbus_plazma++;

}

//-----------------------------------------------
void modbus_register_transmit(unsigned char adr,unsigned char func,unsigned short reg_adr)
{
char modbus_registers[150];
char modbus_tx_buff[50];
unsigned short crc_temp;
char i;


modbus_registers[0]=(char)(load_U/256);					//���1
modbus_registers[1]=(char)(load_U%256);
modbus_registers[2]=(char)(load_I/256);					//���2
modbus_registers[3]=(char)(load_I%256);
modbus_registers[4]=(char)(Ib_ips_termokompensat/256);		//���3
modbus_registers[5]=(char)(Ib_ips_termokompensat%256);
modbus_registers[6]=(char)(t_ext[0]/256);				//���4
modbus_registers[7]=(char)(t_ext[0]%256);
modbus_registers[8]=(char)(net_Ua/256);					//���5
modbus_registers[9]=(char)(net_Ua%256);		 	
modbus_registers[10]=(char)(net_Ub/256);				//���6
modbus_registers[11]=(char)(net_Ub%256);
modbus_registers[12]=(char)(net_Uc/256);				//���7
modbus_registers[13]=(char)(net_Uc%256);
modbus_registers[14]=(char)(net_F3/256);				//���8
modbus_registers[15]=(char)(net_F3%256);
modbus_registers[16]=(char)(load_I/256);				//���9
modbus_registers[17]=(char)(load_I%256);
modbus_registers[18]=(char)(load_I/256);				//���10
modbus_registers[19]=(char)(load_I%256);
modbus_registers[20]=(char)((LPC_RTC->YEAR)/256);			//���11
modbus_registers[21]=(char)((LPC_RTC->YEAR)%256);
modbus_registers[22]=(char)((LPC_RTC->MONTH)/256);		//���12
modbus_registers[23]=(char)((LPC_RTC->MONTH)%256);
modbus_registers[24]=(char)((LPC_RTC->DOM)/256);			//���13
modbus_registers[25]=(char)((LPC_RTC->DOM)%256);
modbus_registers[26]=(char)((LPC_RTC->HOUR)/256);			//���14
modbus_registers[27]=(char)((LPC_RTC->HOUR)%256);
modbus_registers[28]=(char)((LPC_RTC->MIN)/256);			//���15
modbus_registers[29]=(char)((LPC_RTC->MIN)%256);
modbus_registers[30]=(char)((LPC_RTC->SEC)/256);			//���16
modbus_registers[31]=(char)((LPC_RTC->SEC)%256);
modbus_registers[32]=(char)(load_I/256);				//���17
modbus_registers[33]=(char)(load_I%256);
modbus_registers[34]=(char)(load_I/256);				//���18
modbus_registers[35]=(char)(load_I%256);
modbus_registers[36]=(char)(load_I/256);		//���19
modbus_registers[37]=(char)(load_I%256);
modbus_registers[38]=(char)(NUMIST/256);		//���20
modbus_registers[39]=(char)(NUMIST%256);
modbus_registers[40]=(char)(PAR/256);		//���21
modbus_registers[41]=(char)(PAR%256);
modbus_registers[42]=(char)(ZV_ON/256);		//���22
modbus_registers[43]=(char)(ZV_ON%256);
modbus_registers[44]=(char)(TERMOKOMPENS/256);		//���23
modbus_registers[45]=(char)(TERMOKOMPENS%256);
modbus_registers[46]=(char)(UBM_AV/256);		//���24
modbus_registers[47]=(char)(UBM_AV%256);
modbus_registers[48]=(char)(load_I/256);		//���25
modbus_registers[49]=(char)(load_I%256);
modbus_registers[50]=(char)(load_I/256);		//���26
modbus_registers[51]=(char)(load_I%256);
modbus_registers[52]=(char)(load_I/256);		//���27
modbus_registers[53]=(char)(load_I%256);
modbus_registers[54]=(char)(load_I/256);		//���28
modbus_registers[55]=(char)(load_I%256);
modbus_registers[56]=(char)(load_I/256);		//���29
modbus_registers[57]=(char)(load_I%256);
modbus_registers[58]=(char)(TBAT/256);			//���30
modbus_registers[59]=(char)(TBAT%256);
modbus_registers[60]=(char)(UMAX/256);			//���31
modbus_registers[61]=(char)(UMAX%256);
modbus_registers[62]=(char)((UB20-DU)/256);		//���32
modbus_registers[63]=(char)((UB20-DU)%256);
modbus_registers[64]=(char)(UB0/256);			//���33
modbus_registers[65]=(char)(UB0%256);
modbus_registers[66]=(char)(UB20/256);			//���34
modbus_registers[67]=(char)(UB20%256);
modbus_registers[68]=(char)(USIGN/256);		//���35
modbus_registers[69]=(char)(USIGN%256);
modbus_registers[70]=(char)(UMN/256);		//���36
modbus_registers[71]=(char)(UMN%256);
modbus_registers[72]=(char)(U0B/256);		//���37
modbus_registers[73]=(char)(U0B%256);
modbus_registers[74]=(char)(IKB/256);		//���38
modbus_registers[75]=(char)(IKB%256);
modbus_registers[76]=(char)(IZMAX/256);		//���39
modbus_registers[77]=(char)(IZMAX%256);
modbus_registers[78]=(char)(IMAX/256);		//���40
modbus_registers[79]=(char)(IMAX%256);
modbus_registers[80]=(char)(IMIN/256);		//���41
modbus_registers[81]=(char)(IMIN%256);
modbus_registers[82]=(char)(UVZ/256);		//���42
modbus_registers[83]=(char)(UVZ%256);
modbus_registers[84]=(char)(TZAS/256);		//���43
modbus_registers[85]=(char)(TZAS%256);
modbus_registers[86]=(char)(TMAX/256);		//���44
modbus_registers[87]=(char)(TMAX%256);
modbus_registers[88]=(char)(TSIGN/256);		//���45
modbus_registers[89]=(char)(TSIGN%256);
modbus_registers[90]=(char)(TBATMAX/256);		//���46
modbus_registers[91]=(char)(TBATMAX%256);
modbus_registers[92]=(char)(TBATSIGN/256);		//���47
modbus_registers[93]=(char)(TBATSIGN%256);
modbus_registers[94]=(char)(load_I/256);		//���48
modbus_registers[95]=(char)(load_I%256);
modbus_registers[96]=(char)(load_I/256);		//���49
modbus_registers[97]=(char)(load_I%256);
modbus_registers[98]=(char)(load_I/256);		//���50
modbus_registers[99]=(char)(load_I%256);

modbus_tx_buff[0]=adr;
modbus_tx_buff[1]=func;
modbus_tx_buff[2]=(char)(reg_adr/256);
modbus_tx_buff[3]=(char)(reg_adr%256);
//modbus_tx_buff[4]=(char)(reg_quantity/256);
//modbus_tx_buff[5]=(char)(reg_quantity%256);
/*
modbus_registers[0]=0x10;
modbus_registers[1]=0x11;
modbus_registers[2]=0x12;
modbus_registers[3]=0x13;
modbus_registers[4]=0x14;
modbus_registers[5]=0x15;
*/

mem_copy((char*)&modbus_tx_buff[4],(char*)&modbus_registers[(reg_adr-1)*2],2);

crc_temp=CRC16_2(modbus_tx_buff,6);

modbus_tx_buff[6]=crc_temp%256;
modbus_tx_buff[7]=crc_temp/256;

for (i=0;i<8;i++)
	{
	putchar0(modbus_tx_buff[i]);
	}
}

//-----------------------------------------------
void modbus_registers_transmit(unsigned char adr,unsigned char func,unsigned short reg_adr,unsigned short reg_quantity)
{
char modbus_registers[100];
char modbus_tx_buff[100];
unsigned short crc_temp;
char i;


modbus_registers[0]=(char)(load_U/256);					//���1
modbus_registers[1]=(char)(load_U%256);
modbus_registers[2]=(char)(load_I/256);					//���2
modbus_registers[3]=(char)(load_I%256);
modbus_registers[4]=(char)(Ib_ips_termokompensat/256);		//���3
modbus_registers[5]=(char)(Ib_ips_termokompensat%256);
modbus_registers[6]=(char)(t_ext[0]/256);				//���4
modbus_registers[7]=(char)(t_ext[0]%256);
modbus_registers[8]=(char)(net_Ua/256);					//���5
modbus_registers[9]=(char)(net_Ua%256);		 	
modbus_registers[10]=(char)(net_Ub/256);				//���6
modbus_registers[11]=(char)(net_Ub%256);
modbus_registers[12]=(char)(net_Uc/256);				//���7
modbus_registers[13]=(char)(net_Uc%256);
modbus_registers[14]=(char)(net_F3/256);				//���8
modbus_registers[15]=(char)(net_F3%256);
modbus_registers[16]=(char)(load_I/256);				//���9
modbus_registers[17]=(char)(load_I%256);
modbus_registers[18]=(char)(load_I/256);				//���10
modbus_registers[19]=(char)(load_I%256);
modbus_registers[20]=(char)((LPC_RTC->YEAR)/256);			//���11
modbus_registers[21]=(char)((LPC_RTC->YEAR)%256);
modbus_registers[22]=(char)((LPC_RTC->MONTH)/256);		//���12
modbus_registers[23]=(char)((LPC_RTC->MONTH)%256);
modbus_registers[24]=(char)((LPC_RTC->DOM)/256);			//���13
modbus_registers[25]=(char)((LPC_RTC->DOM)%256);
modbus_registers[26]=(char)((LPC_RTC->HOUR)/256);			//���14
modbus_registers[27]=(char)((LPC_RTC->HOUR)%256);
modbus_registers[28]=(char)((LPC_RTC->MIN)/256);			//���15
modbus_registers[29]=(char)((LPC_RTC->MIN)%256);
modbus_registers[30]=(char)((LPC_RTC->SEC)/256);			//���16
modbus_registers[31]=(char)((LPC_RTC->SEC)%256);
modbus_registers[32]=(char)(load_I/256);				//���17
modbus_registers[33]=(char)(load_I%256);
modbus_registers[34]=(char)(load_I/256);				//���18
modbus_registers[35]=(char)(load_I%256);
modbus_registers[36]=(char)(load_I/256);		//���19
modbus_registers[37]=(char)(load_I%256);
modbus_registers[38]=(char)(NUMIST/256);		//���20
modbus_registers[39]=(char)(NUMIST%256);
modbus_registers[40]=(char)(PAR/256);		//���21
modbus_registers[41]=(char)(PAR%256);
modbus_registers[42]=(char)(ZV_ON/256);		//���22
modbus_registers[43]=(char)(ZV_ON%256);
modbus_registers[44]=(char)(TERMOKOMPENS/256);		//���23
modbus_registers[45]=(char)(TERMOKOMPENS%256);
modbus_registers[46]=(char)(UBM_AV/256);		//���24
modbus_registers[47]=(char)(UBM_AV%256);
modbus_registers[48]=(char)(load_I/256);		//���25
modbus_registers[49]=(char)(load_I%256);
modbus_registers[50]=(char)(load_I/256);		//���26
modbus_registers[51]=(char)(load_I%256);
modbus_registers[52]=(char)(load_I/256);		//���27
modbus_registers[53]=(char)(load_I%256);
modbus_registers[54]=(char)(load_I/256);		//���28
modbus_registers[55]=(char)(load_I%256);
modbus_registers[56]=(char)(load_I/256);		//���29
modbus_registers[57]=(char)(load_I%256);
modbus_registers[58]=(char)(TBAT/256);			//���30
modbus_registers[59]=(char)(TBAT%256);
modbus_registers[60]=(char)(UMAX/256);			//���31
modbus_registers[61]=(char)(UMAX%256);
modbus_registers[62]=(char)((UB20-DU)/256);		//���32
modbus_registers[63]=(char)((UB20-DU)%256);
modbus_registers[64]=(char)(UB0/256);			//���33
modbus_registers[65]=(char)(UB0%256);
modbus_registers[66]=(char)(UB20/256);			//���34
modbus_registers[67]=(char)(UB20%256);
modbus_registers[68]=(char)(USIGN/256);		//���35
modbus_registers[69]=(char)(USIGN%256);
modbus_registers[70]=(char)(UMN/256);		//���36
modbus_registers[71]=(char)(UMN%256);
modbus_registers[72]=(char)(U0B/256);		//���37
modbus_registers[73]=(char)(U0B%256);
modbus_registers[74]=(char)(IKB/256);		//���38
modbus_registers[75]=(char)(IKB%256);
modbus_registers[76]=(char)(IZMAX/256);		//���39
modbus_registers[77]=(char)(IZMAX%256);
modbus_registers[78]=(char)(IMAX/256);		//���40
modbus_registers[79]=(char)(IMAX%256);
modbus_registers[80]=(char)(IMIN/256);		//���41
modbus_registers[81]=(char)(IMIN%256);
modbus_registers[82]=(char)(UVZ/256);		//���42
modbus_registers[83]=(char)(UVZ%256);
modbus_registers[84]=(char)(TZAS/256);		//���43
modbus_registers[85]=(char)(TZAS%256);
modbus_registers[86]=(char)(TMAX/256);		//���44
modbus_registers[87]=(char)(TMAX%256);
modbus_registers[88]=(char)(TSIGN/256);		//���45
modbus_registers[89]=(char)(TSIGN%256);
modbus_registers[90]=(char)(TBATMAX/256);		//���46
modbus_registers[91]=(char)(TBATMAX%256);
modbus_registers[92]=(char)(TBATSIGN/256);		//���47
modbus_registers[93]=(char)(TBATSIGN%256);
modbus_registers[94]=(char)(load_I/256);		//���48
modbus_registers[95]=(char)(load_I%256);
modbus_registers[96]=(char)(load_I/256);		//���49
modbus_registers[97]=(char)(load_I%256);
modbus_registers[98]=(char)(load_I/256);		//���50
modbus_registers[99]=(char)(load_I%256);




modbus_tx_buff[0]=adr;
modbus_tx_buff[1]=func;
//modbus_tx_buff[2]=(char)(reg_adr/256);
//modbus_tx_buff[3]=(char)(reg_adr%256);
modbus_tx_buff[2]=(char)(reg_quantity*2);
//modbus_tx_buff[5]=(char)(reg_quantity%256);
/*
modbus_registers[0]=0x10;
modbus_registers[1]=0x11;
modbus_registers[2]=0x12;
modbus_registers[3]=0x13;
modbus_registers[4]=0x14;
modbus_registers[5]=0x15;
*/

mem_copy((char*)&modbus_tx_buff[3],(char*)&modbus_registers[(reg_adr-1)*2],reg_quantity*2);

crc_temp=CRC16_2(modbus_tx_buff,(reg_quantity*2)+3);

modbus_tx_buff[3+(reg_quantity*2)]=crc_temp%256;
modbus_tx_buff[4+(reg_quantity*2)]=crc_temp/256;

//int2lcdyx(reg_quantity,0,10,0);

for (i=0;i<15/*(5+(reg_quantity*2))*/;i++)
	{
	putchar0(modbus_tx_buff[i]);
	} 
}

//-----------------------------------------------
void modbus_hold_register_transmit(unsigned char adr,unsigned char func,unsigned short reg_adr)
{
char modbus_registers[100];
char modbus_tx_buff[100];
unsigned short crc_temp;
char i;

modbus_registers[20]=(char)((LPC_RTC->YEAR)/256);			//���11  �����, ���
modbus_registers[21]=(char)((LPC_RTC->YEAR)%256);
modbus_registers[22]=(char)((LPC_RTC->MONTH)/256);		//���12  �����, �����
modbus_registers[23]=(char)((LPC_RTC->MONTH)%256);
modbus_registers[24]=(char)((LPC_RTC->DOM)/256);			//���13  �����, ���� ������
modbus_registers[25]=(char)((LPC_RTC->DOM)%256);
modbus_registers[26]=(char)((LPC_RTC->HOUR)/256);			//���14  �����, ���
modbus_registers[27]=(char)((LPC_RTC->HOUR)%256);
modbus_registers[28]=(char)((LPC_RTC->MIN)/256);			//���15  �����, ������
modbus_registers[29]=(char)((LPC_RTC->MIN)%256);
modbus_registers[30]=(char)((LPC_RTC->SEC)/256);			//���16  �����, �������
modbus_registers[31]=(char)((LPC_RTC->SEC)%256);
modbus_registers[38]=(char)(NUMIST/256);				//���20  ���������� ������������ � ���������
modbus_registers[39]=(char)(NUMIST%256);
modbus_registers[40]=(char)(PAR/256);					//���21  ������������ ������ ������������ ���./����.
modbus_registers[41]=(char)(PAR%256);
modbus_registers[42]=(char)(ZV_ON/256);					//���22  �������� ��������� ������������ ���./����.
modbus_registers[43]=(char)(ZV_ON%256);
modbus_registers[46]=(char)(UBM_AV/256);				//���24  ��������� ������� ���������� ���������� ������� ����� �������, %
modbus_registers[47]=(char)(UBM_AV%256);
modbus_registers[58]=(char)(TBAT/256);					//���30  ������ �������� ���� �������, �����.
modbus_registers[59]=(char)(TBAT%256);
modbus_registers[60]=(char)(UMAX/256);					//���31  ������������ (���������) ���������� ������������, 0.1�
modbus_registers[61]=(char)(UMAX%256);
modbus_registers[62]=(char)((UB20-DU)/256);				//���32  ����������� (���������) ���������� ������������, 0.1�
modbus_registers[63]=(char)((UB20-DU)%256);
modbus_registers[64]=(char)(UB0/256);					//���33  ���������� ���������� ������� ��� 0��, 0.1�
modbus_registers[65]=(char)(UB0%256);
modbus_registers[66]=(char)(UB20/256);					//���34  ���������� ���������� ������� ��� 20��, 0.1�
modbus_registers[67]=(char)(UB20%256);
modbus_registers[68]=(char)(USIGN/256);					//���35  ����������� (����������) ���������� �������, 1�
modbus_registers[69]=(char)(USIGN%256);
modbus_registers[70]=(char)(UMN/256);					//���36  ����������� (���������) ���������� �������� ����, 1�
modbus_registers[71]=(char)(UMN%256);
modbus_registers[72]=(char)(U0B/256);					//���37  ������� ���������� ��� ����������� ��������, 0.1�
modbus_registers[73]=(char)(U0B%256);
modbus_registers[74]=(char)(IKB/256);					//���38  ��� �������� ������� �������, 0.1�
modbus_registers[75]=(char)(IKB%256);
modbus_registers[76]=(char)(IZMAX/256);					//���39  ��� ������ ������� ������������, 0.1�
modbus_registers[77]=(char)(IZMAX%256);
modbus_registers[78]=(char)(IMAX/256);					//���40  ��� ������������ �� ������� ���-�� ������������, 0.1�
modbus_registers[79]=(char)(IMAX%256);
modbus_registers[80]=(char)(IMIN/256);					//���41  ��� ������������ �� ������� ���-�� ������������, 0.1�
modbus_registers[81]=(char)(IMIN%256);
modbus_registers[82]=(char)(UVZ/256);					//���42  ���������� �������������� ������, 0.1�
modbus_registers[83]=(char)(UVZ%256);
modbus_registers[84]=(char)(TZAS/256);					//���43  ����� �������� ��������� ������������, ���
modbus_registers[85]=(char)(TZAS%256);
modbus_registers[86]=(char)(TMAX/256);					//���44  ����������� ������������ ���������, 1��
modbus_registers[87]=(char)(TMAX%256);
modbus_registers[88]=(char)(TSIGN/256);					//���45  ����������� ������������ ����������, 1��
modbus_registers[89]=(char)(TSIGN%256);
modbus_registers[90]=(char)(TBATMAX/256);				//���46  ����������� ������� ���������, 1��
modbus_registers[91]=(char)(TBATMAX%256);
modbus_registers[92]=(char)(TBATSIGN/256);				//���47  ����������� ������� ����������, 1��
modbus_registers[93]=(char)(TBATSIGN%256);

modbus_tx_buff[0]=adr;
modbus_tx_buff[1]=func;
modbus_tx_buff[2]=(char)(reg_adr/256);
modbus_tx_buff[3]=(char)(reg_adr%256);

mem_copy((char*)&modbus_tx_buff[4],(char*)&modbus_registers[(reg_adr-1)*2],2);

crc_temp=CRC16_2(modbus_tx_buff,6);

modbus_tx_buff[6]=crc_temp%256;
modbus_tx_buff[7]=crc_temp/256;

for (i=0;i<8;i++)
	{
	putchar0(modbus_tx_buff[i]);
	}
}

//-----------------------------------------------
void modbus_hold_registers_transmit(unsigned char adr,unsigned char func,unsigned short reg_adr,unsigned short reg_quantity)
{
char modbus_registers[100];
char modbus_tx_buff[100];
unsigned short crc_temp;
char i;

modbus_registers[20]=(char)((LPC_RTC->YEAR)/256);			//���11  �����, ���
modbus_registers[21]=(char)((LPC_RTC->YEAR)%256);
modbus_registers[22]=(char)((LPC_RTC->MONTH)/256);		//���12  �����, �����
modbus_registers[23]=(char)((LPC_RTC->MONTH)%256);
modbus_registers[24]=(char)((LPC_RTC->DOM)/256);			//���13  �����, ���� ������
modbus_registers[25]=(char)((LPC_RTC->DOM)%256);
modbus_registers[26]=(char)((LPC_RTC->HOUR)/256);			//���14  �����, ���
modbus_registers[27]=(char)((LPC_RTC->HOUR)%256);
modbus_registers[28]=(char)((LPC_RTC->MIN)/256);			//���15  �����, ������
modbus_registers[29]=(char)((LPC_RTC->MIN)%256);
modbus_registers[30]=(char)((LPC_RTC->SEC)/256);			//���16  �����, �������
modbus_registers[31]=(char)((LPC_RTC->SEC)%256);
modbus_registers[38]=(char)(NUMIST/256);				//���20  ���������� ������������ � ���������
modbus_registers[39]=(char)(NUMIST%256);
modbus_registers[40]=(char)(PAR/256);					//���21  ������������ ������ ������������ ���./����.
modbus_registers[41]=(char)(PAR%256);
modbus_registers[42]=(char)(ZV_ON/256);					//���22  �������� ��������� ������������ ���./����.
modbus_registers[43]=(char)(ZV_ON%256);
modbus_registers[46]=(char)(UBM_AV/256);				//���24  ��������� ������� ���������� ���������� ������� ����� �������, %
modbus_registers[47]=(char)(UBM_AV%256);
modbus_registers[58]=(char)(TBAT/256);					//���30  ������ �������� ���� �������, �����.
modbus_registers[59]=(char)(TBAT%256);
modbus_registers[60]=(char)(UMAX/256);					//���31  ������������ (���������) ���������� ������������, 0.1�
modbus_registers[61]=(char)(UMAX%256);
modbus_registers[62]=(char)((UB20-DU)/256);				//���32  ����������� (���������) ���������� ������������, 0.1�
modbus_registers[63]=(char)((UB20-DU)%256);
modbus_registers[64]=(char)(UB0/256);					//���33  ���������� ���������� ������� ��� 0��, 0.1�
modbus_registers[65]=(char)(UB0%256);
modbus_registers[66]=(char)(UB20/256);					//���34  ���������� ���������� ������� ��� 20��, 0.1�
modbus_registers[67]=(char)(UB20%256);
modbus_registers[68]=(char)(USIGN/256);					//���35  ����������� (����������) ���������� �������, 1�
modbus_registers[69]=(char)(USIGN%256);
modbus_registers[70]=(char)(UMN/256);					//���36  ����������� (���������) ���������� �������� ����, 1�
modbus_registers[71]=(char)(UMN%256);
modbus_registers[72]=(char)(U0B/256);					//���37  ������� ���������� ��� ����������� ��������, 0.1�
modbus_registers[73]=(char)(U0B%256);
modbus_registers[74]=(char)(IKB/256);					//���38  ��� �������� ������� �������, 0.1�
modbus_registers[75]=(char)(IKB%256);
modbus_registers[76]=(char)(IZMAX/256);					//���39  ��� ������ ������� ������������, 0.1�
modbus_registers[77]=(char)(IZMAX%256);
modbus_registers[78]=(char)(IMAX/256);					//���40  ��� ������������ �� ������� ���-�� ������������, 0.1�
modbus_registers[79]=(char)(IMAX%256);
modbus_registers[80]=(char)(IMIN/256);					//���41  ��� ������������ �� ������� ���-�� ������������, 0.1�
modbus_registers[81]=(char)(IMIN%256);
modbus_registers[82]=(char)(UVZ/256);					//���42  ���������� �������������� ������, 0.1�
modbus_registers[83]=(char)(UVZ%256);
modbus_registers[84]=(char)(TZAS/256);					//���43  ����� �������� ��������� ������������, ���
modbus_registers[85]=(char)(TZAS%256);
modbus_registers[86]=(char)(TMAX/256);					//���44  ����������� ������������ ���������, 1��
modbus_registers[87]=(char)(TMAX%256);
modbus_registers[88]=(char)(TSIGN/256);					//���45  ����������� ������������ ����������, 1��
modbus_registers[89]=(char)(TSIGN%256);
modbus_registers[90]=(char)(TBATMAX/256);				//���46  ����������� ������� ���������, 1��
modbus_registers[91]=(char)(TBATMAX%256);
modbus_registers[92]=(char)(TBATSIGN/256);				//���47  ����������� ������� ����������, 1��
modbus_registers[93]=(char)(TBATSIGN%256);


modbus_tx_buff[0]=adr;
modbus_tx_buff[1]=func;
//modbus_tx_buff[2]=(char)(reg_adr/256);
//modbus_tx_buff[3]=(char)(reg_adr%256);
//modbus_tx_buff[4]=(char)(reg_quantity/256);
//modbus_tx_buff[5]=(char)(reg_quantity%256);
modbus_tx_buff[2]=(char)(reg_quantity*2);
/*
modbus_registers[0]=0x10;
modbus_registers[1]=0x11;
modbus_registers[2]=0x12;
modbus_registers[3]=0x13;
modbus_registers[4]=0x14;
modbus_registers[5]=0x15;
*/

//if((reg_adr<17)&&(reg_quantity<10))
	{
	mem_copy((char*)&modbus_tx_buff[3],(char*)&modbus_registers[(reg_adr-1)*2],reg_quantity*2);
	}
crc_temp=CRC16_2(modbus_tx_buff,(reg_quantity*2)+3);

modbus_tx_buff[3+(reg_quantity*2)]=crc_temp%256;
modbus_tx_buff[4+(reg_quantity*2)]=crc_temp/256;

for (i=0;i<(5+(reg_quantity*2));i++)
	{
	putchar0(modbus_tx_buff[i]);
	}

/*	putchar2(modbus_tx_buff[0]);
	putchar2(modbus_tx_buff[1]);
	putchar2(modbus_tx_buff[2]);
	putchar2(modbus_tx_buff[3]);
	putchar2(modbus_tx_buff[4]);
	putchar2(modbus_tx_buff[5]);
	putchar2(modbus_tx_buff[6]);*/
//	putchar2(modbus_tx_buff[0]);
	//putchar2(modbus_tx_buff[1]);
//	putchar2(modbus_tx_buff[2]);
//	putchar2(modbus_tx_buff[3]);
///	putchar2(modbus_tx_buff[4]);
//	putchar2(modbus_tx_buff[5]);
//	putchar2(modbus_tx_buff[6]);
}

//-----------------------------------------------
void modbus_input_registers_transmit(unsigned char adr,unsigned char func,unsigned short reg_adr,unsigned short reg_quantity)
{
char modbus_registers[110];
char modbus_tx_buff[120];
unsigned short crc_temp;
char i;

modbus_registers[0]=(char)(load_U/256);					//���1   	���������� ��������, 0.1�
modbus_registers[1]=(char)(load_U%256);
modbus_registers[2]=(char)(load_I/256);					//���2   	��� ��������, 0.1�
modbus_registers[3]=(char)(load_I%256);
modbus_registers[4]=(char)(net_U/256);					//���3   	���������� ���� �������, 1�
modbus_registers[5]=(char)(net_U%256);
modbus_registers[6]=(char)(net_F/256);					//���4   	������� ���� �������, 0.1��
modbus_registers[7]=(char)(net_F%256);
modbus_registers[8]=(char)(net_Ua/256);					//���5	���������� ���� ������� ���� A, 1�	
modbus_registers[9]=(char)(net_Ua%256);		 	
modbus_registers[10]=(char)(net_Ub/256);				//���6	���������� ���� ������� ���� B, 1�
modbus_registers[11]=(char)(net_Ub%256);
modbus_registers[12]=(char)(net_Uc/256);				//���7	���������� ���� ������� ���� C, 1�
modbus_registers[13]=(char)(net_Uc%256);
modbus_registers[14]=(char)(bat[0]._Ub/256);				//���8	���������� ������� �1, 0.1�
modbus_registers[15]=(char)(bat[0]._Ub%256);
modbus_registers[16]=(char)(bat[0]._Ib/256);				//���9   	��� ������� �1, 0.01�
modbus_registers[17]=(char)(bat[0]._Ib%256);
modbus_registers[18]=(char)(bat[0]._Tb/256);				//���10	����������� ������� �1, 1��
modbus_registers[19]=(char)(bat[0]._Tb%256);
modbus_registers[20]=(char)(bat[0]._zar/256);			//���11	����� ������� �1, %
modbus_registers[21]=(char)(bat[0]._zar%256);
modbus_registers[22]=(char)(bat[0]._Ubm/256);			//���12	���������� ������� ����� ������� �1, 0.1�
modbus_registers[23]=(char)(bat[0]._Ubm%256);
modbus_registers[24]=(char)(bat[0]._dUbm/256);			//���13	������ ������� ����� ������� �1, %
modbus_registers[25]=(char)(bat[0]._dUbm%256);
modbus_registers[26]=(char)(BAT_C_REAL[0]/256);			//���14	�������� ������� ������� �1, 0.1�*�, ���� 0x5555 �� �� ����������
modbus_registers[27]=(char)(BAT_C_REAL[0]%256);
modbus_registers[28]=(char)(bat[1]._Ub/256);				//���15	���������� ������� �1, 0.1�
modbus_registers[29]=(char)(bat[1]._Ub%256);
modbus_registers[30]=(char)(bat[1]._Ib/256);				//���16   	��� ������� �1, 0.01�
modbus_registers[31]=(char)(bat[1]._Ib%256);
modbus_registers[32]=(char)(bat[1]._Tb/256);				//���17	����������� ������� �1, 1��
modbus_registers[33]=(char)(bat[1]._Tb%256);
modbus_registers[34]=(char)(bat[1]._zar/256);			//���18	����� ������� �1, %
modbus_registers[35]=(char)(bat[1]._zar%256);
modbus_registers[36]=(char)(bat[1]._Ubm/256);			//���19	���������� ������� ����� ������� �1, 0.1�
modbus_registers[37]=(char)(bat[1]._Ubm%256);
modbus_registers[38]=(char)(bat[1]._dUbm/256);			//���20	������ ������� ����� ������� �1, %
modbus_registers[39]=(char)(bat[1]._dUbm%256);
modbus_registers[40]=(char)(BAT_C_REAL[1]/256);			//���21	�������� ������� ������� �1, 0.1�*�, ���� 0x5555 �� �� ����������
modbus_registers[41]=(char)(BAT_C_REAL[1]%256);
modbus_registers[42]=(char)(bps[0]._Uii/256);			//���22	�������� ���������� ����������� �1, 0.1�
modbus_registers[43]=(char)(bps[0]._Uii%256);
modbus_registers[44]=(char)(bps[0]._Ii/256);				//���23	�������� ��� ����������� �1, 0.1�
modbus_registers[45]=(char)(bps[0]._Ii%256);
modbus_registers[46]=(char)(bps[0]._Ti/256);				//���24	����������� ��������� ����������� �1, 1��
modbus_registers[47]=(char)(bps[0]._Ti%256);
modbus_registers[48]=(char)(bps[0]._av/256);				//���25	���� ������ ����������� �1, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[49]=(char)(bps[0]._av%256);
modbus_registers[50]=(char)(bps[1]._Uii/256);			//���26	�������� ���������� ����������� �2, 0.1�
modbus_registers[51]=(char)(bps[1]._Uii%256);
modbus_registers[52]=(char)(bps[1]._Ii/256);				//���27	�������� ��� ����������� �2, 0.1�
modbus_registers[53]=(char)(bps[1]._Ii%256);
modbus_registers[54]=(char)(bps[1]._Ti/256);				//���28	����������� ��������� ����������� �2, 1��
modbus_registers[55]=(char)(bps[1]._Ti%256);
modbus_registers[56]=(char)(bps[1]._av/256);				//���29	���� ������ ����������� �2, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[57]=(char)(bps[1]._av%256);
modbus_registers[58]=(char)(bps[2]._Uii/256);			//���30	�������� ���������� ����������� �3, 0.1�
modbus_registers[59]=(char)(bps[2]._Uii%256);
modbus_registers[60]=(char)(bps[2]._Ii/256);				//���31	�������� ��� ����������� �3, 0.1�
modbus_registers[61]=(char)(bps[2]._Ii%256);
modbus_registers[62]=(char)(bps[2]._Ti/256);				//���32	����������� ��������� ����������� �3, 1��
modbus_registers[63]=(char)(bps[2]._Ti%256);
modbus_registers[64]=(char)(bps[2]._av/256);				//���33	���� ������ ����������� �3, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[65]=(char)(bps[2]._av%256);
modbus_registers[66]=(char)(bps[3]._Uii/256);			//���34	�������� ���������� ����������� �4, 0.1�
modbus_registers[67]=(char)(bps[3]._Uii%256);
modbus_registers[68]=(char)(bps[3]._Ii/256);				//���35	�������� ��� ����������� �4, 0.1�
modbus_registers[69]=(char)(bps[3]._Ii%256);
modbus_registers[70]=(char)(bps[3]._Ti/256);				//���36	����������� ��������� ����������� �4, 1��
modbus_registers[71]=(char)(bps[3]._Ti%256);
modbus_registers[72]=(char)(bps[3]._av/256);				//���37	���� ������ ����������� �4, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[73]=(char)(bps[3]._av%256);
modbus_registers[74]=(char)(bps[4]._Uii/256);			//���38	�������� ���������� ����������� �5, 0.1�
modbus_registers[75]=(char)(bps[4]._Uii%256);
modbus_registers[76]=(char)(bps[4]._Ii/256);				//���39	�������� ��� ����������� �5, 0.1�
modbus_registers[77]=(char)(bps[4]._Ii%256);
modbus_registers[78]=(char)(bps[4]._Ti/256);				//���40	����������� ��������� ����������� �5, 1��
modbus_registers[79]=(char)(bps[4]._Ti%256);
modbus_registers[80]=(char)(bps[4]._av/256);				//���41	���� ������ ����������� �5, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[81]=(char)(bps[4]._av%256);
modbus_registers[82]=(char)(bps[5]._Uii/256);			//���42	�������� ���������� ����������� �6, 0.1�
modbus_registers[83]=(char)(bps[5]._Uii%256);
modbus_registers[84]=(char)(bps[5]._Ii/256);				//���43	�������� ��� ����������� �6, 0.1�
modbus_registers[85]=(char)(bps[5]._Ii%256);
modbus_registers[86]=(char)(bps[5]._Ti/256);				//���44	����������� ��������� ����������� �6, 1��
modbus_registers[87]=(char)(bps[5]._Ti%256);
modbus_registers[88]=(char)(bps[5]._av/256);				//���45	���� ������ ����������� �6, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[89]=(char)(bps[5]._av%256);
modbus_registers[90]=(char)(bps[6]._Uii/256);			//���46	�������� ���������� ����������� �7, 0.1�
modbus_registers[91]=(char)(bps[6]._Uii%256);
modbus_registers[92]=(char)(bps[6]._Ii/256);				//���47	�������� ��� ����������� �7, 0.1�
modbus_registers[93]=(char)(bps[6]._Ii%256);
modbus_registers[94]=(char)(bps[6]._Ti/256);				//���48	����������� ��������� ����������� �7, 1��
modbus_registers[95]=(char)(bps[6]._Ti%256);
modbus_registers[96]=(char)(bps[6]._av/256);				//���49	���� ������ ����������� �7, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[97]=(char)(bps[6]._av%256);
modbus_registers[98]=(char)(bps[7]._Uii/256);			//���50	�������� ���������� ����������� �8, 0.1�
modbus_registers[99]=(char)(bps[7]._Uii%256);
modbus_registers[100]=(char)(bps[7]._Ii/256);				//���51	�������� ��� ����������� �8, 0.1�
modbus_registers[101]=(char)(bps[7]._Ii%256);
modbus_registers[102]=(char)(bps[7]._Ti/256);				//���52	����������� ��������� ����������� �8, 1��
modbus_registers[103]=(char)(bps[7]._Ti%256);
modbus_registers[104]=(char)(bps[7]._av/256);				//���53	���� ������ ����������� �8, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[105]=(char)(bps[7]._av%256);

modbus_tx_buff[0]=adr;
modbus_tx_buff[1]=func;
//modbus_tx_buff[2]=(char)(reg_adr/256);
//modbus_tx_buff[3]=(char)(reg_adr%256);
//modbus_tx_buff[4]=(char)(reg_quantity/256);
//modbus_tx_buff[5]=(char)(reg_quantity%256);
modbus_tx_buff[2]=(char)(reg_quantity*2);
/*
modbus_registers[0]=0x10;
modbus_registers[1]=0x11;
modbus_registers[2]=0x12;
modbus_registers[3]=0x13;
modbus_registers[4]=0x14;
modbus_registers[5]=0x15;
*/

//if((reg_adr<17)&&(reg_quantity<10))
	{
	mem_copy((char*)&modbus_tx_buff[3],(char*)&modbus_registers[(reg_adr-1)*2],reg_quantity*2);
	}
crc_temp=CRC16_2(modbus_tx_buff,(reg_quantity*2)+3);

modbus_tx_buff[3+(reg_quantity*2)]=crc_temp%256;
modbus_tx_buff[4+(reg_quantity*2)]=crc_temp/256;

for (i=0;i<(5+(reg_quantity*2));i++)
	{
	putchar0(modbus_tx_buff[i]);
	}
}

