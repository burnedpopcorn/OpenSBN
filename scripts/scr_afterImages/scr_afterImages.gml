// this and heatattack_blur are the only ones that can use palette swaps
global.AftImgColorDefinitions[afterimage.none] = 
{
    light: [c_white],
    dark: [c_black]
};
global.AftImgColorDefinitions[afterimage.heatattack_blur] = 
{
    light: [c_white],
    dark: [c_black]
};
// for mach running
global.AftImgColorDefinitions[afterimage.mach3effect] = 
{
	// (Light Pink) , (Light Yellow)
    light: [14717951, 8446200],
    dark: [3670136, 10344]
	// (Dark Purple) , (Dark Orange)
};
// unused, but seems to be old firemouth
global.AftImgColorDefinitions[afterimage.unknown3] = 
{
	// (Red Orange)
    light: [12512],
    dark: [64]
	// (Dark Red)
};
// for enemies i think
global.AftImgColorDefinitions[afterimage.red] = 
{
	// (Red Orange)
    light: [12512],
    dark: [12512]
	// (Red Orange)
};
// unused, maybe alternate mach run?
global.AftImgColorDefinitions[afterimage.unknown5] = 
{
	// (Bright Pink)
    light: [16292088],
    dark: [4726800]
	// (Dark Blue)
};
// the other player afterimage, for things like uppercut
global.AftImgColorDefinitions[afterimage.spink] = 
{
	// (Bright Pink)
    light: [16292088],
    dark: [16292088]
	// (Bright Pink)
};
// unused solid red afterimage
global.AftImgColorDefinitions[afterimage.unknown7] = 
{
	// (Red Orange)
    light: [12512],
    dark: [12512]
	// (Red Orange)
};

function afterimage_create(argument0, argument1, argument2, argument3, argument4, argument5 = 1, argument6 = 15, argument7 = false, argument8 = id)
{
    var struc = 
    {
        afterImageType: argument0,
        x: argument1,
        y: argument2,
        sprite_index: argument3,
        image_index: argument4,
        lifeTime: argument6,
        doesBlink: argument7,
        image_blend: global.AftImgColorDefinitions[argument0],
        afterImageIndex: 0,
        image_xscale: argument5,
        image_yscale: 1,
        image_alpha: 1,
        fadingAlpha: 1,
        image_angle: 0,
        vanish: false,
        ownerID: argument8,
        visible: true
    };
    ds_list_add(global.AfterImageList, struc);
    return struc;
}

function create_mach3effect(argument0, argument1, argument2, argument3, argument4, argument5 = id, argument6 = 1)
{
    var struc = afterimage_create(afterimage.mach3effect, argument0, argument1, argument2, argument3, argument4, undefined, true, argument5);
    struc.image_yscale = argument6;
    struc.image_alpha = 0.5;
    struc.afterImageIndex = choose(0, 1);
    return struc;
}

function create_spink_afterimage(argument0, argument1, argument2, argument3, argument4, argument5 = 1)
{
    var struc = afterimage_create(afterimage.spink, argument0, argument1, argument2, argument3, argument4, -1);
    struc.image_yscale = argument5;
    struc.image_alpha = 1.25;
    return struc;
}

function create_red_afterimage(argument0, argument1, argument2, argument3, argument4, argument5 = 1)
{
    var struc = afterimage_create(afterimage.red, argument0, argument1, argument2, argument3, argument4, -1);
    struc.image_yscale = argument5;
    struc.image_alpha = 0.6;
    return struc;
}

function create_blur_afterimage(argument0, argument1, argument2, argument3, argument4, argument5, argument6)
{
    var struc = afterimage_create(afterimage.heatattack_blur, argument0, argument1, argument2, argument3, argument4, -1);
    struc.image_alpha = 0.8;
    struc.image_yscale = argument5;
    struc.image_angle = argument6;
    return struc;
}

function create_heatattack_afterimage(argument0, argument1, argument2, argument3, argument4)
{
    return afterimage_create(afterimage.heatattack_blur, argument0, argument1, argument2, argument3, argument4);
    show_debug_message("BIG BONER DOWN THE LANE");
}

function create_firemouth_afterimage(argument0, argument1, argument2, argument3, argument4)
{
    return afterimage_create(afterimage.red, argument0, argument1, argument2, argument3, argument4);
    show_debug_message("BIG BONER DOWN THE LANE");
}
