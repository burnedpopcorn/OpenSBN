image_speed = 0.35;

if (sprite_index != spr_rattumbleblock && sprite_index != spr_rattumbleblock_big && sprite_index != spr_ratblock6)
    mask_index = spr_ratblock;
else
    mask_index = sprite_index;

if (anim)
    animy = approach(animy, -10, 1.5);
else
    animy = approach(animy, 0, 1.5);

if (animy == -10)
    anim = 0;
