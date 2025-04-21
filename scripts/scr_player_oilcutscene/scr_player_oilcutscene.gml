function state_player_oilcutscene()
{
    cutscene = true;
    var frm = floor(image_index);
    
    if (!event_isplaying(global.OilMusic))
    {
        fmod_event_play(global.OilMusic);
        fmod_global_setParameter("pillarfade", 1, false);
    }
    
    if (frm == cutscene_frame)
        exit;
    
    switch (sprite_index)
    {
        case spr_player_oilintro1:
            switch (frm)
            {
                case 8:
                    event_play_oneshot("event:/SFX/bo/grabcancel", x, y);
                    break;
                
                case 16:
                    sprite_index = spr_player_oilintro2;
                    image_index = 0;
                    break;
            }
            
            break;
        
        case spr_player_oilintro2:
            switch (frm)
            {
                case 5:
                    fmod_event_play(snd_oilup);
                    break;
                
                case 30:
                    sprite_index = spr_player_oilintro3;
                    image_index = 0;
                    
                    with (create_debris(x - 61, y - 68, spr_debris_oilcan, false))
                    {
                        hsp = -5;
                        vsp = -5;
                        image_speed = 0;
                        image_index = 0;
                    }
                    
                    break;
            }
            
            break;
        
        case spr_player_oilintro3:
            switch (frm)
            {
                case 71:
                    state = states.normal;
                    cutscene = false;
                    sprite_index = spr_idle;
                    image_index = 0;
                    fmod_global_setParameter("pillarfade", 0, false);
                    
                    with (obj_music)
                    {
                        if (music != -4)
                            fmod_event_play(music.music_inst);
                    }
                    
                    break;
            }
            
            break;
    }
    
    cutscene_frame = frm;
}
