switch (targetRoom)
{
    case hub_world1:
        global.levelcompletename = "SPACE";
        break;
        break;
    
    default:
        global.levelcompletename = -4;
        break;
}

var gate = id;

with (obj_player1)
{
    if (place_meeting(x, y, other) && input_check("up") && grounded && (state == states.normal || state == states.mach1 || state == states.mach2 || state == states.mach3) && !instance_exists(obj_noisesatellite) && !instance_exists(obj_fadeout) && state != states.victory && state != states.comingoutdoor && obj_player1.spotlight == 1)
    {
        stop_music(false);
        global.leveltosave = other.level;
        global.leveltorestart = -4;
        backtohubstartx = x;
        backtohubstarty = y;
        backtohubroom = room;
        mach2 = 0;
        obj_camera.chargecamera = 0;
        image_index = 0;
        state = states.victory;
        xscale = 1;
        obj_player2.backtohubstartx = x;
        obj_player2.backtohubstarty = y;
        obj_player2.backtohubroom = room;
        
        if (global.coop == true)
        {
            with (obj_player2)
            {
                x = obj_player1.x;
                y = obj_player1.y;
                mach2 = 0;
                obj_camera.chargecamera = 0;
                image_index = 0;
                state = states.victory;
            }
        }
    }
}

with (obj_player2)
{
    if (place_meeting(x, y, other) && input_check("up") && grounded && (state == states.normal || state == states.mach1 || state == states.mach2 || state == states.mach3) && !instance_exists(obj_noisesatellite) && !instance_exists(obj_fadeout) && state != states.victory && state != states.comingoutdoor && obj_player1.spotlight == 0)
    {
        stop_music();
        global.leveltosave = other.level;
        global.leveltorestart = -4;
        backtohubstartx = x;
        backtohubstarty = y;
        backtohubroom = room;
        mach2 = 0;
        obj_camera.chargecamera = 0;
        image_index = 0;
        state = states.victory;
        obj_player1.backtohubstartx = x;
        obj_player1.backtohubstarty = y;
        obj_player1.backtohubroom = room == hub_world1;
        
        if (global.coop == true)
        {
            with (obj_player1)
            {
                x = obj_player2.x;
                y = obj_player2.y;
                mach2 = 0;
                obj_camera.chargecamera = 0;
                image_index = 0;
                state = states.victory;
            }
        }
    }
}

if ((floor(obj_player1.image_index) == (obj_player1.image_number - 1) && obj_player1.state == states.victory) || (floor(obj_player2.image_index) == (obj_player2.image_number - 1) && obj_player2.state == states.victory))
{
    with (obj_player1)
    {
        obj_music.fadeoff = 0;
        targetDoor = "A";
        targetRoom = other.targetRoom;
        
        if (!instance_exists(obj_titlecard))
        {
            with (instance_create(x, y, obj_titlecard))
            {
                titlecard_sprite = gate.titlecard_sprite;
                titlecard_index = gate.titlecard_index;
                title_sprite = gate.title_sprite;
                title_index = gate.title_index;
                title_music = gate.title_music;
                group_arr = gate.group_arr;
            }
        }
    }
}
