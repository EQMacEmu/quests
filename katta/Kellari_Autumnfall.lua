function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings friend. I am Kellari Autumnfall. Governess of Enchantment Studies. May I help you? If you are not here for a formal appointment. I'm afraid that I'm going to have to get back to work. I'm quite busy at the moment. so please excuse me."); 
	elseif(e.message:findi("unja sent me")) then
		e.self:Say("Governor Unja sent you?  That's a relief!  I am in dire need of an adventurer's services at this time.  The other governors have placed me in charge of deciphering the nature of the recent epidemic of undead attacks within our city's walls. I would assign some of the guards to handle this matter, but I feel that it may be best for someone who is not as well known to get more information on these attacks. Not that I do not trust our guards, mind you."); 
	elseif(e.message:findi("undead attack")) then
		e.self:Say("Most of the attacks have come from the area around the cemetery.  We have noticed that the undead there have all been covered in what appears to be the same set of arcane symbols.  I will need a complete set of those symbols to progress any further in my research.  Oddly enough, the last set that I had was removed from my quarters without my authorization.  Just make sure this set is completely legible.  The skin samples must not be damaged. Do you think you can handle this matter?"); 
	elseif(e.message:findi("colain")) then
		e.self:Say("She's been assisting with the burial ceremonies for quite some time, so she's had access to the bodies.  Bah!  She's shown promise as a cleric, but this has to be her doing. I've seen these glyphs in some of her books.  Please take the note that I just handed you to the courier that is waiting at the gate in Tenebrous.  I will alert the other governors and get the guards mobilized.  Colain Jasior should not make it out of the city, but the courier will ensure that she has no place to run to if she does."); 
	elseif(e.message:findi("handle this matter")) then
		e.self:Say("Please, place the skin samples in the separate trays within this box and return it to me.  Maybe, I'll have an idea of what to do from there by the time you're done. Thank you for your assistance. Good hunting.");
		e.other:QuestReward(e.self,0,0,0,0,17103); -- 10 Tray Specimen Kit
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3870}, 0)) then -- completed specimen kit
		e.self:Emote("looks at the various trays in the kit and turns pale, even for her normal complexion.  She looks at you and says, 'This is much worse than we thought.  We assumed that this was caused by someone from within our ranks, but I would never have thought that Colain was involved");
		e.other:QuestReward(e.self,math.random(10),math.random(10),math.random(10),math.random(10),3872,5000);  -- note from kellari
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
