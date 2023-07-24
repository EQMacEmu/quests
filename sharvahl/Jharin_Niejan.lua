local count = 0;
function event_spawn(e)
	eq.set_timer("shifting",100000);
end

function event_timer(e)
	count = count + 1;
	if(count == 1) then
		e.self:Say("This is the tale of the time that followed the Shifting. Our people had been thrown into darkness with only a handful of heroes to guide us. Perhaps it was fate that brought us here... or maybe the spirits are calling us to their aid.");
	end
	if(count == 2) then
		e.self:Say("When the magic ripped us from our realm, we found ourselves within a strange land. We could no longer sense our guiding spirits around us, and fear began to overtake our kin. Fortunately, our king Vah Kerrath was quick to see this, and so he began to give us tasks to help our people regain their sanity and stability.");
	end
	if(count == 3) then
		e.self:Say("He sent his greatest warriors under the leadership of the great explorer Khati Sha to the north to find out more about these strange lands. King Vah Kerrath then sent another army of brave men to the west under the leadership of Dar Khura.");
	end
	if(count == 4) then
		e.self:Say("The citizens that marched into the darkness in those days were responsible for the security that we now enjoy. The bravery of Vah's leaders and our ability to come together as a people secured our sanctuary here in the darkness. Those days were full of turmoil and conflict... much like they are now.");
	end
	if(count == 5) then
		e.self:Say("Before the time of the Shifting we had the spirits to guide us, but their guidance seemed to be blocked from us by the only sense a distant creature lurking as if it was of the shadow itself.");
	end
	if(count == 6) then
		e.self:Say("Without the will of Vah to guide us through those desolate years, we might have lost everything. Our People feared that we were the only of our kind left alive and to give up would have meant that the honor of our ancestors would have surely been lost to the ages.");
	end
	if(count == 7) then
		e.self:Say("When our king passed on, we took his name as our own to show that we are strong, for he was a strong king. Under the leadership of Vah Kerrath, we survived.");
	end
	if(count == 8) then
		e.self:Say("We survived the loss of our ancestral spirits and we survived the loss of our home and our people. We stood firm against the lurking shadows and roared the name of Vah as a challenge to all who would stand against our will to live. That is how we survived the Shifting.");
	end
	if(count == 9) then
		e.self:Say("Thank you for listening. Do not fear, if you missed part of that story I will repeat it again in a little while. It is one of my favorites.");
		eq.set_timer("shifting",400000);
	end
	if(count == 10) then
		count = 0;
		eq.set_timer("shifting",100000);
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
