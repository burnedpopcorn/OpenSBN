if (place_meeting_collision(x, y))
    exit;

if (state != enemystates.grabbed && state != enemystates.pummel && state != enemystates.hit && state != UnknownEnum.Value_268 && (!place_meeting(x, y, obj_destructibles) || place_meeting(x, y, obj_onewaybigblock)))
    instance_destroy();
