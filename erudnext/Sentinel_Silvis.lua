function event_say(e)
	if(e.message:findi("kerra isle")) then
		e.self:Say("Kerra Isle is found halfway between Erudin and Qeynos. There is a pride of cat people living on the small island. Unlike their cousins in Kerra Ridge, they are peaceful.");
	elseif(e.message:findi("wizard guild") or e.message:findi("enchanter guild") or e.message:findi("magician guild")) then
		e.self:Say("All circles of magic are headquartered within the Palace of Erud.");
	elseif(e.message:findi("paladin guild")) then
		e.self:Say("You can find the Erudite paladins at the Temple of Divine Light and the Deepwater Temple. If you achieve great awareness among them you may be accepted into the High Guard.");
	elseif(e.message:findi("warrior guild")) then
		e.self:Say("The only warriors in Erudin are the paladins of the High Guard and the members of the two temples, Deepwater and Divine Light.");
	elseif(e.message:findi("rogue guild")) then
		e.self:Say("All thieves in Erudin can be found in the city prison. We do not tolerate such behavior.");
	elseif(e.message:findi("bard guild")) then
		e.self:Say("We have no bard organization in Erudin. Many Erudites find this an oddity. Such a beautiful art form would be right at home in our lovely city.");
	elseif(e.message:findi("monk guild")) then
		e.self:Say("We have no monks in Erudin.");
	elseif(e.message:findi("temple")) then
		e.self:Say("You may find a healer in either the Temple of Divine Light or the Deepwater Temple.");
	elseif(e.message:findi("inn") or e.message:findi("rest")) then
		e.self:Say("The Vasty Deep Inn can accommodate you. It is on the lower tier of the city.");
	elseif(e.message:findi("tavern")) then
		e.self:Say("The only establishment in Erudin of that sort is called Bluehawk's. It was primarily made to cater to travelers.");
	elseif(e.message:findi("bank")) then
		e.self:Say("The bank can be found in the Palace of Erud.");
	elseif(e.message:findi("supplies")) then
		e.self:Say("You can find provisions in the port district.");
	elseif(e.message:findi("king") or e.message:findi("leader")) then
		e.self:Say("Within the palace you shall find the High Council which is the governing body of Erudin. The overseer of this council is the guildmaster of the Gatecallers, Markus Jaevins.");
	elseif(e.message:findi("what.* sentinel")) then
		e.self:Say("Every sentinel in Erudin is a paladin and member of the High Guard. They belong to either the Temple of Divine Light or the Deepwater Temple. They protect Erudin from evil.");
	end
end

