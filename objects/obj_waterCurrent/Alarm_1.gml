instance_create(random_range(bbox_left, bbox_right), random_range(bbox_top, bbox_bottom), obj_waterCurrentStreak, 
{
    fromCurrent: id,
    currentDirection: image_angle,
    currentMovespeed: currentMovespeed
});
alarm[1] = random_range(60, 75);
