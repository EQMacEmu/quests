function event_spawn(e)
	eq.set_timer("chat",math.random(96000,480000));
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("snaps his eyes in your direction. He gestures wildly with his hands and face, his voice crackling with insanity as he speaks, 'Are you talking to me? I don't see anyone else around so you must be talking to me. Did you come to discuss matters of high importance like the struggle between the Violet Tri-tubes and their oppression under the iron fist of the Barrel Trees? Or perhaps you wish to speak directly with the animals for I can show you how. If you came in search of the power of flight, you would not be the first.'");
	elseif(e.message:findi("Behari")) then
		e.self:Say("He was a man. He was a good man. Born on a rock in a lake in world from a reality far from this coil you and I call our homes. He was the hero of his existence, fighting for those that sought to destroy you as part of the endless struggle to remove the giant rat from power. Did you know that with the proper care and education, elemental pets can make wonderful conversationalists?");
	elseif(e.message:findi("love potion")) then
		e.self:Emote("sort of calms as he speaks very clearly, very deliberately, 'Do not trifle with me on this. A luclin clover, a drop of moonlight and the essence of sonnet- bring me these things and you will shar eternity with whomever you treasure most.'");
	elseif(e.message:findi("luclin clover")) then
		e.self:Say("These are abundant throughout the thicket, now go.");
	elseif(e.message:findi("drop of moonlight")) then
		e.self:Say("Any skilled astrologer can get you this thing. Bring it to me now.");
	elseif(e.message:findi("essence of sonnet")) then
		e.self:Say("A difficult thing to acquire, find a bard and get it done, waste no more of time, bring me the ingredients!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 5994}, 0)) then
		e.self:Emote("struggles as you try to force-feed him the elixir, making you think twice about the wisdom of force-feeding something to a madman. 'I DON'T WANT TO DRINK MY JUICE, MOTHER! NOW GET YOUR HANDS OFF OF ME!' he shouts.");
		eq.attack(e.other:GetName());
		e.other:QuestReward(e.self,0,0,0,0,5994);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	Chatone = "says 'Well my mother lived underground with the rest of them, don't you know.  Where would you expect a royal envoy to live, in the middle of a raging storm?  Of course she would, but enough about me, tell me about your mother...'  He looks at his elemental pet for a moment as though awaiting a reply, and responds to the absolute silence, 'really, is it as drafty up there as one would assume?'"
	Chattwo = "appears to be playing a game with invisible pieces.  He stares intently at the air in front of him, deep in strategic planning before reaching out, grabbing an unseen token and moving it silently to another space in midair.  A moment later, his head jerks up and he stares directly at his pet, 'what?  I did not and I resent your implication that I did.  Like I would need to!  If this is the way you are going to be then I don't even want to play!' he states and spins around indignantly.  The elemental pet has no apparent response."
	Chatthree = "blurts out 'you can keep the whole lot of 'em I tell you!'  He stares at his elemental companion a moment, who does not seem to respond in any way, to which Hoober retorts, 'Well that may be what you think, but what do you know?  You aren't even a day old for pity's sake!  And who have you ever been in love with anyway?'  After giving his silent, summoned companion ample time to respond, Hoober continues, 'Sure she does and how come you've never mentioned her before now?  Cause you're full of crackers I say.  You really get under my skin with that high and mighty attitude you know?'"
	Chatfour = "is fuming angry.  It takes you a moment to be sure, but it looks as if he is upset with his elemental pet.  'Well you broke it, that's why, you idiot!  I always tell you that you play to rough, but no you don't want to hear it, no,' he hollers as he waves a locket in the face of the summoned creature.  The chain on the locket is broken and the elemental has no response whatsoever to the continued berating, 'I'll need you to fetch me a pitcher of water and a bunch of vegetables for a salad otherwise we may never hear from her again and then all hope for peace among the tribes will be lost.  Now go.'  Hoober looks satisfied as his pet stands at his side, resolute and unmoving."
	Chatfive = "looks utterly exasperated and yells at his elemental pet, 'No, no, no!  First the rabbit goes around the bend and then the child can enter so that the flowers will bloom giving new life to the faceless jar of wisdom.  If I have told you that once I have told you that one thousand times, please do not make me repeat myself.'  He pauses a moment, collecting himself, before addressing his animated companion once more, 'now, we were discussing the affairs of state?'"
	Chatsex = "assumes a very serious and conspiratorial air as he whispers so that he thinks only his elemental pet may hear, 'The wombats will come, for they have a new leader, and he brings them frightening power, he does.  It will he be he who is foolish indeed that does not fear the wombat.'  The summoned creature sits in silence, no response forthcoming."
	if(e.timer == "chat") then
		e.self:Emote(eq.ChooseRandom(Chatone,Chattwo,Chatthree,Chatfour,Chatfive,Chatsex));
		eq.set_timer("chat",math.random(96000,480000));
	end
end

function event_combat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("chat")) then
			eq.pause_timer("chat");
		end
	else
		eq.resume_timer("chat");
	end
end

function event_death_complete(e)
	eq.depop_with_timer(172010);
	eq.unique_spawn(172012, 0, 0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
end
