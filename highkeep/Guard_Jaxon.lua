function event_say(e)
	if(e.message:findi("who.* mistress anna")) then
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
	elseif(e.message:findi("bosec")) then
		e.self:Say("Captain Bosec is the officer in charge of the guards of the keep. He is having a rather rough time of late. Commander Tehafer is very upset that he cannot exterminate the recent goblin infestation in the lower levels. If you wish to help him, go ask him about the goblins.");
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
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
