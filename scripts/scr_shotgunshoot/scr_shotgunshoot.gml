function scr_kungfu()
{
    event_play_oneshot("event:/SFX/bo/kungfu", x, y);
    
    if (irandom(1))
        fmod_event_play(voice_kungfu);
    
    if (movespeed < (9 * getRPGMulti("attack")))
        movespeed = 9 * getRPGMulti("attack");
    
    state = states.punch;
    image_index = 0;
    
    if (grounded)
        sprite_index = choose(spr_kungfu1, spr_kungfu2, spr_kungfu3);
    else
        sprite_index = choose(spr_kungfuair1transition, spr_kungfuair2transition, spr_kungfuair3transition);
    
    exit;
}
