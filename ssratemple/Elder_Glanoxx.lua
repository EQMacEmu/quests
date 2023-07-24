function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("looks like he's been sick for some time. He looks at you for a moment and motions for something to drink.");
	elseif(e.message:findi("release")) then
		e.self:Say("The ones that keep us here... the ones who defy the gods. They must be destroyed. I cannot recall a time outside of this place, but I believe the stories. I trust that we are from somewhere else. These creatures claim to be gods. They claim to have created us from the filth of the mines. This cannot be. I have seen the face of our true god. He told me of their blasphemy. He came to me and handed me the knowledge of how to reach their Emperor. He taught me to resist the prying magic of the fanatics. Are you the crusaders of prophecy... the ones who walk in the mist?");
	elseif(e.message:findi("crusaders of prophecy")) then
		e.self:Say("The prophecy will come to pass at last. Take my knowledge... the knowledge of our lord. I will not last much longer. This sickness will kill me like the others. There is one other who can help you. He claims to know some weakness of these creatures, seek him at the smelting furnaces near the mines. Now I must tell you the secret of the key.");
	elseif(e.message:findi("secret of the key")) then
		e.self:Say("There is a pouch to be found. It was specially made and requires three separate components to function. Seek out the Idol of Zazuzh and the Ring of Zeruzsh. These items are kept by the Emperor's must loyal Taskmasters. Place with them the Ssreashzian Insignia. This item will be much harder to acquire. I am sure you will be successful... our lord walks with you. Please be swift.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13006}, 0)) then
		e.self:Say("Are you here for them... are you here to release us?");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
