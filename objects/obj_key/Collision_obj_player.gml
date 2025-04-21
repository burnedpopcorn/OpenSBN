if (room == rm_blank)
    exit;

if (global.key_inv)
    exit;

with (other)
{
    if (state != states.bombpep && state != states.gotoplayer && state != states.ghost && state != states.knightpep && state != states.cheeseball && state != states.boxxedpep && state != states.cheesepep && state != states.knightpepattack && state != states.knightpepslopes && state != states.hurt && state != states.knightpepbump)
    {
        instance_destroy(other);
        global.key_inv = 1;
        key_particles = 1;
        alarm[7] = 30;
        event_play_oneshot("event:/SFX/misc/collecttoppin");
        state = states.keyget;
        image_index = 0;
        global.heattime = 60;
    }
}
