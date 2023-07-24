function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings foreigner! I have for sale quality ores and clay that has been brought here by brave miners who dare the wilds of Luclin! Those grimlings don't take to kindly to people mining ore in their territory.");
	end
end
