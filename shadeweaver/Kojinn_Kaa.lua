--Champion of the Vah Shir
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("waits patiently for a hero to emerge, one that will deliver a crippling blow to those that would hunt the cats of these lands. His eyes look deep to your soul as if to ask, 'Is this the hero I await?' ");
	elseif(e.message:findi("hero")) then
		e.self:Say("Many have come before me and made such claims. Your fervor is appreciated, but I require proof that you are a hero whose heart is with us before I can entrust you with such a sacred mission. Have you something to show that you have earned our trust?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30854})) then--Hero's Shroud
		e.self:Say("You have proven yourself a hero of our cause, and so I entrust you with this information: the poachers have set up an outpost in the caves on the outskirts of the thicket. Go and wreak havoc upon this deplorable filth that has mistreated our friends. As a badge of the honor you have earned, construct a champion's robe and have the High Priestess Bast bless it for you. The ceremony will require three drops of the blood of those who would bring harm to the felidae. It will be the High Priestess's honor to receive you.");
		e.other:QuestReward(e.self,{items = {30855,30854}}); --Champion Cape Pattern, Hero's Shroud (giving it back)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
