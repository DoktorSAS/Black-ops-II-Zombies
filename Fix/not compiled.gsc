
#include common_scripts\utility;
#include maps\mp\zombies\_zm;
#include maps\mp\zombies\_zm_utility;
#include maps\mp\gametypes_zm\_hud_util;
#include maps\mp\gametypes_zm\_hud_message;
#include maps\mp\_utility;
#include common_scripts\utility;
#include maps/mp/zombies/_zm_weapons;
#include maps\mp\zombies\_zm_powerups;
#include maps/mp/zombies/_zm_utility;
#include maps/mp/zombies/_zm_weapons;
#include maps/mp/zombies/_zm;
#include maps/mp/zombies/_zm_perks;
#include maps/mp/zombies/_zm_zonemgr;

init()
{
    level thread onPlayerConnect();
    level thread setPlayersToSpectator();
    level thread server_fix();
}
print_to_all( msg ){
	foreach( player in level.players)
		player iprintln( msg );
}
server_fix(){
 	level waittill("connected", player);
    weaponKeys = getArrayKeys( level.zombie_weapons );
    foreach ( weapon in weaponKeys ){
        if ( weapon == "emp_grenade_zm" ){
            level.zombie_weapons[ weapon ].is_in_box = 0;
        }
    }
    level waittill("end_game");
	wait 15; //20 is ideal
    map_restart( false );
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
onPlayerConnect(){
    for(;;){
        level waittill("connected", player);
        player thread onPlayerSpawned();
        //logPrint("Connected -> GUID: " + player getguid() + " username: " + player.name);
    }
}

onPlayerSpawned(){
    self endon("disconnect");
	level endon("game_ended");
    for(;;){
        self waittill("spawned_player");
	
    }
}
