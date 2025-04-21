if (global.player_input_device < 0)
{
    visible = false;
    active = false;
    x = -100;
    y = -100;
    exit;
}

var move = gamepad_axis_value(global.player_input_device, gp_axislh);
var move2 = gamepad_axis_value(global.player_input_device, gp_axislv);

if (!active)
{
    if (abs(move) > 0.2 || abs(move2) > 0.2)
    {
        active = true;
        visible = true;
        x = xstart;
        y = ystart;
    }
    
    exit;
}

x += (move * acc);
y += (move2 * acc);
var clickingL = input_check("slap");
var clickingR = input_check("taunt");
clickedL = input_check_pressed("slap");
clickedR = input_check_pressed("taunt");
image_index = (clickingL || clickingR) ? 1 : 0;
x = clamp(x, 0, obj_gameFrame.defaultwidth + 63);
y = clamp(y, 0, obj_gameFrame.defaultheight + 63);
