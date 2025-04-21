with (other)
{
    if (state == states.handstandjump || state == states.lungeattack || state == states.punch)
    {
        image_index = 0;
        sprite_index = spr_shotgunpullout;
        instance_destroy(other);
        shotgunAnim = 1;
        state = states.shotgun;
        tv_push_prompt_once(tv_create_prompt("This is the shotgun powerup text", tv_prompttypes.normal, spr_tv_shotgun, 3), "shotgun");
        global.heattime = 60;
    }
}
