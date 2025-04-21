instance_create(random_range(bbox_left, bbox_right), random_range(bbox_top, bbox_bottom), obj_waterBubble, 
{
    fromCurrent: id,
    currentDirection: image_angle,
    currentMovespeed: currentMovespeed
});
alarm[0] = random_range(15, 50);
