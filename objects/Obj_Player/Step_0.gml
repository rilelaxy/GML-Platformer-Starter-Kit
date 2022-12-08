/// @desc Core Player Logic

//Get player inputs
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

//Calculate movement
var _move = key_right - key_left;

hsp = _move * walksp;

vsp = vsp + grv;

if (place_meeting(x,y+1,Obj_IWall)) && (key_jump)
{
		vsp = -jumpsp
}

//Horizontal collision
if (place_meeting(x+hsp,y,Obj_IWall))
{
	while (!place_meeting(x+sign(hsp),y,Obj_IWall))
	{ 	
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

//Vertical collision
if (place_meeting(x,y+vsp,Obj_IWall))
{
	while (!place_meeting(x,y+sign(vsp),Obj_IWall))
	{ 	
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

//Animation
if (!place_meeting(x,y+1,Obj_IWall))
{
	image_speed = 1;
	if (vsp > 0) 
	sprite_index = Spr_PlayerA;
	
}
else
{
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = Spr_Player;
	}
	else
	{
		sprite_index = Spr_PlayerR;
	}
}

if (hsp != 0) image_xscale = sign(hsp);
