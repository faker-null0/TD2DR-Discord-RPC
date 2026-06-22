function scr_discord_rpc()
{
	if (!global.discord_initialized) exit;
	
	var state_text = "";
	var details_text = "";
	var end_time = 0;

	var current_room_name = room_get_name(room);
	var is_level = false;
	
	for (var i = 0; i < array_length(global.levels); i++)
	{
		if (room == global.levels[i].rid)
		{
			is_level = true;
			var level_name = global.levels[i].group;
			
			switch(level_name)
			{
				case "HideAndSeek2": 
					level_name = "Hide and Seek Act 2";
					break;
					
				case "RavineMist":
					level_name = "Ravine Mist";
					break;

				case "DotDotDot":
					level_name = "...";
					break;

				case "DesertTown":
					level_name = "Desert Town";
					break;

				case "YouCantRun":
					level_name = "You Can't Run";
					break;

				case "LimpCity":
					level_name = "Limp City";
					break;

				case "NotPerfect":
					level_name = "Not Perfect";
					break;

				case "KindaFair":
					level_name = "Kind and Fair";
					break;

				case "Act9":
					level_name = "Act 9";
					break;

				case "NastyParadise":
					level_name = "Nasty Paradise";
					break;

				case "PricelessFreedom":
					level_name = "Priceless Freedom";
					break;

				case "VolcanoValley":
					level_name = "Volcano Valley";
					break;

				case "Hill":
					level_name = "Hill"; 
					break;

				case "MajinForest":
					level_name = "Majin Forest";
					break;

				case "HideAndSeek":
					level_name = "Hide and Seek";
					break;

				case "TortureCave":
					level_name = "Torture Cave";
					break;

				case "DarkTower":
					level_name = "Dark Tower";
					break;

				case "HauntDream":
					level_name = "Haunting Dream";
					break;

				case "WoodDream":
					level_name = "Mystic Wood";
					break;

				case "Marijuna":
					level_name = "Echidna Ruins";
					break;

				case "Fart": 
					level_name = "Testing Place";
					break;
			}
			
			state_text = level_name;
			
			var character_name = scr_get_character_name();
			if (character_name != "")
			{
				details_text = "Playing as " + character_name;
			}
			else
			{
				details_text = "In-Game";
			}

			if (global.timeMinutes > 0 || global.timeSeconds > 0)
			{
				var total_seconds = (global.timeMinutes * 60) + global.timeSeconds;
				end_time = date_current_datetime() + total_seconds;
			}
			break;
		}
	}

	if (!is_level)
	{
		switch(room)
		{
			case room_waiting:
				state_text = "Waiting for Round to End...";
				details_text = "";
				break;
				
			case room_results:
				state_text = "End of Round (Results)";
				details_text = "";
				break;
				
			case room_message:
				state_text = "Error...";
				details_text = "";
				break;
				
			case room_connecting:
				state_text = "Connecting to Server...";
				details_text = "";
				break;
				
			case room_lobby:
				state_text = "In Lobby";
				details_text = "";
				break;
				
			case room_menu:
				state_text = "Main Menu";
				details_text = "";
				break;
				
			default:
				state_text = "";
				details_text = "";
				break;
		}
	}

	if (state_text != global.last_state || details_text != global.last_details)
	{
		global.last_state = state_text;
		global.last_details = details_text;

		if (end_time > 0)
		{
			np_setpresence_timestamps(0, end_time, false);
		}
		else
		{
			np_setpresence_timestamps(date_current_datetime(), 0, false);
		}
		
		np_setpresence(state_text, details_text, "", "");
	}
}

function scr_get_character_name()
{
	if (global.character == CHARACTER_EXE)
	{
		switch(global.exeCharacter)
		{
			case EXE_ORIGINAL:
				return "Sonic.exe";

			case EXE_CHAOS:
				return "Chaos";

			case EXE_EXETIOR:
				return "Exetior";

			case EXE_EXELLER: 
				return "Exeller";

			default:
				return "EXE";
		}
	}

	switch(global.character)
	{
		case CHARACTER_TAILS:
			return "Tails";

		case CHARACTER_KNUX:
			return "Knuckles";

		case CHARACTER_EGGMAN:
			return "Eggman";

		case CHARACTER_AMY:
			return "Amy";

		case CHARACTER_CREAM:
			return "Cream";

		case CHARACTER_SALLY:
			return "Sally";
	}

	return "";
}