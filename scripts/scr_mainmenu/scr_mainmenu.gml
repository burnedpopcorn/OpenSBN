function get_percentage()
{
    var count = 0;
    var levels = ["midway", "fish"];
    var level_count = array_length(levels);
    var cont_level = 100 - level_count;
    var cont_rank = cont_level / (4 * level_count);
    var p_count = 0;
    var s_count = 0;
    var clear_count = 0;
    
    for (var i = 0; i < level_count; i++)
    {
        var level = levels[i];
        
        if (ini_read_real("Treasure", level, 0) > 0)
            count++;
        
        if (ini_read_real("Toppin", concat(level, "S"), 0) > 0)
            s_count++;
        
        var r = string_lower(ini_read_string("Ranks", level, "d"));
        
        if (r != "d")
            clear_count++;
        
        switch (r)
        {
            case "c":
                count += (1 * cont_rank);
                break;
            
            case "b":
                count += (2 * cont_rank);
                break;
            
            case "a":
                count += (3 * cont_rank);
                break;
            
            case "p":
                p_count++;
            
            case "s":
                count += (4 * cont_rank);
                break;
        }
    }
    
    count = floor(count);
    count = clamp(count, 0, 100);
    
    if (p_count >= level_count)
        count++;
    
    if (s_count >= level_count)
        count++;
    
    if (clear_count >= level_count)
        ini_write_real("Game", "cleared", 1);
    
    return count;
}
