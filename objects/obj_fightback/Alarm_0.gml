if (player == -4 || pillar == -4 || !instance_exists(pillar))
    exit;

mail_trigger(UnknownEnum.Value_10);
event_play_oneshot("event:/SFX/bo/punch", player.x, player.y);
punched = true;

with (player)
{
    if (state == states.hurt || state == states.fishhurt)
        exit;
    
    alarm[8] = 100;
    alarm[7] = 150;
    hurted = 1;
    event_play_oneshot("event:/SFX/bo/hurt", x, y);
    xscale = -sign(other.pillar.image_xscale);
    sprite_index = spr_hurtjump;
    hsp = -3 * xscale;
    movespeed = 3;
    vsp = -10;
    timeuntilhpback = 300;
    instance_create(x, y, obj_spikehurteffect);
    
    if (state == states.fishdash || state == states.fishswim || state == states.fishground)
        state = states.fishhurt;
    else
        state = states.hurt;
    
    image_index = 0;
    flash = 1;
}
