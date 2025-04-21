if (place_meeting(x, y, obj_player1) && image_speed == 0)
    image_speed = 0.35;

if (floor(image_index) == (image_number - 1))
    instance_destroy();
