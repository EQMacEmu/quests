function event_say(e)
	if(e.other:GetLevel() >= 55) then
		if(e.message:findi("hail")) then
			e.self:Say("I greet thee, " .. e.other:GetCleanName() .. ". You will have to pardon my demeanour; I am afraid that I am not in the best of spirits. Recently yet another brother was taken from us by an evil unknown through the dark art of mind rending.");
		elseif(e.message:findi("evil")) then
			e.self:Say("Somewhere there exists a group of outcast phantasmists that use their powers solely to harvest pure evil. These masters of the mind are of an origin that we have yet to uncover, for they exist only in one's thoughts, slowly turning one insane from the horrors that pound through their mind.");
		elseif(e.message:findi("outcast")) then
			e.self:Say("These outcasts were once believe to be part of our circle before turning to the way of evil and using the mindbending abilities that they possess to take over those whose knowledge would benefit them most.");
		elseif(e.message:findi("abilities")) then
			e.self:Say("What these beguilers are capable of is unknown, but what we do know is that as each day passes we are all at risk from an attack that could very well end us. But there is a chance that if we could find the ancient tomes of their weaknesses, this evil could be stopped.");
		elseif(e.message:findi("tomes")) then
			e.self:Say("Legend exists that there are two lost tomes that cover the darker sides of mind control. These tomes were last believed to be possessed by mortals much like yourself that stumbled upon them not knowing what they possessed because they could not understand the unknown code the books are scribed in.");
		elseif(e.message:findi("code")) then
			e.self:Say("To prevent those that could not control the powerful abilities that these tomes described how to perform, these tomes were scribed of ancient language that not many could decifer. In search of someone that could assist them, these heros fell in the city of giants.");
		elseif(e.message:findi("language")) then
			e.self:Say("As I told you before, these books are distinctly coded to only be understood by those that have the abilities to perform and contain these magics. If these tomes were recovered it is very possible that I could decode them and develop an immunity to the mind altering attacks that I feel are upon us.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31445,item2 = 31446,item3 = 31443,item4 = 31444}) and e.other:GetLevel() >= 55) then
		e.self:Say("In my hands I hold the teachings of those who gave their lives to produce a defense against the evils of mind control. For what you have done for me I cannot thank you enough; please accept this magical item as a reminder of my gratitude.");
		e.other:QuestReward(e.self,0,0,0,0,1325,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
