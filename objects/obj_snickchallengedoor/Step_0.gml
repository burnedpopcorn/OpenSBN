if (visited == 1 && sprite_index != spr_null)
    sprite_index = spr_null;

if (instance_exists(obj_noisesatellite))
    sprite_index = spr_null;

if (place_meeting(x, y, obj_doorA))
    targetDoor = "A";

if (place_meeting(x, y, obj_doorB))
    targetDoor = "B";

if (place_meeting(x, y, obj_doorC))
    targetDoor = "C";

if (place_meeting(x, y, obj_doorD))
    targetDoor = "D";
