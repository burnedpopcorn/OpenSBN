if (room == rm_blank)
    exit;

player = (obj_player1.spotlight == 1) ? obj_player1 : obj_player2;

if (!instance_exists(obj_pizzaball))
    targetgolf = -4;

if (collect_shake > 0)
    collect_shake *= 0.5;

if (healthshaketime > 0)
{
    healthshaketime--;
    healthshake = random_range(-2, 2);
}

if (healthshaketime == 0)
    healthshake = 0;

if (obj_player1.character == "V")
{
    if (healthold != global.playerhealth)
    {
        playerhealthup = healthold < global.hp;
        healthshaketime = 30;
        healthold = global.playerhealth;
    }
}
else if (obj_player1.character == "P")
{
    if (healthold != global.hp)
    {
        playerhealthup = healthold < global.hp;
        healthshaketime = 30;
        healthold = global.hp;
    }
}

if (global.coop == true)
{
    var p1 = player;
    var p2 = (obj_player1.spotlight == 1) ? obj_player2 : obj_player1;
    p2pdistance = point_distance(p1.x, 0, p2.x, 0);
    p2pdistancex = (p1.x >= p2.x) ? (-p2pdistance / 5) : (p2pdistance / 5);
}
else
{
    p2pdistancex = 0;
}

if (floor(image_index) == 10)
    shoving = 0;

if (room == rm_threedaysremain || room == creditsroom || room == hub_secretmidway || room == hub_soundtest || room == rm_evilleafyishere || room == hub_secretdanceroom || room == rm_disclaimer || room == rm_levelselect || room == rank_room || room == timesuproom || room == Realtitlescreen || room == hub_loadingscreen || room == hub_world1 || room == hub_mansion || room == hub_entrancehall || room == rm_DESERT || room == plain_1 || room == plain_2 || room == plain_3 || room == plain_secret2)
    visible = false;
else
    visible = true;

if (!global.showhud)
    visible = false;

if (global.combo >= 10)
    global.SAGEcombo10 = 1;

if (global.combo > 0)
{
    comboend = true;
    global.savedcombo = global.combo;
    var ct = global.combotime;
    
    if (ct <= 40)
    {
        if (alarm[5] == -1)
        {
            if (ct >= 20)
                alarm[5] = 12;
            else
                alarm[5] = 5;
        }
    }
    else
    {
        combobubblevisible = 1;
    }
}
else if (comboend)
{
    comboend = false;
    event_perform(ev_alarm, 4);
}

if (shoving == 0)
    bang = 0;

if (global.seconds <= 0 && global.minutes <= 0 && ded == 0)
{
    alarm[1] = -1;
    
    if (global.miniboss)
        alarm[2] = 1;
    else
        alarm[3] = 1;
    
    ded = 1;
}

if (global.seconds > 59)
{
    global.minutes += 1;
    global.seconds -= 59;
}

if (global.redcoin > 0)
    global.redcoin--;

if (global.timedgatetimer)
{
    if (global.timedgatetime > 0)
    {
        global.timedgatetime--;
    }
    else
    {
        global.timedgatetime = 0;
        global.timedgatetimer = 0;
    }
}

if (!instance_exists(obj_ghostcollectibles))
{
    if ((global.panic == true && global.minutes < 1) || player.sprite_index == spr_null)
    {
        shake_mag = 2;
        shake_mag_acc = 3 / room_speed;
    }
    else if (global.panic == true && basement == 0)
    {
        shake_mag = 2;
        shake_mag_acc = 3 / room_speed;
    }
}

if (shake_mag > 0)
{
    shake_mag -= shake_mag_acc;
    
    if (shake_mag < 0)
        shake_mag = 0;
}

detachedby = -1;
detach = 0;
follow_golf = 0;

