/// @description Discord Event

var ev_type = async_load[? "event_type"];

if (ev_type == "DiscordReady")
{
	global.discord_initialized = true;
	ready = true;
	
	global.current_room = room_get_name(room);
	scr_discord_rpc();
}