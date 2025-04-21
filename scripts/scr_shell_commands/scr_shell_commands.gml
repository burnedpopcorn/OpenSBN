for (var i = 0; room_exists(i); i++)
    global.roomlist[i] = room_get_name(i);

for (var i = 0; object_exists(i); i++)
    global.ObjectNameList[i] = object_get_name(i);

global.showhud = true;
global.showcollisions = false;
global.shellactivate = false;

function sh_instap()
{
    global.lap++;
    global.secretfound = max(global.secretfound, 3);
    global.treasure = true;
    global.combodropped = false;
    global.prank_enemykilled = true;
    global.combotime = 999;
    global.combo = 1;
    global.collect += max(global.srank + 500, global.collect);
}

function meta_instap()
{
    return 
    {
        description: "Gives you all P rank requirements.",
        arguments: [],
        suggestions: [],
        argumentDescriptions: []
    };
}

function sh_escape(argument0)
{
    var arg0 = string(argument0[1]);
    var arg1 = argument0[2];
    var arg2 = argument0[3];
    
    switch (arg0)
    {
        case "true":
        case "1":
            arg0 = true;
            break;
        
        case "false":
        case "0":
            arg0 = false;
            break;
        
        default:
            arg0 = !global.panic;
            break;
    }
    
    scr_escapeinit();
    global.panic = arg0;
    global.minutes = real(string_digits(arg1));
    global.seconds = real(string_digits(arg2));
    global.fill = 60 * (global.seconds + (global.minutes * 60));
    global.wave = 0;
    global.maxwave = global.fill;
}

function meta_escape()
{
    return 
    {
        description: "activates escape and sets escape time",
        arguments: ["<bool>", "<min>", "<sec>"],
        suggestions: [["true", "false"], [], []],
        argumentDescriptions: ["activate/deactivate escape", "set minutes", "set seconds"]
    };
}

function sh_toggle_collisions(argument0)
{
    var arg1 = argument0[1];
    
    switch (arg1)
    {
        case "true":
        case "1":
            arg1 = true;
            break;
        
        case "false":
        case "0":
            arg1 = false;
            break;
        
        default:
            arg1 = !global.showcollisions;
            break;
    }
    
    global.showcollisions = arg1;
    toggle_collision_function();
}

function meta_toggle_collisions()
{
    return 
    {
        description: "toggles collision object visibility",
        arguments: ["<bool>"],
        suggestions: [["true", "false"]],
        argumentDescriptions: ["toggles visibility"]
    };
}

function sh_toggle_debugmode(argument0)
{
    var arg1 = argument0[1];
    
    switch (arg1)
    {
        case "true":
        case "1":
            arg1 = true;
            break;
        
        case "false":
        case "0":
            arg1 = false;
            break;
        
        default:
            arg1 = !global.DebugMode;
            break;
    }
    
    global.DebugMode = arg1;
}

function meta_toggle_debugmode()
{
    return 
    {
        description: "toggles debug mode",
        arguments: ["<bool>"],
        suggestions: [["true", "false"]],
        argumentDescriptions: ["toggles debug"]
    };
}

function toggle_collision_function()
{
    if (!variable_global_exists("showcollisionarray"))
    {
        i = 0;
        global.showcollisionarray[i++] = obj_solid;
        global.showcollisionarray[i++] = obj_secretmetalblock;
        global.showcollisionarray[i++] = obj_secretbigblock;
        global.showcollisionarray[i++] = obj_secretblock;
        global.showcollisionarray[i++] = obj_secretdestroyable;
        global.showcollisionarray[i++] = obj_slope;
        global.showcollisionarray[i++] = obj_slopePlatform;
        global.showcollisionarray[i++] = obj_platform;
        global.showcollisionarray[i++] = obj_grindrail;
        global.showcollisionarray[i++] = obj_grindrailslope;
        global.showcollisionarray[i++] = obj_sidePlatform;
        global.showcollisionarray[i++] = obj_doorA;
        global.showcollisionarray[i++] = obj_doorB;
        global.showcollisionarray[i++] = obj_doorC;
        global.showcollisionarray[i++] = obj_doorD;
        global.showcollisionarray[i++] = obj_doorE;
        global.showcollisionarray[i++] = obj_secrettile;
        global.showcollisionarray[i++] = obj_ladder;
    }
    
    var array = global.showcollisionarray;
    var length = array_length(array);
    var i = length - 1;
    
    while (i >= 0)
    {
        with (array[i])
        {
            if (object_index == array[i])
            {
                visible = global.showcollisions;
                
                if (object_index != obj_solid && object_index != obj_slope)
                    image_alpha = 0.6;
            }
        }
        
        i--;
    }
}

function sh_toggle_hud(argument0)
{
    var arg1 = argument0[1];
    
    switch (arg1)
    {
        case "true":
        case "1":
            arg1 = true;
            break;
        
        case "false":
        case "0":
            arg1 = false;
            break;
        
        default:
            arg1 = !global.showhud;
            break;
    }
    
    global.showhud = arg1;
}

function meta_toggle_hud()
{
    return 
    {
        description: "toggles the hud",
        arguments: ["<bool>"],
        suggestions: [["true", "false"]],
        argumentDescriptions: ["toggles hud"]
    };
}

function sh_room_goto(argument0)
{
    var arg1 = asset_get_index(argument0[1]);
    var arg2 = argument0[2];
    
    if (asset_get_type(argument0[1]) != 3)
        return "Can't find room " + string(argument0[1]);
    
    if (asset_get_type(argument0[1]) == 3)
    {
        obj_player1.targetRoom = arg1;
        obj_player1.targetDoor = arg2;
        instance_create(0, 0, obj_fadeout);
    }
}

function meta_room_goto()
{
    return 
    {
        description: "allows you to go to another room",
        arguments: ["<room>", "<door>"],
        suggestions: [global.roomlist, ["A", "B", "C", "D", "E", "F"]],
        argumentDescriptions: ["sets targetRoom", "sets targetDoor"]
    };
}

function sh_instance_create(argument0)
{
    var _obj = asset_get_index(argument0[1]);
    
    if (_obj > -1)
        instance_create(argument0[2], argument0[3], _obj);
}

function meta_instance_create()
{
    return 
    {
        description: "create an object",
        arguments: ["<object>", "<x>", "<y>"],
        suggestions: [global.ObjectNameList, UnknownEnum.Value_0, UnknownEnum.Value_1],
        argumentDescriptions: ["the object to create", "the X coordinate to create the object at", "the Y coordinate to create the object at"]
    };
}

function sh_noclip(argument0)
{
    if (obj_player1.state != states.debugstate)
        obj_player1.state = states.debugstate;
    else
        obj_player1.state = states.normal;
}

function meta_noclip()
{
    return 
    {
        description: "toggle noclip",
        arguments: [],
        suggestions: [],
        argumentDescriptions: []
    };
}

function sh_givestat(argument0)
{
    var arg1 = argument0[1];
    var add = argument0[2];
    
    switch (arg1)
    {
        case "combo":
            global.combo += add;
            global.combotime = 60;
            break;
        
        case "heat":
            global.style += add;
            break;
        
        case "score":
            global.collect += add;
            break;
        
        case "pepper":
            global.noisejetpack = !global.noisejetpack;
            break;
    }
}

function meta_givestat()
{
    return 
    {
        description: "Adds...",
        arguments: ["<string>", "<real>"],
        suggestions: [["combo", "heat", "score", "pepper"]],
        argumentDescriptions: ["Variable to add to", "Number to add by"]
    };
}
