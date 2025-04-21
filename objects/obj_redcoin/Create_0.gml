if (room == rm_blank)
    exit;

global.collected = 0;
global.collectsound = 0;
redsnd = fmod_createEventInstance("event:/SFX/misc/red coin");
depth = 11;
gotowardsplayer = 0;
movespeed = 5;
active = false;
