#include common_scripts\utility;
#include maps\mp\zombies\_zm;
#include maps\mp\zombies\_zm_utility;
#include maps\mp\gametypes_zm\_hud_util;
#include maps\mp\gametypes_zm\_hud_message;
#include maps\mp\_utility;
#include common_scripts\utility;
#include maps/mp/zombies/_zm_weapons;
#include maps/mp/zombies/_zm_utility;
#include maps/mp/zombies/_zm_weapons;
#include maps/mp/zombies/_zm;
/*
	Developer: DoktorSAS
	Discord: https://discord.gg/nCP2y4J
	Mod: Zombies GunGame
	Sorex: https://github.com/DoktorSAS/Sorex/blob/main/README.md
	Description: This is a simple mod to play gungame on T6
	
	Copyright: The script was created by DoktorSAS and no one else can 
			   say they created it. The script is free and accessible to 
			   everyone, it is not possible to sell the script.
*/
init(){
	level.version = "1.0";
    level thread onPlayerConnect();
    level thread OverflowFix();
    level thread drawZombiesCounter();
    level thread setPlayersToSpectator();
    level thread message_area_manager();
    level.notifyText = createServerFontString("hudsmall" , 1.9);
    level.notifyText setPoint("CENTER", "CENTER", "CENTER", -150);
    if(!isDefined(getDvar("kinife_give_points")) || getDvar("kinife_give_points") == ""){
    	setDvar("kinife_give_points", 0);
    }else if(getDvar("kinife_give_points") == 1){
    	setDvar("kinife_give_points", 1);
    }
    if(!isDefined(getDvar("town_guns")) || getDvar("town_guns") == "")
    	setDvar("town_guns", "m1911_zm,fiveseven_zm,beretta93r_zm,judge_zm,fivesevendw_zm,mp5k_zm,870mcs_zm,rottweil72_zm,saiga12_zm,tar21_zm,fnfal_zm,m14_zm,galil_zm,barretm82_zm,dsr50_zm,fiveseven_upgraded_zm,beretta93r_upgraded_zm,judge_upgraded_zm,fivesevendw_upgraded_zm,m1911_upgraded_zm,mp5k_upgraded_zm,870mcs_upgraded_zm,rottweil72_upgraded_zm,saiga12_upgraded_zm,tar21_upgraded_zm,fnfal_upgraded_zm,m14_upgraded_zm,galil_upgraded_zm,barretm82_upgraded_zm,dsr50_upgraded_zm");
	if(!isDefined(getDvar("farm_guns")) || getDvar("farm_guns") == "")
		setDvar("farm_guns", "m1911_zm,fiveseven_zm,beretta93r_zm,judge_zm,fivesevendw_zm,mp5k_zm,pdw57_zm,870mcs_zm,rottweil72_zm,saiga12_zm,tar21_zm,fnfal_zm,m14_zm,galil_zm,barretm82_zm,dsr50_zm,fiveseven_upgraded_zm,beretta93r_upgraded_zm,judge_upgraded_zm,fivesevendw_upgraded_zm,m1911_upgraded_zm,mp5k_upgraded_zm,pdw57_upgraded_zm,870mcs_upgraded_zm,rottweil72_upgraded_zm,saiga12_upgraded_zm,tar21_upgraded_zm,fnfal_upgraded_zm,m14_upgraded_zm,galil_upgraded_zm,barretm82_upgraded_zm,dsr50_upgraded_zm,usrpg_zm,ray_gun_zm,raygun_mark2_zm,usrpg_upgraded_zm,ray_gun_upgraded_zm,raygun_mark2_upgraded_zm");
	if(!isDefined(getDvar("deposit_guns")) || getDvar("deposit_guns") == "")
		setDvar("deposit_guns", "m1911_zm,fiveseven_zm,beretta93r_zm,judge_zm,fivesevendw_zm,mp5k_zm,pdw57_zm,870mcs_zm,rottweil72_zm,saiga12_zm,tar21_zm,fnfal_zm,m14_zm,galil_zm,barretm82_zm,dsr50_zm,fiveseven_upgraded_zm,beretta93r_upgraded_zm,judge_upgraded_zm,fivesevendw_upgraded_zm,m1911_upgraded_zm,mp5k_upgraded_zm,pdw57_upgraded_zm,870mcs_upgraded_zm,rottweil72_upgraded_zm,saiga12_upgraded_zm,tar21_upgraded_zm,fnfal_upgraded_zm,m14_upgraded_zm,galil_upgraded_zm,barretm82_upgraded_zm,dsr50_upgraded_zm,usrpg_zm,ray_gun_zm,raygun_mark2_zm,usrpg_upgraded_zm,ray_gun_upgraded_zm,raygun_mark2_upgraded_zm");
	if(!isDefined(getDvar("motd_guns")) || getDvar("motd_guns") == "")
		setDvar("motd_guns", "m1911_zm,fiveseven_zm,beretta93r_zm,judge_zm,fivesevendw_zm,mp5k_zm,pdw57_zm,870mcs_zm,rottweil72_zm,saiga12_zm,tar21_zm,fnfal_zm,m14_zm,galil_zm,barretm82_zm,dsr50_zm,fiveseven_upgraded_zm,beretta93r_upgraded_zm,judge_upgraded_zm,fivesevendw_upgraded_zm,m1911_upgraded_zm,mp5k_upgraded_zm,pdw57_upgraded_zm,870mcs_upgraded_zm,rottweil72_upgraded_zm,saiga12_upgraded_zm,tar21_upgraded_zm,fnfal_upgraded_zm,m14_upgraded_zm,galil_upgraded_zm,barretm82_upgraded_zm,dsr50_upgraded_zm,usrpg_zm,ray_gun_zm,raygun_mark2_zm,usrpg_upgraded_zm,ray_gun_upgraded_zm,raygun_mark2_upgraded_zm");
	if(!isDefined(getDvar("origins_guns")) || getDvar("origins_guns") == "")
		setDvar("origins_guns", "c96_zm,fiveseven_zm,beretta93r_zm,fivesevendw_zm,mp40_zm,pdw57_zm,870mcs_zm,fnfal_zm,m14_zm,galil_zm,dsr50_zm,fiveseven_upgraded_zm,beretta93r_upgraded_zm,fivesevendw_upgraded_zm,c96_upgraded_zm,mp40_upgraded_zm,pdw57_upgraded_zm,870mcs_upgraded_zm,fnfal_upgraded_zm,m14_upgraded_zm,galil_upgraded_zm,dsr50_upgraded_zm,ray_gun_zm,raygun_mark2_zm,ray_gun_upgraded_zm,raygun_mark2_upgraded_zm");
	if(!isDefined(getDvar("burried_guns")) || getDvar("burried_guns") == "")
		setDvar("burried_guns", "m1911_zm,fiveseven_zm,beretta93r_zm,judge_zm,fivesevendw_zm,mp5k_zm,pdw57_zm,870mcs_zm,rottweil72_zm,saiga12_zm,tar21_zm,fnfal_zm,m14_zm,galil_zm,barretm82_zm,dsr50_zm,fiveseven_upgraded_zm,beretta93r_upgraded_zm,judge_upgraded_zm,fivesevendw_upgraded_zm,m1911_upgraded_zm,mp5k_upgraded_zm,pdw57_upgraded_zm,870mcs_upgraded_zm,rottweil72_upgraded_zm,saiga12_upgraded_zm,tar21_upgraded_zm,fnfal_upgraded_zm,m14_upgraded_zm,galil_upgraded_zm,barretm82_upgraded_zm,dsr50_upgraded_zm,usrpg_zm,ray_gun_zm,raygun_mark2_zm,usrpg_upgraded_zm,ray_gun_upgraded_zm,raygun_mark2_upgraded_zm");
	if(!isDefined(getDvar("nuketown_guns")) || getDvar("nuketown_guns") == "")
		setDvar("nuketown_guns", "m1911_zm,fiveseven_zm,beretta93r_zm,judge_zm,fivesevendw_zm,mp5k_zm,870mcs_zm,rottweil72_zm,saiga12_zm,tar21_zm,fnfal_zm,m14_zm,galil_zm,barretm82_zm,dsr50_zm,fiveseven_upgraded_zm,beretta93r_upgraded_zm,judge_upgraded_zm,fivesevendw_upgraded_zm,m1911_upgraded_zm,mp5k_upgraded_zm,pdw57_upgraded_zm,870mcs_upgraded_zm,rottweil72_upgraded_zm,saiga12_upgraded_zm,tar21_upgraded_zm,fnfal_upgraded_zm,m14_upgraded_zm,galil_upgraded_zm,barretm82_upgraded_zm,dsr50_upgraded_zm,usrpg_zm,ray_gun_zm,raygun_mark2_zm,usrpg_upgraded_zm,ray_gun_upgraded_zm,raygun_mark2_upgraded_zm");
	if(!isDefined(getDvar("dierise_guns")) || getDvar("dierise_guns") == "")
		setDvar("dierise_guns", "m1911_zm,fiveseven_zm,beretta93r_zm,judge_zm,fivesevendw_zm,mp5k_zm,pdw57_zm,870mcs_zm,rottweil72_zm,saiga12_zm,tar21_zm,fnfal_zm,m14_zm,galil_zm,barretm82_zm,dsr50_zm,fiveseven_upgraded_zm,beretta93r_upgraded_zm,judge_upgraded_zm,fivesevendw_upgraded_zm,m1911_upgraded_zm,mp5k_upgraded_zm,pdw57_upgraded_zm,870mcs_upgraded_zm,rottweil72_upgraded_zm,saiga12_upgraded_zm,tar21_upgraded_zm,fnfal_upgraded_zm,m14_upgraded_zm,galil_upgraded_zm,barretm82_upgraded_zm,dsr50_upgraded_zm,usrpg_zm,ray_gun_zm,raygun_mark2_zm,usrpg_upgraded_zm,ray_gun_upgraded_zm,raygun_mark2_upgraded_zm");

	level waittill("end_game");
	wait 20; //20 is ideal
    map_restart( false );
}
message_area_manager(){
	level endon("game_ended");
	level.message_area = createServerFontString("hudsmall" , 1);
	level.message_area setPoint("CENTER", "CENTER", -1000, -230);
	level.message_area setText("");
	msg = []; 
	i = 0;
	msg[0] = "^6@^7SorexProject^7 on ^5Twitter";
	msg[1] = "^6@^7DoktorSAS^7 on ^5Twitter";
	msg[2] = "^5Discord^7: ^7Discord.gg/^5nCP2y4J";
	msg[3] = "^2Donate ^7to ^5support ^7the SorexProject";
	msg[4] = "^2Donate ^7to ^1www.paypal.me/^5SorexProject";
	msg[5] = "Mod version ^1" + level.version;
	msg[6] = "Report any bugs on ^6Discord ^7or in the ^5Foru,";
	for(;;){
		level.message_area setText(msg[i]);
		level.message_area affectElement("x", 0.5, 0);
		wait 15.5;
		level.message_area affectElement("x", 0.5, 1000);
		wait 0.5;
		level.message_area setPoint("CENTER", "CENTER", -1000, -230);
		i++;
		if(i >= 7)
			i = 0;
	}
	
}
setPlayersToSpectator(){
    level endon( "stopMakingPeopleSpectators" );
    while ( 1 ){
        level.no_end_game_check = 1;
        wait 3;
        players = get_players();
        i = 0;
        while ( i < players.size ){
            if ( i == 0 ){
                i++;
            }
            players[ i ] setToSpectator();
            i++;
        }
        wait 5; 
        spawnAllPlayers();
        level notify( "stopMakingPeopleSpectators" );
    }
}
setToSpectator(){
    self.sessionstate = "spectator"; 
    if (isDefined(self.is_playing)){
        self.is_playing = false;
    }
}
spawnAllPlayers(){
    players = get_players();
    i = 0;
    while ( i < players.size ){
        if ( players[ i ].sessionstate == "spectator" && isDefined( players[ i ].spectator_respawn ) ){
            players[ i ] [[ level.spawnplayer ]]();
            if ( level.script != "zm_tomb" || level.script != "zm_prison" || !is_classic() ){
                thread maps\mp\zombies\_zm::refresh_player_navcard_hud();
            }
        }
        i++;
    }
    level.no_end_game_check = 0;
}

