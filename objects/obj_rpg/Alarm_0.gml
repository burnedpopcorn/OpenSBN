if (!instance_exists(obj_player1))
{
    alarm[0] = 60;
    exit;
}

var player = obj_player1;
var jumping = input_check("jump");
var mach = player.state == states.mach2 || player.state == states.mach3 || player.state == UnknownEnum.Value_65;
var earnArr = [];

if ((player.move != 0 || mach) && player.grounded)
{
    var amt = (abs(player.hsp) > 8) ? 2 : 1;
    array_push(earnArr, ["movespeed", amt]);
}

if ((player.vsp <= -4 || jumping) && !player.grounded)
    array_push(earnArr, ["jump", 1]);

switch (player.state)
{
    case states.grab:
    case states.handstandjump:
        array_push(earnArr, ["attack", 1]);
        break;
    
    case states.punch:
        array_push(earnArr, ["defense", 1]);
        array_push(earnArr, ["attack", 1]);
        break;
    
    case states.Sjump:
        array_push(earnArr, ["jump", 1]);
        break;
    
    case states.Sjumpprep:
    case states.tumble:
    case states.crouch:
    case states.crouchjump:
    case states.hurt:
        array_push(earnArr, ["defense", 2]);
        break;
    
    case states.fishdash:
        array_push(earnArr, ["attack", 1]);
    
    case states.fishswim:
        if (player.move_h != 0 || player.move_v != 0)
            array_push(earnArr, ["swimming", 1]);
        
        break;
    
    case states.freefall:
    case states.freefallprep:
    case states.freefallland:
        array_push(earnArr, ["groundpound", 2]);
        break;
}

if (array_length(earnArr) > 0)
{
    for (var i = 0; i < array_length(earnArr); i++)
    {
        var st = earnArr[i][0];
        var a = earnArr[i][1];
        var stat = struct_get(playerStats, st);
        stat.addExp(a);
    }
    
    event_user(0);
}

while (levelup > 0)
{
    instance_create(player.x + random_range(-10, 10), player.y + random_range(-10, 10), obj_levelup);
    levelup--;
}

alarm[0] = 60;
