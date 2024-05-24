function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("squints at you and gasps when he recognizes notoriety within Iksar society. He scrambles to his feet and says, 'Please, brother! Get me out of these chains so that I may escape back to Cabilis! They intend to coerce me like the others. A more tragic fate no Iksar should endure. I implore you to [help] me!'");
	elseif(e.message:findi("help")) then
		e.self:Say("Well some of the brainwashed short ones seem to know much of mechanical devices and such. Perhaps they have a tool that can get me out of these chains. If they have anything that looks useful bring it to me. I'm sure your help will be rewarded once I reach Cabilis.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14812}, 0)) then
		e.self:Emote("takes the wire and quickly saws through the rusted shackles. He hands you an icon and says as he runs off, 'Show that to the Arch Duke in Cabilis! He will reward you. Now I'm off to escape!'");
		e.other:QuestReward(e.self,{itemid = 14814, exp = 500})
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
