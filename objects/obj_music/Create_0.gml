global.musicMap = ds_map_create();
saved_fade = 1;
room_details = -4;
old_musicID = -4;
pausedmusic = 0;
fadeoff = 0;
global.music = 0;
global.pauseMusic = 0;
global.pillarMusic = 0;
global.secretmusic = 0;
roomname = obj_null;
arena = 0;
global.mu = -4;
music = -4;
secretmusic = -4;
musicID = -4;
secretmusicID = -4;
pillarmusicID = -4;
beatboxmusicID = -4;
secret = 0;
secretend = 0;
pillar_on_camera = 0;
prevpillar_on_camera = 0;
room_start_crossfade = 0.07;
step_crossfade = 0.1;
test_var = 0;
global.inSecret = 0;
global.inSecretend = 0;
global.treasuresnd = fmod_createEventInstance("event:/SFX/misc/foundtreasure");
pillarMusic = fmod_createEventInstance("event:/music/pillarmusic");
escapeMusic = fmod_createEventInstance("event:/music/escape");
add_music(rm_mainmenu, "event:/music/Title", undefined, function(argument0, argument1)
{
    fmod_event_setParameter(argument1, "state", 0, true);
});
add_music(rank_room, "event:/music/pillarmusic", undefined, undefined);
add_music(creditsroom, "event:/music/credits", undefined, function(argument0, argument1)
{
    fmod_event_setParameter(argument1, "state", 0, false);
});
add_music(timesuproom, "event:/music/pillarmusic", undefined, undefined);
add_music(midway_1, "event:/music/midway", "event:/music/midway_secret", undefined);
add_music(water_1, "event:/music/water", "event:/music/water_secret", function(argument0, argument1)
{
    var s = -1;
    var ext_arr = [water_1, water_2, water_3];
    
    if (!array_contains(ext_arr, argument0))
        s = 1;
    else
        s = 0;
    
    if (s != -1)
        fmod_event_setParameter(argument1, "state", s, false);
    
    fmod_event_setParameter(argument1, "state3", 0, true);
});
add_music(smb_1, "event:/music/mario", "event:/music/midway_secret", undefined);
add_music(smb_1_32, "event:/music/mario", "event:/music/midway_secret", undefined);
add_music(hub_entrancehall, "event:/music/hub", "event:/music/secret_default", undefined);
add_music(hub_mansion, "event:/music/outside", "event:/music/secret_default", undefined);
add_music(hub_world1, "event:/music/hub", "event:/music/pillarmusic", undefined);
add_music(hub_task, "event:/music/taskroom", "event:/music/secret_default", undefined);
add_music(rm_levelselect, "event:/music/Title", "event:/music/secret_default", function(argument0, argument1)
{
    fmod_event_setParameter(argument1, "state", 1, true);
});
add_music(hub_soundtest, "event:/music/pillarmusic", "event:/music/pillarmusic", undefined);
add_music(rm_testies, "event:/music/zetare", "event:/music/secret_default", undefined);
add_music(plain_1, "event:/music/unown", "event:/music/secret_default", undefined);
add_music(Loadiingroom, "event:/music/init", "event:/music/secret_default", undefined);
add_music(hub_secretdanceroom, "event:/music/init", "event:/music/secret_default", undefined);
add_music(hub_secretmidway, "event:/music/finalranking", "event:/music/secret_default", undefined);
add_music(virdesert_1, "event:/music/taskroom", "event:/music/secret_default", undefined);
add_music(rm_evilleafyishere, "event:/musicDefault", "event:/music/secret_default", undefined);
