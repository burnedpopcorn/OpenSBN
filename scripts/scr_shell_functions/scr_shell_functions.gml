function scr_shell_openconsole()
{
    global.shellactivate = true;
    
    with (obj_shell)
        alarm[0] = -1;
}

function scr_shell_closeconsole()
{
    with (obj_shell)
        alarm[0] = 3;
}

function scr_shell_roomstart()
{
    toggle_collision_function();
}
