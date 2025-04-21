depth = -998;
state = UnknownEnum.Value_1;
pause_surf = -4;
pause_spr = -4;
pauseAlpha = 0;
pauseScale = 5;
pauseX = -708;
pauseY = -802;
bg_surf = -4;
bgX = 0;
bgY = 0;
selected = 0;
pause_menu = ["RESUME", "OPTIONS", "RESTART LEVEL", "EXIT LEVEL"];
cursor_index = 0;
cursor_sprite_number = sprite_get_number(spr_cursor);
cursor_sprite_height = sprite_get_height(spr_cursor);
toppin_sprite[0] = spr_pause_tomato;
toppin_sprite[1] = spr_pause_pineapple;
toppin_sprite[2] = spr_pause_shroom;
toppin_sprite[3] = spr_pause_sausage;
toppin_sprite[4] = spr_pause_cheese;

for (i = 0; i < array_length(toppin_sprite); i++)
{
    toppin_number[i] = sprite_get_number(toppin_sprite[i]);
    toppin_index[i] = 0;
    toppin_has[i] = 0;
}

stopInputs = false;
pauseMusic = fmod_createEventInstance("event:/music/pause");
global.PauseInstances = ds_list_create();
savedPanic = false;
savedJanitor = false;
savedSecrets = 0;
realPauseAlpha = 0;