//Zombies Counter
drawZombiesCounter(){ //Thanks to CabConModding
    level.zombiesCountDisplay = createServerFontString("hudsmall" , 1.5);
    level.zombiesCountDisplay setPoint("CENTER", "CENTER", 325, 225);
    thread updateZombiesCounter();
}
updateZombiesCounter(){ //Thanks to CabConModding
    level endon("stopUpdatingZombiesCounter");
    while(true){
        zombiesCount = get_current_zombie_count();
        if(zombiesCount >= 0){
        	level.zombiesCountDisplay setText("Zombies: ^1" + zombiesCount);
        }else
        	level.zombiesCountDisplay setText("Zombies: ^2" + zombiesCount);
        waitForZombieCountChanged("stopUpdatingZombiesCounter");
    }
}
recreateZombiesCounter(){ //Thanks to CabConModding
    level notify("stopUpdatingZombiesCounter");
    thread updateZombiesCounter();
}
waitForZombieCountChanged(endonNotification){ //Thanks to CabConModding
    level endon(endonNotification);
    oldZombiesCount = get_current_zombie_count();
    while(true){
        newZombiesCount = get_current_zombie_count();
        if(oldZombiesCount != newZombiesCount){
            return;
        }
        wait 0.05;
    }
}
onPlayerConnect(){
    for(;;){
        level waittill("connected", player);
        player thread onPlayerSpawned();
    }
}
onPlayerSpawned(){ //Made by DoktorSAS
    self endon("disconnect");
	level endon("end_game");
	map = getDvar("ui_zm_mapstartlocation");
	self.weapons = [];
	self.index = 0;
	self.isO = false;
	switch(map){
		case "town":
			self.weapons = strTok(getDvar("town_guns"), ","); 
		break;
		case "prison":
			self.weapons = strTok(getDvar("motd_guns"), ","); 
		break;
		case "tomb":
			self.weapons = strTok(getDvar("origins_guns"), ","); 
		break;
		case "farm":
			self.weapons = strTok(getDvar("farm_guns"), ","); 
		break;
		case "processing":
			self.weapons = strTok(getDvar("burried_guns"), ",");
		break;
		case "rooftop":
			self.weapons = strTok(getDvar("dierise_guns"), ","); 
		break;
		case "nuked":
			self.weapons = strTok(getDvar("nuketown_guns"), ","); 
		break;
		
	}
	self waittill("spawned_player");
	self thread score_monitor();
	self thread weapons_fix();
    for(;;){
        self waittill("spawned_player");
    }
}

