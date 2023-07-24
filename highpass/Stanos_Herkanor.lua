function event_spawn(e)
	eq.set_timer("depop", 2000000);
end

function event_timer(e)
	if ( e.timer == "depop" ) then
		eq.depop();
		
	elseif ( e.timer == "call_help" ) then
		CallHelp();
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ah, the pouch.  This is the first step Anson.  The Circle has to be upset having this taken right out from under them.  That speaks well of the person who did the taking.  Hanns must be even more furious now <chuckle>.");
		eq.signal(5037,2); -- NPC: Anson_McBale
	elseif(e.message:findi("you")) then
		e.self:DoAnim(63); -- laughs
		e.self:Say("<chuckle> You are young, aren't you? I ran [the Circle] out of Qeynos for well over 30 years, and did a right fine job of it. It's a long story, and isn't over yet. I have much to answer for.");
	elseif(e.message:findi("circle")) then
		e.self:DoAnim(64); -- points
		e.self:Say("The Circle of Unseen Hands, you oaf! The largest collection of thieves, murderers, con artists, and rogues in the world. No finer men can be found anywhere.");
	elseif(e.message:findi("deal")) then
		e.self:Say("Aye, " .. e.other:GetCleanName() .. ", we could make a deal. I have a blade I won't use anymore, and you have those fine looking daggers Vilnius gave you. Of course, you would have to do something for me first. Let me tell you my [story], then you decide.");
	elseif(e.message:findi("story") or e.message:findi("Johann")) then
		e.self:Say("Johann Krieghor was the leader of the Circle and I was his second-in-command.  He made a dark bargain  with a  Teir'dal General.  The Circle was to assassinate Joren,  the high elf ambassador to Qeynos.  Had the plot worked, it would have weakened the alliance between high elves and humans, and possibly  caused a war between the two powers.  In either case, the Teir'Dal would have profited greatly by this event, and all others would have suffered.  I could not stand by and let this happen, but Johann would not be deterred, for the Teir'Dal had promised him much.  I had no choice but to kill Johann and the Teir'Dal agent.  I made it look like they offed each other, and then I hid the tools.");
	elseif(e.message:findi("tools")) then
		e.self:Say("To allow the assassin to slay a prince, and fight his way back out, a fell blade was crafted. It was small enough to conceal under a garment and yet large enough to strike a mortal blow through armor. Aided by vile Teir'Dal enchantments, it is much more fearsome than it appears. I would gladly rid myself of it, but I fear I can not until I clear my name with Hanns.");
	elseif(e.message:findi("general")) then
		e.self:Say("The General? I know not his true name, only that he is ranked high among the dark elves. He kept his identity secret, and it was only upon the death of his agent that I even learned the smallest amount about him, that of his Generalship. Knowing who he is would aid me greatly.");
	elseif(e.message:findi("hanns")) then
		e.self:Say("Hanns Krieghor was a talented young man, in many ways much more of a man than his father. After the death of [Johann], I raised Hanns as my own son, and grew to love him as such. A few years back, to take revenge upon me for his [father's murder], Hanns seized control of the Circle. At the same time, he sent four of his best killers to finish me. The killers failed, I still live. Hanns still leads the Circle in Qeynos, and still seeks [my head].");
	elseif(e.message:findi("murder") or e.message:findi("father")) then
		e.self:Say("Well, it's no great secret now that I was responsible for the death of Johann Krieghor, Hanns Krieghor's father. Johann used to lead the Circle. Hanns was but a pup when his father died at my hand, and became as a son to me. Hanns did not discover that I was the one who killed his father until many years later. For that, he wants [my head].");
	elseif(e.message:findi("head")) then
		e.self:Say("Aye, " .. e.other:GetCleanName() .. ", Hanns has wanted me dead for years. He's tried many times, though not personally. He's smart, that one, for not facing me, but foolish for wasting so many good men for naught.");
	elseif(e.message:findi("clear.* name")) then
		e.self:DoAnim(64); -- points
		e.self:Say("I need proof that what I say about Johann is truth, so that Hanns may forgive me. YOU can gather that proof for me. First, travel to Kaladim and Neriak, and there, upon the persons of the rogue guildmasters, you should find that which I seek, two parts of a document I recovered from the dead agent. I entrusted one to Founy, but that trust is gone, and Founy would betray me to Hanns were I to attempt to reclaim it. Tani N'mar has the other, which he should not possess, and keeps it only to spite me, not knowing its real importance. Steal them both, and bring them back to me. And don't let anyone follow you! If I am not around, tell Anson you want to see me.");		
	elseif(e.message:findi("Joren")) then
		e.self:Say("Joren was the boon companion to the King of Felwithe, a mighty paladin of great reknown, much loved by all the high elves. To slay him, certain. . .items. . .were crafted to make the job possible. With the death of the Teir'dal agent, and my theft of the [tools], the General was forced to abandon the plot.");
	elseif(e.message:findi("help")) then
		e.self:Say("Well, then, I suppose you should hear my story.");
	elseif(e.message:findi("lendel")) then
		e.self:Say("Lendel, eh?  About time.  Did he send you to help me?  Well, I need someone to follow up on a job for me, track down a fellow named Vilnius, near Qeynos, maybe in the Karanas, and tell him I am STILL waiting for my delivery.");
	elseif(e.message:findi("I killed Renux")) then
		e.self:Say("You killed Renux?  You stupid git of a dog!  Renux was my best work, a killer without peer, without remorse.  All I did to her, I did for a reason, and it made her matchless.  Ravens take your eyes!  All you needed to do was gather evidence.  When Hanns' believed me, Renux would follow.  A hollow victory, it seems.  I suppose you had to do it, but I imagine it cost you in the process.  When this is over, perhaps you and I shall have a reckoning.");
		e.other:Faction(e.self,332,-500,0); -- Faction: Highpass Guards
	end
