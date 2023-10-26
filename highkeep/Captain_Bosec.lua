function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -350) then
			e.self:Say("I'm Captain Bosec. and I am the officer in charge down here. It's my job to patrol the prison and try to keep any [goblins] from getting into Highpass.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("goblin")) then
		if(e.other:GetFactionValue(e.self) >= -350) then
			e.self:Say("Help us exterminate these vile creatures. They call themselves the [Pickclaw] Clan.. I call them annoying. I will gladly pay big money for the left ear of every goblin slain.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("pickclaw")) then
		if(e.other:GetFactionValue(e.self) >= -350) then
			e.self:Say("A couple of months ago, Carson decided to add some more floors beneath the keep. During the construction, we came across these tunnels.. and these goblins. Work has been temporarily halted until we can completely clear out this Pickclaw infestation.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("who.* mistress anna")) then
			e.self:Say("Mistress!  Aptly named, that one.  You are speaking of the Highpass hussy.  That is what everyone calls her, at least behind her back, that is.  Just as Highpass, she is beautiful and frequently traveled.  I have heard rumors that Carson has been seeing her, but how can that be true?  He has Lady McCabe.  What else does he need?");
	elseif(e.message:findi("who.* carson")) then
			e.self:Say("Carson McCabe is the ruler of Highpass Hold. It was his father, Sean McCabe, who established this great community.");
	elseif(e.message:findi("who.* lady mccabe")) then
			e.self:Say("A stunning lady if I ever saw one. There is truly a rose missing from the gardens of Erudin. Just look, but do not touch. She is the spouse of Carson McCabe himself. How even he won the heart of a lady as beautiful as that is an amazement to us all.");
	elseif(e.message:findi("karana")) then
			e.self:Say("If you are trying to get to Karana, you will need to leave Highpass from the western entrance.");
	elseif(e.message:findi("prison") or e.message:findi("jail") or e.message:findi("dungeon")) then
			e.self:Say("The dungeon is located on the lower levels of High Keep. Do not venture there. It is off limits to visitors. If you wish to get someone released, you will have to speak with the jail clerk just before you get to the dungeon.");
	elseif(e.message:findi("sleep") or e.message:findi("inn")) then
			e.self:Say("If you are looking for a comfortable bed to sleep on, speak to the innkeeper on the first level of the keep. The rooms are expensive, but other than that, your only choice would be to try and find an empty room at the Golden Rooster.");
	elseif(e.message:findi("tavern") or e.message:findi("bar")) then
			e.self:Say("There are a few places outside the keep which can supply an endless flow of grog. As for inside the keep, you may be able to buy a drink or two from the kitchen on the second floor.");
	elseif(e.message:findi("freeport")) then
			e.self:Say("If you plan on going to Freeport you will have to go through the Commonlands first.");
	elseif(e.message:findi("bank") or e.message:findi("vault")) then
			e.self:Say("Inside the keep, you can turn items in for safekeeping with the vault clerk who is on the lower level beyond the guestrooms. Do not wander too far down there.The dungeon is also in the same area.");
	elseif(e.message:findi("tehafer")) then
			e.self:Say("Commander Tehafer is a very noble man. It is rumored that he was once a paladin and has since fallen from grace. He now oversees all Highpass Watch operations. If you wish to speak with him, he can usually be found alongside the guards in High Keep entrance. Imagine that, a commander on watch alongside his men.");
	elseif(e.message:findi("common")) then
			e.self:Say("Exit Highpass from the eastern entrance. You will run right into the Commonlands. Just be careful in the Commonlands - I hear there has been an increase in orc activity.");
	elseif(e.message:findi("guild")) then
			e.self:Say("Guilds in Highpass!? I am afraid not. If you wish to join the ranks of the Highpass Watch, speak with one of our officers.");
	elseif(e.message:findi("officer")) then
			e.self:Say("The officers of the Highpass Watch are Captain Bosec of the High Keep Guard, Captain Ashlan of the East Gate Guard and finally Captain Orben of the West Gate Guard. Above them all is Commander Tehafer.");
	elseif(e.message:findi("where.* carson")) then
			e.self:Say("Carson McCabe resides in the royal chambers of High Keep. If you wish to meet with him, do so when he is on the lower levels of the keep. He does not like visitors in the upper levels.");
	elseif(e.message:findi("where.* lady mccabe")) then
			e.self:Say("I would assume that she would be in the royal chambers in the highest levels of High Keep.");
	elseif(e.message:findi("where.* mistress anna")) then
			e.self:Say("My best guess would be that she's somewhere in the suite of the richest noble passing through Highpass.");
	end
end

function event_trade(e)
	local ear = 0;
	local item_lib =require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13790,item2 = 13790,item3 = 13790,item4 = 13790}, 0)) then
			ear = 4;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13790,item2 = 13790,item3 = 13790}, 0)) then
			ear = 3;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13790,item2 = 13790}, 0)) then
			ear = 2;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13790}, 0)) then
			ear = 1;
	end
	
	if(ear > 0) then
		if(e.other:GetFactionValue(e.self) >= -350) then
			repeat
				e.self:Say("Well done! We could really use the extra help around here.");
				e.other:Faction(e.self,332,2,0); -- Faction: Highpass Guards
				e.other:Faction(e.self,329,1,0); -- Faction: Carson McCabe
				e.other:Faction(e.self,331,1,0); -- Faction: Merchants of Highpass
				e.other:Faction(e.self,230,1,0); -- Faction: Corrupt Qeynos Guards
				e.other:Faction(e.self,330,1,0); -- Faction: The Freeport Militia
				-- This doesn't give xp for level 15 or below.
				if(e.other:GetLevel() > 15) then
					e.other:QuestReward(e.self,math.random(0,5),math.random(0,5),math.random(0,5),0,0,25); -- verified xp live data
				else
					e.other:QuestReward(e.self,math.random(0,5),math.random(0,5),math.random(0,5),0);
				end
				ear = ear - 1;
			until ear == 0
		else
			e.self:Say("I will not aid beings such as you.");
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
