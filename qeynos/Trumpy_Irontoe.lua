function event_say(e)
	local fac = e.other:GetFaction(e.self);
	if(e.message:findi("hail")) then
		e.self:Say("Heh? What's yer name? " .. e.other:GetCleanName() .. "? Never heard of ya. Now quit breathin' on me and buy us some [drinks]!");
	elseif(e.message:findi("drink") or e.message:findi("mead")) then
		e.self:Say("<BURP!> Yeah. Gimme a.. <BURP!> er.. honey mead.");
	elseif(e.message:findi("dragon")) then
		e.self:Say("What?  Dragon?  That was a joke, ya zombie!  Sheesh!   I miss [Kaladim]..");
	elseif(e.message:findi("kaladim")) then
		e.self:Say("Heh? Kaladim, you say? It's a long way from here, I tell you.. Home to us dwarves it is. I miss it sometimes though.. Its tough being a swashbuckling dwarf with my rugged good looks when all the other dwarves are so envious. Cripes, " .. e.other:GetCleanName() .. "... You got me all misty-eyed now.. <BURP> Peh! Buy me a honey mead, will ya?");
	elseif(e.message:findi("skippy")) then
		e.self:Say("Skippy? You mean that fish farmer? Heh heh heh. What a moron. And his brother [Beren] has the nerve to actually threaten ME!?.. Burp.. Bah. Remind me to tell [Kane] about that steaming pile of gnoll dung.");
	elseif(e.message:findi("beren")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Don't even mention that weakling's name. He.. burp.. Keeps threatening me. ME! Trumpy IRONTOE!!! Peh! That useless son of a goblin had better wise up and realize that in this burg if you ain't with [Kane], you are against him. And if you are against him.. burp.. you ain't nothing but a corpse.");		
		else
			e.self:Say("Heh.  Well, well, what have we here?  Seems you don't want to be part of Kane's new Qeynos huh?  Well...  You keep bugging me and the only thing you'll be a part of is the bottom of my boot!");	
		end
	elseif(e.message:findi("kane")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Ah.. burp.. that piece of cr.. eh? Oh its you.. Kane runs this burg.. or at least he will.. if [Sragg] can get his act together.");		
		else
			e.self:Say("Heh.  Well, well, what have we here?  Seems you don't want to be part of Kane's new Qeynos huh?  Well...  You keep bugging me and the only thing you'll be a part of is the bottom of my boot!");
		end
	elseif(e.message:findi("sragg")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Where did you hear that name?!? Not from me! I didn't say nothing about Sragg or those Bloodsabers or their dang temple in the sewers! Get away from me ya hobgoblins! I don't wants no trouble!");
		else
			e.self:Say("Heh.  Well, well, what have we here?  Seems you don't want to be part of Kane's new Qeynos huh?  Well...  You keep bugging me and the only thing you'll be a part of is the bottom of my boot!");
		end
	else
		e.self:Say("You had better just be... <BURP!>...  minding your own business if you know what is good for you.  Gnollbreath.  We Irontoes are a proud and strong bunch of dwarves from [Kaladim].  We crush weaklings like you.  <BURP!>");
	end
end

function event_trade(e)

	local item_lib = require("items");
	local text = "Beh! Thanks, Skippy. Why don't ya buy yourself one? And.. <gulp>.. <burp>.. get me another!";
	
	if(e.other:GetFactionValue(e.self) >= -500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13033, item2 = 13033, item3 = 13033, item4 = 13033},1,text)) then
		e.self:Say("BWAH hah hah! I knew you wasn't the loser you.. <gulp>.. <gulp>.. appear to be! I will have to tell [Kane].. <burp>.. all about you. Maybe get you in the gang!");
		-- Confirmed Live Factions
		e.other:Faction(e.self,223,1,0); -- Faction: Circle of Unseen Hands
		e.other:Faction(e.self,291,-1,0); -- Faction: Merchants of Qeynos
		e.other:Faction(e.self,230,1,0); -- Faction: Corrupt Qeynos Guards
		e.other:Faction(e.self,262,-1,0); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,273,1,0); -- Faction: Kane Bayle
		e.other:QuestReward(e.self,0,0,0,0,0,200);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
