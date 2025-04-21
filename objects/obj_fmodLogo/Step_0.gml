image_alpha = approach(image_alpha, targetAlpha, 0.05);

if (keyboard_check_pressed(vk_anykey) || scr_checkanygamepad(0))
    targetAlpha = -1;

if (image_alpha <= -0.5)
    room_goto(rm_DESERT);
