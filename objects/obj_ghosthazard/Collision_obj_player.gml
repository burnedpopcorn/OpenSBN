with (other)
{
    if (character == "V")
    {
        scr_hurtplayer(id);
    }
    else if (!isgustavo && state != states.ghost && state != states.ghostpossess && state != states.actor && state != states.Parry && state != states.gotoplayer)
    {
        scr_losepoints();
        tv_push_prompt_once(tv_create_prompt("This is the ghost transformation text", tv_prompttypes.normal, spr_null, 3), "ghost");
        grav /= 2;
        state = states.ghost;
        sprite_index = spr_ghostidle;
        
        with (instance_create(x, y, obj_baddieDead))
        {
            hsp = other.image_xscale * 3;
            image_xscale = -other.image_xscale;
            sprite_index = other.spr_dead;
        }
        
        other.debris = 0;
    }
}
