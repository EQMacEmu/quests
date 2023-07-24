
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);

	if ( qglobals.zeks ) then
		e.other:Message(0, "Giwin Mirakon tells you, 'Well go on then, what are you cowering around for, let us see what kind of warrior you are!'");
	else
		if ( e.message:findi("hail") ) then		
				e.other:Message(0, "Giwin Mirakon tells you, 'How did you get in here?  Hrmm no matter, you will be helping me now for I am a [great warrior] of Rallos Zek and I know you wish not to provoke my fury!'");

		elseif ( e.message:findi("great warrior") ) then
			e.other:Message(0, "Giwin Mirakon tells you, 'Yeah, you heard me!  You know that I must be important if Rallos himself has plucked me from the battlefield to complete this [task].  Even though I serve my lord, I am desperate to return to my place on the eternal battlefield.'");
			
		elseif ( e.message:findi("task") ) then
			e.other:Message(0, "Giwin Mirakon tells you, 'Ya, you see Rallos sent me here to contract the machines to work on a mana powered piece of machinery that could test all on the eternal battlefield.  This weapon of ultimate destruction is taking quite a long time to be completed.  You know... if you were to go [test the machine] and it were to fail against you I could be on my way back to tell Rallos that it was defeated by mere mortals.  Help me to get back to the battlefield and out of this rusted out junk heap.'");
			
		elseif ( e.message:findi("test the machine") ) then
			e.other:Message(0, "Giwin Mirakon tells you, 'Haha!  I knew I sensed the warring spirit within you.  Go through over there.  Ignore those steam powered soldiers and their talk of perimeters.  Go into the main construction area, you will know you are there when you see power carriers taking energy to power up the machine.  If you can stop the energy carriers from releasing their energy the machine will activate to see what has happened.  I shall come to check on you and take a full report when you have destroyed it.  Long live Rallos!'");
			eq.set_global("zeks", "1", 5, "F");
			e.other:Message(15, "You have received a character flag!");
		end
	end
end

function event_trade(e)

	local itemInst, item;
	
	for i = 1, 4 do
	
		itemInst = e.trade["item"..i];
		
		if ( itemInst and itemInst.valid ) then
			item = itemInst:GetItem();
		
			e.self:Say("Thanks for the "..itemInst:GetName().." "..e.other:GetCleanName()..".");
			
			if ( item:NoDrop() == 255 and e.self:CountLoot() < 30 ) then
				e.self:RemoveItem(itemInst:GetID()) -- prevent multiples
				e.self:AddItem(itemInst:GetID(), itemInst:GetCharges(), true);
			end
		end
	end
end
