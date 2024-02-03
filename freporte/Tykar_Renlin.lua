function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Do you have any spare coppers for a thirsty soul?");
	elseif(e.message:findi("lucan")) then
		e.self:Say("That man is no just ruler. He has jailed me and my friend Zimel for merely begging.");
	elseif(e.message:findi("zimel")) then
		e.self:Say("What?! You know my friend Zimel?! I would like to speak of him, but my mouth is so parched. Maybe a fine grog would loosen my lips. I am uncertain which flavor shall do the trick.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Oooh!! That is the taste. My lips are almost loose. Maybe another will do the trick.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13829,item2 = 13829,item3 = 13829,item4 = 13829},1,text)) then --Drom's Champagne
		e.self:Say("Ahh!! That was good. Now where were we?. Oh yes. My friend Zimel is a fellow beggar. He was locked up in the arena. They were going to let him go when the Freeport Militia came for him. Ha!! He is crazy as a troll now. I took this blanket from his cell before I was released. I no longer need it and my guilt has reached its peak. I do not want crazy old Zimel to freeze. Perhaps you can return it to him.");
		e.other:QuestReward(e.self,0,0,0,0,12196,10); -- Bunker Cell #1 (Zimel's Blanket)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	if ( e.self:IsEngaged() ) then
		return;
	end

	local turn, bard;
	
	if ( e.signal == 1 ) then
		e.self:Say("Yes. Let us all live together in peace and tranquility. That is the only way.");
		turn = true;
	elseif ( e.signal == 2 ) then
		e.self:Say("Ogres smell like..<Sniff..Sniff..> .. like me!!");
		turn = true;
	elseif ( e.signal == 5 ) then
		e.self:Say("What a waste of grog and lunch.");
		turn = true;
	elseif ( e.signal == 7 ) then
		e.self:Say("That man is no just ruler. He has jailed me and my friend Zimel for merely begging.");
		turn = true;
	end

	if ( turn ) then
		bard = eq.get_entity_list():GetMobByNpcTypeID(10141);			-- NPC: Trolon_Lightleer
		if ( not bard.valid ) then
			bard = eq.get_entity_list():GetMobByNpcTypeID(10158);		-- NPC: Branis_Noolright
		end
		if ( not bard.valid ) then 
			bard = eq.get_entity_list():GetMobByNpcTypeID(10165);		-- NPC: Palana_Willin
		end
		if ( bard.valid ) then
			e.self:FaceTarget(bard);
		end
	end
end

-- END if FILE Zone:freporte -- Tykar_Renlin