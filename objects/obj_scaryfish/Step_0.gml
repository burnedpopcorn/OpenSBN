if (!instance_exists(obj_player1))
    exit;

x = approach(x, obj_player1.x, 10);
y = approach(y, obj_player1.y, 10);

if (obj_player1.sprite_index == spr_player_breakdance && dancecount > 0)
{
    dancecount--;
    
    if (dancecount == 0)
    {
        sprite_index = spr_dance;
        var fg = layer_get_id("Foregrounds_1");
        layer_set_visible(fg, false);
        mail_trigger(mailtriggers.dancewithscaryfish);
        
        with (obj_music)
        {
            if (music != -4)
                fmod_event_setParameter(music.music_inst, "state3", 1, true);
        }
        
        repeat (12)
        {
            with (instance_create(x - irandom_range(18, 25), y - irandom_range(18, 25), obj_confetti))
            {
                depth = other.depth + 1;
                image_xscale = chance(50) ? -1 : 1;
            }
        }
    }
}