weapons_fix(){
    self endon("disconnect");
	level endon("end_game");
	
    for(;;){
		wait 0.05;
		if(self getCurrentWeapon() != self.weapons[self.index]){
			self takeweapon( self getCurrentWeapon() );
			self giveweapon(self.weapons[self.index]);
			self switchtoweapon(self.weapons[self.index]);
		}
		self givemaxammo(self getCurrentWeapon());
    }
}
score_monitor(){ 
	self endon("disconnect");
	level endon("end_game");

	if(!isDefined(getDvar("points_for_next")) || getDvar("points_for_next") == "" || getDvar("points_for_next") == 0)
		setDvar("points_for_next", 2000);
	points_needed = getDvarInt("points_for_next"); /*Points needed to reaach the next gun*/
	isTheGameEnded = true;
	
	self.info = self createFontString("objective", 1.2);
	self.info setPoint("LEFT","RIGHT", 0, 0);
	self.gun_limit = self createFontString("objective", 1.2);
	self.gun_limit setPoint("LEFT","RIGHT", 30, 0);
	self.missing = self createFontString("objective", 1.2);
	self.missing setPoint("LEFT","RIGHT", 0, -20);
	
	self.info.label = &"^5Gun^7:  ";
    self.info setValue(self.index);
	self.missing.label = &"^5Points^7:  ";
	self.missing setValue(points_needed);
	self.gun_limit.label = &" of ^1";
	self.gun_limit setValue(self.weapons.size - 1);
	
    while(isTheGameEnded){
    	while( points_needed > 0 ){
    		score = self.score;
    		wait .02;
    		if(getDvarInt("kinife_give_points") == 1 && ((self.score - score) == 130)){
    			self iprintln("Knife");
    		}else{
    			points_needed = points_needed - (self.score - score);
    		
    			self.missing setValue(points_needed);
    			self.info setValue(self.index);
    			if(self.index >= self.weapons.size)
    				isTheGameEnded = false;
    		}
    		
    	}
    	if(self.index == self.weapons.size - 1){
    		setNotifyText("^5" +self.name + " ^7is at the last weapon");
    	}if(self.index >= self.weapons.size){
    		isTheGameEnded = false;
    	}else{
    		self.index++;
    		points_needed = getDvarInt("points_for_next");
    		self.missing setValue(points_needed);
    		self.info setValue(self.index);
    		if(self.index == 10){
    			self.gun_limit setPoint("LEFT","RIGHT", 32.5, 0);
    		}else if(self.index == 100){
    			self.gun_limit setPoint("LEFT","RIGHT", 35, 0);
    		}
    	}
    }
    level notify("end_game");
}

