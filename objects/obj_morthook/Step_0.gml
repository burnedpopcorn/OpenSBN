var _found = 0;

with (obj_player1)
{
    if (state == states.mort || state == states.mortjump || state == states.mortattack || state == states.morthook)
        _found = 1;
}

if (_found)
    image_alpha = 1;
else
    image_alpha = 0.5;
