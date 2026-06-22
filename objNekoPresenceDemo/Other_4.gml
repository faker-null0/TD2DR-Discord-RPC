/// @description Some stupid

if (!global.discord_initialized)
{
	if (!np_initdiscord(DISCORD_APP_ID, true, np_steam_app_id_empty))
	{
		exit;
	}
	else
	{
		global.discord_initialized = true;
	}
}

if (global.discord_initialized)
{
	global.current_room = room_get_name(room);
	scr_discord_rpc();
}