event_inherited();

repeat (irandom_range(0, 3))
{
    instance_create(random_range(bbox_left, bbox_right), random_range(bbox_top, bbox_bottom), obj_waterBubble, 
    {
        fromCurrent: id,
        currentDirection: image_angle,
        currentMovespeed: currentMovespeed
    });
    instance_create(random_range(bbox_left, bbox_right), random_range(bbox_top, bbox_bottom), obj_waterCurrentStreak, 
    {
        fromCurrent: id,
        currentDirection: image_angle,
        currentMovespeed: currentMovespeed
    });
}

alarm[0] = random_range(15, 50);
alarm[1] = random_range(30, 60);