end

function CallHelp()
	-- a_smuggler, a_smuggler, Cyrla_Shadowstepper, Bryan_McGee, Beef, Kaden_Gron, Breck_Damison, Anson_McBale, Dalishea, Crenn_Salbet
	-- Mardon_Smith, Dovik_Greenbane, Prak, Bartender, Scar, Wres_Corber
	local StanosFriends ={5019,5038,5107,5056,5055,5050,5051,5037,5009,5053,5060,5061,5054,5069,5134,5052};
	for i = 1, #StanosFriends do
		eq.signal(StanosFriends[i],1);
	end
end

function event_combat(e)
	
	if ( e.joined ) then
		CallHelp();
		eq.pause_timer("depop");
		eq.set_timer("call_help", 330000);
	else
		eq.resume_timer("depop");
		eq.stop_timer("call_help");
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("I tend to agree Anson.  We could make a deal.  I have a blade I won't use anymore, and you have those fine looking daggers Vilnius gave you.  Of course, you would have to do something for me first.  Let me tell you my story, then you decide.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Did you forget something?";

	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 28010,item2 = 28011})) then
		e.self:Say("Excellent!  With this document I can..' <He pauses for a moment>. 'Damnation!  Curse my tired old mind, I forgot that I could not read the document.  It is written in some obscure code or language.  I can't decipher it, but I know someone who can.  Seek out one called Eldreth, an Erudite who used to do work for me.  I know not where he may be found these days, only that he will not be found in Erudin, as they want his head for some misdeed in the past.  Give him the complete parchment, and tell him I sent you.  He owes me.");
		e.other:Faction(e.self,332,100,0); -- Faction: Highpass Guards
		e.other:Faction(e.self,329,15,0); -- Faction: Carson McCabe
		e.other:Faction(e.self,331,15,0); -- Faction: Merchants of Highpass
		e.other:Faction(e.self,230,5,0); -- Faction: Corrupt Qeynos Guards
		e.other:Faction(e.self,330,5,0); -- Faction: The Freeport Militia
		e.other:QuestReward(e.self,0,0,0,0,28012,500); -- Combined Parchment
		eq.depop();
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 28013,item2 = 7506,item3 = 7505},1,text)) then
		e.self:Say("Very well done.  I leave now to confront Hanns with this evidence.  Even so, it will not be easy to regain his trust.  That is why I need those daggers, in case all else fails.<chuckle>   Bristlebane grant me luck - I can no longer live like a hunted dog.  In any case, I am grateful for your aid.  Take this wretched blade, I can bear it no longer.    I must warn you, I feel it carries Innoruuk's curse; all who are near it learn the meaning of hate. <chuckle>  Ironic, isn't it?  You went to all that work to redeem yourself for a rapier, yet the true reward came when you redeemed another. <chuckle>.  Good luck, "..e.other:GetName()..", for much as I, you will need it.");
		e.other:Faction(e.self,332,100,0); -- Faction: Highpass Guards
		e.other:Faction(e.self,329,15,0); -- Faction: Carson McCabe
		e.other:Faction(e.self,331,15,0); -- Faction: Merchants of Highpass
		e.other:Faction(e.self,230,5,0); -- Faction: Corrupt Qeynos Guards
		e.other:Faction(e.self,330,5,0); -- Faction: The Freeport Militia
		e.other:QuestReward(e.self,0,0,0,0,11057,10000); -- Ragebringer
		eq.depop();
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 18961})) then
		e.self:Say("Let me see what you have here. Aha, so that's who.. yes, yes! There is one more thing I need you to do. This document tells me who the originator of the plot really was. His name is General V'ghera, which is interesting, as Anson's men have spotted him in Kithicor recently. He will not be easy to get to, but if you give this box to one of his many aides, the General will HAVE to come to investigate. You see, this box used to contain the tools crafted for the assassination. When he arrives, kill him! I need any documents you find on him - with luck it will be enough evidence to convince Hanns that what I say is true. Bring any documents or dispatch cases you find, along with those blades Vilnius made you work so hard for, and we will make a trade.");
		e.other:Faction(e.self,332,100,0); -- Faction: Highpass Guards
		e.other:Faction(e.self,329,15,0); -- Faction: Carson McCabe
		e.other:Faction(e.self,331,15,0); -- Faction: Merchants of Highpass
		e.other:Faction(e.self,230,5,0); -- Faction: Corrupt Qeynos Guards
		e.other:Faction(e.self,330,5,0); -- Faction: The Freeport Militia
		e.other:QuestReward(e.self,0,0,0,0,28057,500); -- Sealed Box
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
