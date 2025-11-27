event_inherited();
dialog[0] = dialog_create("fruity mid is a game and exists");
dialog[1] = dialog_create("it will be releasing after you solve this ARG");
dialog[2] = dialog_create("bitch.", noone, function()
{
    if (global.peppermancutscene1 == noone || !global.peppermancutscene1)
    {
        global.peppermancutscene1 = 1;
        quick_ini_write_real(get_savefile_ini(), "cutscene", "pepperman1", 1);
    }
    
    exit;
});
