visible = false;
flags.do_once_per_save = true;

condition = function()
{
    var p = instance_place(x, y, obj_player1);
    var ret = false;
    
    with (p)
    {
        ret = state != states.comingoutdoor;
        
        with (obj_music)
        {
            if (music != -4)
                fmod_event_stop(music.music_inst, true);
        }
    }
    
    return ret;
};

output = function()
{
    with (obj_player1)
    {
        state = states.oilcutscene;
        sprite_index = spr_player_oilintro1;
    }
    
    global.oiled = true;
};