if (instance_exists(player) && player.state != states.timesup && player.state != states.gameover && !follow_golf && !detach)
{
    var target = player;
    var ty = target.y;
    var tx = target.x;
    var coopdistance = distance_to_object(obj_player2) / 2;
    
    if (target.state == states.backtohub)
    {
        ty = target.backtohubstarty;
    }
    else if (player.state == states.mach2 || player.state == states.mach3)
    {
        var _targetcharge = player.xscale * ((player.movespeed / 4) * 50);
        var _tspeed = 0.3;
        chargecamera = approach(chargecamera, _targetcharge, _tspeed);
    }
    else if ((abs(player.hsp) >= 16 || (player.state == states.chainsaw && player.tauntstoredmovespeed >= 16)) && player.state != states.climbwall && player.state != states.Sjump)
    {
        var _targetcharge = player.xscale * ((abs(player.movespeed) / 4) * 50);
        var _tspeed = 2;
        
        if ((_targetcharge > 0 && chargecamera < 0) || (_targetcharge < 0 && chargecamera > 0))
            _tspeed = 8;
        
        chargecamera = approach(chargecamera, _targetcharge, _tspeed);
    }
    else if (player.state == states.machslide)
    {
        chargecamera = approach(chargecamera, 0, 10);
    }
    else
    {
        chargecamera = approach(chargecamera, 0, 6);
    }
    
    var cam_width = camera_get_view_width(view_camera[0]);
    var cam_height = camera_get_view_height(view_camera[0]);
    
    if (targetgolf != -4 && !instance_exists(targetgolf))
        targetgolf = -4;
    
    var cam_x, cam_y;
    
    if (targetgolf == -4)
    {
        if (!global.coop || room == rm_levelselect || room == Realtitlescreen)
        {
            cam_x = (tx - (cam_width / 2)) + chargecamera + p2pdistancex;
            cam_y = ty - (cam_height / 2) - 50;
            cam_x = clamp(cam_x, 0, room_width - cam_width);
            cam_y = clamp(cam_y, 0, room_height - cam_height);
            camera_zoom(1, 0.035);
        }
        else if (obj_player2.state != states.titlescreen)
        {
            cam_x = ((obj_player1.x + obj_player2.x) / 2) - (cam_width / 2);
            cam_y = ((obj_player1.y + obj_player2.y) / 2) - (cam_height / 2);
            var disx = abs(obj_player1.x - obj_player2.x) / coop_zoom_width;
            var disy = abs(obj_player1.y - obj_player2.y) / coop_zoom_height;
            var dis = max(disx, disy);
            dis = max(1, dis);
            camera_zoom(dis, 0.035);
        }
    }
    else
    {
        var _px = 0;
        var _py = 0;
        
        if (global.coop)
        {
            _px = obj_player2.x;
            _py = obj_player2.y;
        }
        
        cam_x = ((obj_player1.x + targetgolf.x + _px) / 2) - (cam_width / 2);
        cam_y = ((obj_player1.y + targetgolf.y + _py) / 2) - (cam_height / 2) - 50;
        var disx = abs(obj_player1.x - targetgolf.x - _px) / coop_zoom_width;
        var disy = abs(obj_player1.y - targetgolf.y - _py) / coop_zoom_height;
        var dis = max(disx, disy);
        dis = max(1, dis);
        camera_zoom(dis, 0.035);
    }
    
    var noshake_arr = [rm_levelselect, timesuproom, rm_mainmenu];
    
    if (shake_mag != 0 && global.option_screenshake && !array_contains(noshake_arr, room))
    {
        cam_x += irandom_range(-shake_mag, shake_mag);
        cam_y += irandom_range(-shake_mag, shake_mag);
    }
    
    camera_set_view_pos(view_camera[0], cam_x, cam_y);
}
else if (follow_golf)
{
    if (instance_exists(targetgolf) && targetgolf.thrown == true)
    {
        var _xx = targetgolf.x;
        var _yy = targetgolf.y;
        var _freecamera = 0;
        _room_x = 0;
        _room_y = 0;
        var _width = room_width;
        var _height = room_height;
        
        if (room == custom_lvl_room)
        {
            if (obj_player1.cam != -4)
            {
                _room_x = obj_player1.cam.x;
                _room_y = obj_player1.cam.y;
                _width = obj_player1.cam_width;
                _height = obj_player1.cam_height;
            }
            else
            {
                _freecamera = 1;
            }
        }
        
        _width -= camera_get_view_width(view_camera[0]);
        _height -= camera_get_view_height(view_camera[0]);
        _xx -= (camera_get_view_width(view_camera[0]) / 2);
        _yy -= (camera_get_view_height(view_camera[0]) / 2);
        
        if (_freecamera)
            camera_set_view_pos(view_camera[0], _xx, _yy);
        else
            camera_set_view_pos(view_camera[0], clamp(_xx, _room_x, _width), clamp(_yy, _room_y, _height));
    }
    else
    {
        targetgolf = -4;
        follow_golf = 0;
    }
}
else if (detach)
{
    camera_zoom(max(room_width / original_cam_width, room_height / original_cam_height), 0.035);
    var _width = room_width;
    var _height = room_height;
    _width -= camera_get_view_width(view_camera[0]);
    _height -= camera_get_view_height(view_camera[0]);
    var _xx = camera_get_view_x(view_camera[0]);
    var _yy = camera_get_view_y(view_camera[0]);
    _xx = obj_player1.x - (camera_get_view_width(view_camera[0]) / 2);
    _yy = obj_player1.y - (camera_get_view_height(view_camera[0]) / 2);
    camera_set_view_pos(view_camera[0], _xx, _yy);
}
