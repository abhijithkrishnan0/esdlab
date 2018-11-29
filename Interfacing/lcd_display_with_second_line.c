// Initial C Source File
#include "xstdsys.h"

//Please note that you have to connect H1 to LCD data and H2 to LCD control

// Define all your variables here
unsigned int cmd8[] = {0X38,0x0E,0x02,0x01,0x00};
unsigned int cmd28[] = {0xc0,0x00};
unsigned int nexLine=0xC0;

unsigned int msg1[] = {'H','e','l','l','o',0x20,'A','D','M',0x20,0x00};
unsigned int msg2[] = {'H','e','l','l','o','n','e','w',0x20,0x00};

unsigned int lcdval,index,delay_ms;


// define prototypes

void InitLPC(void);
void Delay(unsigned int);

void InitLPC(void)
{

        // use the Wizards (see Wizards menu) to configure the on-chip peripherals
	PINSEL0 = 0x00L;
	g_pGPIO0->IODIR = 0XFFFFFFFF;
}


void Delay(unsigned int dms)
{
	// the timer has to work for this loop to function
	delay_ms = dms;
	while(delay_ms > 0)
	{
	 	delay_ms--;
	}
}

void InitLCD()
{
        index=0;
        lcdval=cmd8[index];
        while(lcdval !=0x0)
        {
                g_pGPIO0->IOSET = lcdval;
                //Toggle E pin
                lcdval |= 0x400;
                g_pGPIO0->IOSET = lcdval;
                Delay(500);
                g_pGPIO0->IOCLR=0xFFFF;         
                index++;
                lcdval=cmd8[index];
        }

}
void init2lcd()
{
        index=0;
        lcdval=cmd28[index];
        while(lcdval !=0x0)
        {
                g_pGPIO0->IOSET = lcdval;
                //Toggle E pin
                lcdval |= 0x400;
                g_pGPIO0->IOSET = lcdval;
                Delay(500);
                g_pGPIO0->IOCLR=0xFFFF;         
                index++;
                lcdval=cmd28[index];
        }

}


void secondLine()
{
	g_pGPIO0->IOSET = nexLine;
                //Toggle E pin
                nexLine |= 0x400;
                g_pGPIO0->IOSET = nexLine;
                Delay(500);
                g_pGPIO0->IOCLR=0xFFFF;         
                
}


void ShowMsg(unsigned int *msg)
{
        index=0;
        lcdval=msg[index];
        while(lcdval !=0x0)
        {
                g_pGPIO0->IOSET = lcdval;
                //Toggle E pin
                lcdval |= 0x500;
                g_pGPIO0->IOSET = lcdval;
                Delay(500);
                g_pGPIO0->IOCLR=0xFFFF;         
                index++;
                lcdval=msg[index];
        }
}



void main(void)
{
	InitLPC();
        // use the Wizards (see Wizards menu) to configure the on-chip peripherals
        index=0;        
       	while(1)
	{
               InitLCD();
	       
	       ShowMsg(msg1);
	       // Delay(50000)
	       //Delay(5000);
	     secondLine();
	      // init2lcd();
	       ShowMsg(msg2);
              Delay(5000);

        }		
}