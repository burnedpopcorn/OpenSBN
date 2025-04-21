function __view_set_internal(argument0, argument1, argument2)
{
    switch (argument0)
    {
        case e__VW.XView:
            var __cam = view_get_camera(argument1);
            camera_set_view_pos(__cam, argument2, camera_get_view_y(__cam));
            break;
        
        case e__VW.YView:
            var __cam = view_get_camera(argument1);
            camera_set_view_pos(__cam, camera_get_view_x(__cam), argument2);
            break;
        
        case e__VW.WView:
            var __cam = view_get_camera(argument1);
            camera_set_view_size(__cam, argument2, camera_get_view_height(__cam));
            break;
        
        case e__VW.HView:
            var __cam = view_get_camera(argument1);
            camera_set_view_size(__cam, camera_get_view_width(__cam), argument2);
            break;
        
        case e__VW.Angle:
            var __cam = view_get_camera(argument1);
            camera_set_view_angle(__cam, argument2);
            break;
        
        case e__VW.HBorder:
            var __cam = view_get_camera(argument1);
            camera_set_view_border(__cam, argument2, camera_get_view_border_y(__cam));
            break;
        
        case e__VW.VBorder:
            var __cam = view_get_camera(argument1);
            camera_set_view_border(__cam, camera_get_view_border_x(__cam), argument2);
            break;
        
        case e__VW.HSpeed:
            var __cam = view_get_camera(argument1);
            camera_set_view_speed(__cam, argument2, camera_get_view_speed_y(__cam));
            break;
        
        case e__VW.VSpeed:
            var __cam = view_get_camera(argument1);
            camera_set_view_speed(__cam, camera_get_view_speed_x(__cam), argument2);
            break;
        
        case e__VW.Object:
            var __cam = view_get_camera(argument1);
            camera_set_view_target(__cam, argument2);
            break;
        
        case e__VW.Visible:
            __res = view_set_visible(argument1, argument2);
            break;
        
        case e__VW.XPort:
            __res = view_set_xport(argument1, argument2);
            break;
        
        case e__VW.YPort:
            __res = view_set_yport(argument1, argument2);
            break;
        
        case e__VW.WPort:
            __res = view_set_wport(argument1, argument2);
            break;
        
        case e__VW.HPort:
            __res = view_set_hport(argument1, argument2);
            break;
        
        case e__VW.Camera:
            __res = view_set_camera(argument1, argument2);
            break;
        
        case e__VW.SurfaceID:
            __res = view_set_surface_id(argument1, argument2);
            break;
        
        default:
            break;
    }
    
    return 0;
}
