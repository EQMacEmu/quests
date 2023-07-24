function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("glances over from his books for a moment. 'Greetings. Have you come to the realm of the tranquil to study as have? The chaotic energy of lightning has caught my interest of late. I've been trying to understand the magics that further refine my control of lightning and [thunder].");
	elseif(e.message:findi("thunder")) then
		e.self:Say("The sages of Knowledge have been able to create useful powers by translating some of the ancient scripts found in the planes. I've been doing further research into the Draught of Thunder spell. I believe I can refine the power of the thunder and lightning into a bolt of pure destructive energy. I hear rumors that the giants of Torden have acute control of thunder and lightning. If you bring me one of their lightning spheres and a copy of the Draught of Thunder scroll I may be able to weave them into a new spell.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28445, item2 = 9430})) then -- Spell: Draught of Thunder, Lightning Sphere
		e.self:Emote("takes the sphere and the scroll from you and begins to scrawl some rune on the bottom of the parchment. He begins to utter some strange syllables over the parchment and the sphere begins to glow, then it dissolves into floating strands of ethereal energy and begins to scrawl itself across the page. Hrelic hands you the scroll, 'The power of lightning rests in your hands " .. e.other:GetCleanName() .. ". Use this new power wisely.' ");
		e.other:QuestReward(e.self,0,0,0,0,1119); -- Spell: Draught of Lightning
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
