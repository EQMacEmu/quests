-- The Velium Focus

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("seems to ignore your greeting, peering at the stone in front of him intently as if reading some invisible text. After a long while he sighs deeply and says, 'Somethin I kin help ye with, whoever you are?");
	elseif(e.message:findi("who are you")) then
		e.self:Emote("speaks as he continues staring at the stone, 'I mine. So they call me a miner. Name's Normon, Normon Stonetooth, Normon the miner.. Did I say I mine?");
	elseif(e.message:findi("mine")) then
		e.self:Say("Well I look fer velium o'course. But ye know, I pull very little of it out o the mundane rock these days. Sometimes I hear it whisperin' to me. The stone, the velium, everything down here talks to each other. If ye're lucky enough they tell ya secrets. That be why I listen more these days than pull velium.");
	elseif(e.message:findi("secret")) then
		e.self:Say("Now if'n I told ye that it wouldn't be a secret no more now would it? No, I can't tell ya what they tells me, but I kin help ya ta listen. But first ye'll need ta do me a favor heheh.");
	elseif(e.message:findi("favor")) then
		e.self:Say("Ahh, well me pick is a bit dull, don't cut like it should. Up in the city proper ye kin find a weapons smith named Hakon. Take me pick axe and and tell him Stonetooth sent ye. Then give it to him, wait fer him ta sharpen it, an bring it back to me. Then I'll help ya ta listen to the stone.");
		e.other:SummonCursorItem(1690); -- Norman's Axe (unsharpened axe)
	elseif(e.message:findi("stone")) then
		e.self:Say("If ye gots brains ye kin probably figure the Stonetooth clan were a family o' miners. I been down 'ere so long though, I can't rightly remember if they be aroun' anymore, aside from me that is. Oh well, I don't care much really, I got me rocks.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1691}, 0)) then -- Norman's Axe
		e.self:Say("Ahhhh, good work, " .. e.other:GetCleanName() .. ". Now ta speak with the stone ye need somethin' ta focus on. Use this piece o' velium as yer focus. Ta speak the language o' the stone ye need ta slow down like the stone. Rock looks like it don't move but it does, just real slow. So place yer focus on the stones ye wish ta speak with and get yerself real slow, both yer body an' yer noggin. Then if yer quiet enough ye might hear 'em. An' that's what's to it.");
		e.other:QuestReward(e.self,0,0,0,0,1692,500); -- Velium Focus V1
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
