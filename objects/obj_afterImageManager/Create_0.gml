// 0 and 1 are the same
// 4 and 7 are the same
enum afterimage
{
	none = 0,
	heatattack_blur = 1,
	mach3effect = 2,
	red = 4,
	spink = 6,
	
	unknown3 = 3,
	unknown5 = 5,
	unknown7 = 7,
}

depth = 1;
global.AfterImageList = ds_list_create();
global.BlinkTrail = false;
blinkingBufferMax = 3;
blinkingBuffer = blinkingBufferMax;
