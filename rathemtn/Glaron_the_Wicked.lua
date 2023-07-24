function event_say(e)
	if(e.message:findi("hail")) then --Part of Shaman Epic 1.0
		e.self:Say("Are you the one they sent to help our cause? I should have known they would send a green witch doctor to serve Bertoxxulous and myself. Very well, you will have to suffice. I have a [task] you must fulfill if you wish to know the blessing of my god and impress your masters.");
	elseif(e.message:findi("task")) then --Part of Shaman Epic 1.0
		e.self:Emote("brandishes a long, wicked-looking bone dagger and there is a horrid, diseased stench as soon as he unsheathes it. He draws another blade, shorter and wider than the first, of blackened bone with a larger than normal hilt, obviously for defense. He says, 'This festering blade is called Woe, and this scorched one is called Envy. They were created on the Plane of Decay by Bertoxxulous' own hands. He has judged me worthy of the protection of such holy relics. However, there is one in these very mountains who seeks to destroy these relics. End this idiot follower of Marr's life and bring me proof.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1675})) then --Part of Shaman Epic 1.0
		e.self:Say("Hahahah! Even you were able to do away with that fool. It is only a matter of time before Bertoxxulous, with the help of devout followers like myself, wipes out all who attempt to stop the spread of filth and decay. You have done well, shaman, and your masters will be pleased with what you have done for me and my treasures. Take this and give it to your master. He will reward you.");
		e.other:QuestReward(e.self,0,0,0,0,1669);
		eq.depop_with_timer();
	end
end

--Submitted by: Jim Mills (Gilmore Girls`Is`Awesome`XOXO)
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------