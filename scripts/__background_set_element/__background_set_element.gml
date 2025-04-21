function __background_set_element(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12, argument13, argument14)
{
    var __nearestdepth = 1000000000;
    var __farthestdepth = -1000000000;
    var __depthinc = 100;
    var __result;
    __result[0] = -1;
    __result[1] = -1;
    var __fgstring = "Compatibility_Foreground_";
    var __bgstring = "Compatibility_Background_";
    var __colstring = "Compatibility_Colour";
    var __fglen = string_length(__fgstring);
    var __bglen = string_length(__bgstring);
    var __layerlist = layer_get_all();
    var __layerlistlength = array_length_1d(__layerlist);
    var __collayer = -1;
    var __slots, __isforeground;
    
    for (var __i = 0; __i < 8; __i++)
    {
        __slots[__i] = -1;
        __isforeground[__i] = false;
    }
    
    var __slot, __layername;
    
    for (var __i = 0; __i < __layerlistlength; __i++)
    {
        __layername = layer_get_name(__layerlist[__i]);
        
        if (string_pos(__fgstring, __layername) > 0)
        {
            var __slotchr = string_char_at(__layername, __fglen + 1);
            
            if (__slotchr == "")
                continue;
            
            __slot = real(__slotchr);
            __slots[__slot] = __layerlist[__i];
            __isforeground[__slot] = true;
        }
        else if (string_pos(__bgstring, __layername) > 0)
        {
            var __slotchr = string_char_at(__layername, __bglen + 1);
            
            if (__slotchr == "")
                continue;
            
            __slot = real(__slotchr);
            __slots[__slot] = __layerlist[__i];
            __isforeground[__slot] = false;
        }
        else if (string_pos(__colstring, __layername) > 0)
        {
            __collayer = __layerlist[__i];
            layer_depth(__layerlist[__i], __farthestdepth);
        }
        else
        {
            var __currdepth = layer_get_depth(__layerlist[__i]);
            
            if (__currdepth < __nearestdepth)
                __nearestdepth = __currdepth;
            
            if (__currdepth > __farthestdepth)
                __farthestdepth = __currdepth;
        }
    }
    
    __farthestdepth += (__depthinc + 1000);
    __nearestdepth -= __depthinc;
    __farthestdepth = max(__farthestdepth, 2147483600);
    __nearestdepth = min(__nearestdepth, -2147482000);
    
    for (var __i = 0; __i < 8; __i++)
    {
        if (__slots[__i] != -1)
        {
            var __depth = 0;
            
            if (__isforeground[__i] == true)
                __depth = __nearestdepth - (__i * __depthinc);
            else
                __depth = __farthestdepth - __depthinc - (__slot * __depthinc);
            
            layer_depth(__slots[__i], __depth);
        }
    }
    
    if (__collayer != -1)
        layer_depth(__collayer, __farthestdepth);
    
    var __layerdepth;
    
    if (argument0 == -1)
    {
        __layername = __colstring;
        __layerdepth = __farthestdepth;
    }
    else if (argument2 == true)
    {
        __layername = __fgstring + string(argument0);
        __layerdepth = __nearestdepth - (argument0 * __depthinc);
    }
    else
    {
        __layername = __bgstring + string(argument0);
        __layerdepth = __farthestdepth - __depthinc - (argument0 * __depthinc);
    }
    
    var __layerid;
    
    if (argument0 == -1)
        __layerid = __collayer;
    else
        __layerid = __slots[argument0];
    
    if (__layerid != -1)
        layer_destroy(__layerid);
    
    __layerid = layer_create(__layerdepth, __layername);
    layer_x(__layerid, argument4);
    layer_y(__layerid, argument5);
    layer_hspeed(__layerid, argument11);
    layer_vspeed(__layerid, argument12);
    var __backel = layer_background_create(__layerid, argument3);
    layer_background_visible(__backel, argument1);
    layer_background_htiled(__backel, argument6);
    layer_background_vtiled(__backel, argument7);
    layer_background_xscale(__backel, argument8);
    layer_background_yscale(__backel, argument9);
    layer_background_stretch(__backel, argument10);
    layer_background_blend(__backel, argument13);
    layer_background_alpha(__backel, argument14);
    __result[0] = __backel;
    __result[1] = __layerid;
    return __result;
}
