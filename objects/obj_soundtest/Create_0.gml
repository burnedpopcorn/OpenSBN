musicArr = [];
position = 0;
pos_playing = 0;
active = false;
bubbleindex = 0;

function playlistEntry(argument0, argument1) constructor
{
    path = argument0;
    desc = argument1;
    event = undefined;
    is_paused = true;
    playing = false;
    
    pause = function()
    {
        if (is_undefined(event))
            exit;
        
        is_paused = !is_paused;
        
        if (!is_paused)
            playing = true;
        
        fmod_event_setPause(event, is_paused);
    };
    
    play = function()
    {
        if (is_undefined(event))
            exit;
        
        playing = true;
        
        if (is_paused)
        {
            fmod_event_setPause(event, false);
            is_paused = false;
        }
        
        fmod_event_play(event);
    };
    
    stop = function(argument0 = false)
    {
        if (is_undefined(event))
            exit;
        
        playing = false;
        fmod_event_stop(event, argument0);
    };
    
    release = function()
    {
        if (is_undefined(event))
            exit;
        
        fmod_event_release(event);
    };
}

addSong = function(argument0, argument1 = "default description")
{
    var s = new playlistEntry(argument0, argument1);
    s.event = fmod_createEventInstance(argument0);
    array_push(musicArr, s);
};

event_user(0);
pos_last = array_length(musicArr) - 1;
