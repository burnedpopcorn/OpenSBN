event_inherited();
dialog[0] = dialog_create("toyse");
dialog[1] = dialog_create("palceholder flavoured tuc crackers");
dialog[2] = dialog_create("bitch.", -4, function()
{
    if (global.peppermancutscene1 == -4 || !global.peppermancutscene1)
    {
        global.peppermancutscene1 = 1;
        quick_ini_write_real(get_savefile_ini(), "cutscene", "pepperman1", 1);
    }
    
    exit;
});
