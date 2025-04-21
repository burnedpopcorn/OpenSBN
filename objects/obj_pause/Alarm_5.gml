var rm = savedroom;
ds_list_clear(global.saveroom);
ds_list_clear(global.baddieroom);
stop_music();
global.levelreset = false;
scr_playerreset();

with (obj_player1)
{
    targetRoom = rm;
    targetDoor = "A";
}