setNotifyText(text){
	level.notifyText SetElementText(text);
	wait 2;
	textSubStr = getSubStr(text,0,text.size);
	for(i=0;i<textSubStr.size;i++)
		t = t + textSubStr[i];
	if(t == text)
		level.notifyText SetElementText("");
}
OverflowFix(){
    level waittill("connected", player);
    level.stringtable = [];
    level.textelementtable = [];
    textanchor = CreateServerFontString("default", 1);
    textanchor SetElementText("Anchor");
    textanchor.alpha = 0; 
    limit = 54;
    while(!level.gameended){      
        if (IsDefined(level.stringoptimization) && level.stringtable.size >= 100 && !IsDefined(textanchor2)){
            textanchor2 = CreateServerFontString("default", 1);
            textanchor2 SetElementText("Anchor2");                
            textanchor2.alpha = 0; 
        }
        if (level.stringtable.size >= limit){
        	 foreach(player in level.players){
        	    player.isO = true;
            	player.info SetElementText("");
            	player.text SetElementText("");
				player.missing SetElementText("");
				player.isO = false;
        	}
            if (IsDefined(textanchor2)){
                textanchor2 ClearAllTextAfterHudElem();
                textanchor2 DestroyElement();
            } 
            textanchor ClearAllTextAfterHudElem();
            level.stringtable = [];           
            foreach (textelement in level.textelementtable){
                if (!IsDefined(self.label))
                    textelement SetElementText(textelement.text);
                else
                    textelement SetElementValueText(textelement.text);
            }
            
        }           
        wait 0.01;
    }
}
SetElementText(text){
    self SetText(text);
    if (self.text != text)
        self.text = text;
    if (!IsInArray(level.stringtable, text))
        level.stringtable[level.stringtable.size] = text;
    if (!IsInArray(level.textelementtable, self))
        level.textelementtable[level.textelementtable.size] = self;
}
SetElementValueText(text){
    self.label = &"" + text;  
    if (self.text != text)
        self.text = text;
    if (!IsInArray(level.stringtable, text))
        level.stringtable[level.stringtable.size] = text;
    if (!IsInArray(level.textelementtable, self))
        level.textelementtable[level.textelementtable.size] = self;
}
DestroyElement(){
    if (IsInArray(level.textelementtable, self))
        ArrayRemoveValue(level.textelementtable, self);
    if (IsDefined(self.elemtype)){
        self.frame Destroy();
        self.bar Destroy();
        self.barframe Destroy();
    }       
    self Destroy();
}
drawtext( text, font, fontscale, x, y, color, alpha, glowcolor, glowalpha, sort ){
	hud = self createfontstring( font, fontscale );
	hud SetElementText( text );
	hud.x = x;
	hud.y = y;
	hud.color = color;
	hud.alpha = alpha;
	hud.glowcolor = glowcolor;
	hud.glowalpha = glowalpha;
	hud.sort = sort;
	hud.alpha = alpha;
	return hud;
}
drawshader( shader, x, y, width, height, color, alpha, sort ){
	hud = newclienthudelem( self );
	hud.elemtype = "icon";
	hud.color = color;
	hud.alpha = alpha;
	hud.sort = sort;
	hud.children = [];
	hud setparent( level.uiparent );
	hud setshader( shader, width, height );
	hud.x = x;
	hud.y = y;
	return hud;
}
affectElement(type, time, value){
    if(type == "x" || type == "y")
        self moveOverTime(time);
    else
        self fadeOverTime(time);
    if(type == "x")
        self.x = value;
    if(type == "y")
        self.y = value;
    if(type == "alpha")
        self.alpha = value;
    if(type == "color")
        self.color = value;
}
