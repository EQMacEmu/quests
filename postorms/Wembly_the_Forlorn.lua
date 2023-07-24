-- Alternate Access: Plane of Tactics

function event_say(e)
	if ( e.other:GetFaction(e.self) <= 4 ) then
		if(e.message:findi("hail")) then
			e.self:Emote("grumbles under his breath, 'Yes, yes, I see you there. No need for you to shout I can see you just fine! Now, what was I saying? Yes that's right... let me know when you are [done].");
		elseif(e.message:findi("done")) then
			e.self:Say("Yes done! Weren't you paying attention? Once you've gathered all the pieces of the [key] bring it to me and I'll put them back together for you.");
		elseif(e.message:findi("key")) then
			e.self:Say("THE Key, you really are as thick skulled as you look. You [agree to help] me and you aren't even paying attention.");
		elseif(e.message:findi("agree to help")) then
			e.self:Say("You agree to help? Great! I haven't even told you what I needed yet, or why. It is very noble of you to offer me your assistance. I've been trapped here for a little too long, I washed up on the shore still [tied to the mast] of my ship. Wonder that I even survived the storm.");
		elseif(e.message:findi("tied to the mast")) then
			e.self:Say("The Diaku Raiders, filthy sort if you ask me. I was out on a shipping run, when Diaku attacked, they pillaged all of my goods, then tied me to the mast and left me floating a sea. Then the storm came and ate my ship, and I woke up here, I swear that I saw some [Diaku] washed up on the shore with me.");
		elseif(e.message:findi("Diaku")) then
			e.self:Say("The Diaku that attacked me! Pay attention for Karana's sake! You appear to be the fighting sort. You can help me kill the Diaku at their source in [Drunder].");
		elseif(e.message:findi("Drunder")) then
			e.self:Say("Drunder! The Fortress of Zek, the Zeks don't trust any one mortal to have free access to the fortress. The Diaku come and go in fours, and four parts are needed for entry. Of course they won't part with them easily. If you find four, and bring me four, I can make the four into one, and with one, you can get into Drunder without three more. Then, with your one, you can kill all of them. I would do it myself, but with my bad knee and all. . .");
		end
	else
		e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29216,item2 = 29217,item3 = 29218,item4 = 29219})) then
	
		if ( e.other:GetFaction(e.self) <= 4 ) then

			e.self:Say("What's this? Four pieces of a Diaku Emblem? Why ever would you give these to me? Well I think I can get them to fit back together. You know, while you have this, I would be quite happy if you would avenge the loss of my dear ship and kill every Diaku you find? Yes that would be very good indeed. Here is your key, and a key for all your companions as well.");
			e.other:Faction(e.self,1609,5); -- Askr the Lost
			e.other:Faction(e.self,1618,5); -- Storm Guardians
			
			--[[ note: this quest (and the others) adding keys to the entire group was added in the April 8 2003 patch
			
			local group = e.other:GetGroup();
			if ( group and group:GroupCount() > 0 ) then
				for i = 0, 5 do
					local member = group:GetMember(i):CastToClient();

					if ( member.valid ) then
						member:QuestReward(e.self,{itemid = 29215,exp = 150000});
					end
				end
			else
			]]
				e.other:QuestReward(e.self,{itemid = 29215,exp = 150000});
			--end			
		else
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
