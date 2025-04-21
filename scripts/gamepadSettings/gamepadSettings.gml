function gamepad_vibrate_constant(argument0, argument1)
{
    with (obj_inputController)
    {
        vibration1 = argument0 / 100;
        vibrationDecay1 = argument1;
    }
    
    gamepad_set_vibration(global.player_input_device, obj_inputController.vibration1, obj_inputController.vibration1);
}
