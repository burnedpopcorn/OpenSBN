for (var j = 0; j < array_length(menuarr); j++)
{
    var m = menuarr[j];
    
    for (var i = 0; i < array_length(m.options); i++)
    {
        var b = m.options[i];
        
        if (b.type == UnknownEnum.Value_5)
            b.silence();
    }
}
