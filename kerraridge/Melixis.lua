function event_say(e)
	if(e.other:GetFactionValue(e.self) >= -500) then
		if(e.message:findi("hail")) then
			e.self:Say("Welcome to Melixis' shop. Rrrr. Feel free to brrrowse thrrrough my warrres. Melixis also find some [shiny tings] she may trade you.");
		elseif(e.message:findi("shiny tings")) then
			e.self:Say("In Melixis' travels of the Odus, she find a [dull ring], a [kinda shiny ring], and a [really shiny ring].  Maybe you want to trade for those tings?  Rrrr...");
		elseif(e.message:findi("dull ring")) then
			e.self:Say("For dat ting?  You brrring Melixis some bracket mildew.  Rarr...");
		elseif(e.message:findi("kinda shiny ring")) then
			e.self:Say("Hmm... Hamed need faerix spores forrr potion. Rrrrr. You brring some to Melixis and she give you the kinda shiny ring.");
		elseif(e.message:findi("really shiny ring")) then
			e.self:Say("You go find degenerated guk weed and Melixis gives you the really shiny ring.");
		end
	else
		e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFactionValue(e.self) >= -500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 14042})) then
		e.self:Say("Many thanks... rrrr... here is dull ring.");
		e.other:QuestReward(e.self,0,0,0,0,13733);
	elseif(e.other:GetFactionValue(e.self) >= -500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 14043})) then
		e.self:Say("Melixis thanks you, Hamed will be pleased. A kinda shiny ring is yours.");
		e.other:QuestReward(e.self,0,0,0,0,13731);
	elseif(e.other:GetFactionValue(e.self) >= -500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 14044})) then
		e.self:Say("You done good job, furless one. Here is really shiny ring. Rarr...");
		e.other:QuestReward(e.self,0,0,0,0,13732);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--EOF - The text is not accurate, if anyone has the correct text please feel free to update the file accordingly
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------