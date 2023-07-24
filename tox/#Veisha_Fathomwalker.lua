--BeginFile: --Veisha_Fathomwalker.pl
--Quest for Toxullia Forest - Veisha Fathomwalker: Experienced Courier
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ". I fear I do not have time to speak with you as I am working my shift. Please contact me at a later time.");
	elseif(e.message:findi("phaeril")) then
		e.self:Say("Phaeril Nightshire is the man with whom I have found comfort during these years of hardship. He has also taken the [position] that belonged to Davorre many years ago.");
	elseif(e.message:findi("position")) then
		e.self:Say("Davorre was once the Captain of Erudin's forces. He was relieved of those duties shortly before he disappeared. Again, thank you, good sir. I shall rest easier tonight, knowing that he is alive.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12998})) then --Rolled up Note
		e.self:Say("Davorre, he is still alive! All these years I had thought him dead. He has kept his promise to me, and yet my most recent actions betray him so. I did not know. Here. Please give this to him with my most sincere regrets. I have moved on with my life and it is good to know that he is alive and well. But [Phaeril] is now my life.");
		e.other:QuestReward(e.self,0,0,0,0,12997,1000); --Veisha's Engagement Ring
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12995})) then --A Locked Chest
		e.self:Say("Vile creature! Child of heresy! My love's death shall be avenged! How dare you bring me his head in a box!");
		eq.attack(e.other:GetName());
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--EndFile: --Veisha_Fathomwalker.pl
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
