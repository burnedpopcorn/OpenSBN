image_index = 0.35;

if (room == rm_blank)
{
    if (place_meeting(x, y + 32, obj_solid))
    {
        while (!place_meeting(x, y + 1, obj_solid))
            y += 1;
    }
}

if (room == rm_blank)
    exit;

with (instance_create(x, y - 20, obj_grabmarker))
    other.ID = id;

depth = 10;
