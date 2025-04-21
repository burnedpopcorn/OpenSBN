event_inherited();
dialog[0] = dialog_create("i AM IN THE BATTLE FIELD");
dialog[1] = dialog_create("flarple");
dialog[2] = dialog_create("insert text here.", -4, function()
{
    if (global.peppermancutscene1 == -4 || !global.peppermancutscene1)
    {
        global.peppermancutscene1 = 1;
        quick_ini_write_real(get_savefile_ini(), "cutscene", "pepperman1", 1);
    }
    
    exit;
});
