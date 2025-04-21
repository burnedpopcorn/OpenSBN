for (var i = 0; i < array_length(musicArr); i++)
{
    var s = musicArr[i];
    s.stop(true);
    s.release();
}
