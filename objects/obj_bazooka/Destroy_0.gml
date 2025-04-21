with (instance_create(x, y, obj_explosioneffect))
{
    sprite_index = spr_bombexplosion;
    image_speed = 0.35;
}

if (bbox_in_camera(view_camera[0], 78))
    gamepad_vibrate_constant(1, 0.9);

event_play_oneshot("event:/SFX/misc/explosion", x, y);
