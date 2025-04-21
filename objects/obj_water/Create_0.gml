canCollide = function(argument0 = obj_player1)
{
    return false;
};

repeat (irandom_range(0, 3))
    instance_create(random_range(bbox_left, bbox_right), random_range(bbox_top, bbox_bottom), obj_waterBubble);

depth = 150;
alarm[0] = random_range(25, 60);
secret = false;
altColor = 16728832;
