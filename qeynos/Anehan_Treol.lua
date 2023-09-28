function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ah.. Hello there..  " .. e.other:GetCleanName() .. ", was it?  Yes, right, " .. e.other:GetCleanName() .. ".  Anyhow, my name's Anehan Treol, member of the League of Antonican Bards.  Feel free to visit our humble guild house here in South Qeynos.  It's called the Wind Spirit's Song and we often put on free shows there.  I think you'd enjoy it.  Anyway, nice chatting with you, and I hope to see you again soon.");
	end
end

function event_trade(e)
	local item_lib =require("items");
  
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18021})) then
		e.self:Say("Oh, report time already again? Yeah, here ya go, " .. e.other:GetCleanName() .. ". Be careful around here at night, I've been seeing some rough looking characters lurking about.");
		e.other:Faction(e.self,284,10,0); -- Faction: League of Antonican Bards
		e.other:Faction(e.self,281,1,0); -- Faction: Knights of Truth
		e.other:Faction(e.self,262,1,0); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,304,-1,0); -- Faction: Ring of Scale
		e.other:Faction(e.self,285,-1,0); -- Faction: Mayong Mistmoore
		e.other:QuestReward(e.self,0,0,0,0,18022,50); -- Item: Anehans Report ; exp data confirmed
	end
	item_lib.return_items(e.self, e.other, e.trade, e.text)
end
