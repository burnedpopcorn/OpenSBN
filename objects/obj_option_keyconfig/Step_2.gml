if (selected == -2)
{
    if (gamepad)
    {
        for (var i = 0; i < array_length(inputs); i++)
            inputs[i] = string_concat(inputs[i], "C");
    }
    
    selected = -1;
    reading = false;
}
else if (!reading)
{
    if (input_check_pressed("up") && selected > 0)
    {
        selected--;
        event_play_oneshot("event:/SFX/ui/pauseselect", x, y);
    }
    
    if (input_check_pressed("down") && selected < (array_length(inputs) - 1) && selected > -1)
    {
        selected++;
        event_play_oneshot("event:/SFX/ui/pauseselect", x, y);
    }
    
    if (selected == -1 && (input_check_pressed("right") || input_check_pressed("down")))
        selected = 0;
    else if (input_check_pressed("left"))
        selected = -1;
    
    if (input_check_pressed("jump"))
    {
        if (selected == -1)
        {
            with (obj_option_keyconfig)
                instance_destroy();
            
            event_play_oneshot("event:/SFX/ui/pauseselect", x, y);
            exit;
        }
        
        reading = true;
    }
    
    if (input_check_pressed("taunt"))
    {
        if (selected != -1)
        {
            var inp = input_get(inputs[selected]);
            
            if (gamepad)
                inp.gpInputs = [];
            else
                inp.keyInputs = [];
            
            input_save(inp);
        }
    }
    
    for (var i = 0; i < array_length(inputs); i++)
    {
        var p = inputs[i];
        var optional = ["superjump", "superjumpC", "groundpound", "groundpoundC"];
        
        if (!array_contains(optional, p))
        {
            var in = input_get(p);
            
            if ((!gamepad && array_length(in.keyInputs) < 1) || (gamepad && array_length(in.gpInputs) < 1))
                reading = true;
        }
    }
}
else if (!gamepad)
{
    if (keyboard_check_pressed(vk_anykey))
    {
        if (!array_contains(input_get(inputs[selected]).keyInputs, keyboard_key))
        {
            array_push(input_get(inputs[selected]).keyInputs, keyboard_key);
            reading = false;
            input_save(input_get(inputs[selected]));
        }
        else if (array_length(input_get(inputs[selected]).keyInputs) > 0)
        {
            reading = false;
            input_save(input_get(inputs[selected]));
        }
    }
}
else
{
    if (keyboard_check_pressed(vk_anykey))
    {
        reading = false;
        exit;
    }
    
    var gpinput = scr_checkanygamepad(global.player_input_device);
    
    if (gpinput == -4)
        gpinput = scr_check_joysticks(global.player_input_device);
    
    if (gpinput != -4)
    {
        if (!array_contains(input_get(inputs[selected]).gpInputs, gpinput))
        {
            array_push(input_get(inputs[selected]).gpInputs, gpinput);
            reading = false;
            input_save(input_get(inputs[selected]));
        }
        else if (array_length(input_get(inputs[selected]).gpInputs) > 0)
        {
            reading = false;
            input_save(input_get(inputs[selected]));
        }
    }
}
