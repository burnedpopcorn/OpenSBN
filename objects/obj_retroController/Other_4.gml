if (activated && !activeRoom)
{
    activeRoom = true;
    global.srank = 2000;
    global.arank = global.srank - (global.srank / 4);
    global.brank = global.srank - ((global.srank / 4) * 2);
    global.crank = global.srank - ((global.srank / 4) * 3);
}

scanblock_y = 0;
