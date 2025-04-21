if (!fight && instance_exists(pillar))
{
    pillar.sprite_index = spr_hungrypillar_fightback;
    pillar.image_index = 0;
    fight = true;
    player = other.id;
    other.movespeed = 0;
    other.hsp = 0;
    
    while (point_distance(other.x, other.y, pillar.x, other.y) < 192)
        other.x += sign(pillar.image_xscale);
    
    alarm[0] = 8;
}
else if (fight && instance_exists(pillar) && alarm[0] > 0)
{
    other.y = approach(other.y, pillar.y, 8);
    other.x = approach(other.x, x + 32, 8);
    other.hsp = 0;
    other.movespeed = 0;
}
