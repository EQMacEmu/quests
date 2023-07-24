function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Emote("glances at you and hurriedly makes a gesture of religious meaning before you and says, 'Yes, yes, I hereby bless you in the name of Prexus. May your catch be plentiful and your nets never snag. Are there any other fishermen seeking a blessing? I'm very busy.'");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("your brother")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("What? How do you know fo my brother? Ahh I assume Breya told you. He's been gone for quite some time with no word sent on his progress or his wellbeing. I need to find someone to [check on him].");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("check on him")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Thank you, " .. e.other:GetCleanName() .. ". He's one of our people's most knowledgeable geologists and has left to survey an island out in Erud's Crossing. He was sending monthly reports until two weeks ago when his report never showed up. I'm worried something may have happened to him. Take this note to Yelesom and bring back something to assure me of his safety. A reward fitting a Deepwater Knight shall be yours upon your success.");
			e.other:SummonCursorItem(18173); -- Item: Ganss note to Yelesom
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.")
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	end	
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18724})) then -- Tattered Note
		e.self:Say("Yes. welcome friend! Here is your guild tunic. You'll make a fine addition to the Deepwater Knights. Go see Dleria, she will get you started in your studies.");
		e.other:Faction(e.self,242,100,0); -- Deepwater Knights
		e.other:Faction(e.self,266,15,0); -- High Council of Erudin
		e.other:Faction(e.self,265,-15,0); -- Heretics
		e.other:QuestReward(e.self,0,0,0,0,13544,20); -- Old Blue Tunic*
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 1771})) then
		e.self:Say("Ahhh, thank you for your effort, " .. e.other:GetCleanName() .. ". I'm glad he's doing ok despite the theft. I now award you the Sleeves of Midnight Sea. May they protect you until the time of our glorious redemption.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,242,25,0); -- Deepwater Knights
		e.other:Faction(e.self,266,3,0); -- High Council of Erudin
		e.other:Faction(e.self,265,-3,0); -- Heretics
		e.other:QuestReward(e.self,0,0,0,0,1763,2500);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:erudnext  ID:98061 -- Gans_Paust
