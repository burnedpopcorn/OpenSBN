if (currentscore < maxscore && global.pigtotal >= maxscore && other.state == states.normal && other.grounded && other.input_check_pressed("up"))
{
    ini_open(concat("saveData", global.currentsavefile, ".ini"));
    currentscore = maxscore;
    ini_write_real("StickScore", concat("world", world), maxscore);
    global.pigreduction = maxscore;
    ini_close();
}
