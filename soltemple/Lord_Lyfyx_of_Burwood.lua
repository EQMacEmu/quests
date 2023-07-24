--Zone: Soltemple  NPC: Lord_Lyfyx_of_Burwood (80038)
--Qadar

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:DoAnim(24);
		e.self:Emote("bows as a courtesy. His face gleams as if tinged with red.  'Greetings, my friend. Welcome to the Temple of Ro, sanctuary to those who follow the words of the Burning Prince.' ");
	elseif(e.message:findi("scale")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Tektite and peridot shall get you what you desire.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("xyfyl")) then
		e.self:Say("So you can pronounce my name backwards..  Is that your lot in life?  Pronouncing names backwards?  Be gone with your silliness!  We need no court fool.");
	elseif(e.message:findi("burning prince") or e.message:findi("temple of ro")) then
		e.self:Emote("closes his eyes and shakes his head in sorrow. 'Far away and better forgotten.' ");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 10028, item2 = 12831})) then
		e.self:Emote("places the gems inside an ornate metal box.  He begins to tug at his skin.  Your vision blurs as he performs his magic. 'This is what you seek.  Now leave and bother me no further.' ");
		e.other:Faction(e.self,415,5);        -- Temple of Solusek Ro better
		e.other:Faction(e.self,416,-1);       -- Shadow Men worse
		e.other:QuestReward(e.self,0,0,0,0,12952,50000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
