#include misc_scripts\common\duff_common;

init()
{
	addConnectThread(::onPlayerConnected);
}
 
onPlayerConnected()
{

    if(!isDefined(self.pers["killCamMusic"]))
		self.pers["killCamMusic"] = self getstat(1602);
		
	self thread ToggleBinds();
	
	//killCamMusic
	if(self.pers["killCamMusic"] == 1){
		self setClientDvar( "kill_mute", 1 );
	}
	if(self.pers["killCamMusic"] == 0){
		self setClientDvar( "kill_mute", 0 );
	}
}

ToggleBinds()
{
	self endon("disconnect");
	
	for(;;)
	{
		self waittill("menuresponse", menu, response);

        if(response == "killcammusic")
		{		
			if(self.pers["killCamMusic"] == 0)
			{
				wait 0.5;
				self setstat(1602,1); 
				self.pers["killCamMusic"] = 1;
				self iPrintln( "^3Final killcam turned [^2ON^3]." );
			}
			else if (self.pers["killCamMusic"] == 1)
			{
				wait 0.5;
				self setstat(1602,0); 
				self.pers["killCamMusic"] = 0;
				self iPrintln( "^3Final killcam turned [^1OFF^3]." );
			}	
		}
	}
}