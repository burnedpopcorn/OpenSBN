if (!active)
    exit;

var _xold = x;
var _yold = y;
var vec = point_direction(x, y, obj_player1.x, obj_player1.y);
var _dist = teleportDistance;

if (!bbox_in_camera(view_camera[0]))
{
    var _ccx = camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 4) + ((camera_get_view_width(view_camera[0]) / 2) * (x > camera_get_view_x(view_camera[0])));
    var _ccy = camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 4) + ((camera_get_view_height(view_camera[0]) / 2) * (y > camera_get_view_y(view_camera[0])));
    _dist = point_distance(x, y, _ccx, _ccy);
}

var _dp = distance_to_object(obj_player1);
x += lengthdir_x(_dist, vec);
y += lengthdir_y(_dist, vec);

if (_dp < _dist)
{
    x = obj_player1.x;
    y = obj_player1.y;
}

while (place_meeting(x, y, obj_solid))
{
    x += lengthdir_x(1, vec);
    y += lengthdir_y(1, vec);
}

var i = 0;

while (!place_meeting(x, y + 1, obj_solid))
{
    if (i > room_height)
        break;
    
    var _col = instance_place(x, y + i + 1, obj_solid);
    
    if (_col == -4)
    {
        i++;
        continue;
    }
    
    y += i;
}

_dist = point_distance(x, y, obj_player1.x, obj_player1.y);
var s = _dist / initialDistance;
fmod_event_setParameter(snd_scream, "state", s, 1);
fmod_event_play(snd_scream);
fmod_event_play(snd_teleport);
dimOpacity = 0.8;

if (teleportCooldown > 30)
    teleportCooldown -= 30;

alarm[0] = teleportCooldown;
