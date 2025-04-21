var player = other.id;
var kill = false;

if (abs(player.hsp) > killspeed || player.instakillmove || player.state == states.punch || player.state == states.handstandjump)
{
    kill = true;
}
else if (player.y < y && player.vsp > 1)
{
    kill = true;
    
    with (player)
    {
        vsp = -8;
        particle_set_scale(particle.highjumpcloud2, xscale, 1);
        create_particle(x, y, particle.highjumpcloud2, 0);
    }
}

if (kill)
    instance_destroy();
