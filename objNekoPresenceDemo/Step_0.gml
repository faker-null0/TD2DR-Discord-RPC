/// @description Update Discord

np_update();

if (global.discord_initialized && alarm[0] == -1)
{
	alarm[0] = room_speed * 5;
}