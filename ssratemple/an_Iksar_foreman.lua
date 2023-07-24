function event_say(e)
	if(e.message:findi("glanoxx sent me")) then
		e.self:Say("So you've been talking to Elder Glanoxx eh? The disease has addled his mind, claiming gods speak to him. Nothing more than fever dreams if you ask me. Sometimes though... one could almost hope it was true. No! The fanatics will not catch me with unclean thoughts. If only there were some way to take advantage of the weakness I've discovered.");
	elseif(e.message:findi("weakness")) then
		e.self:Say("Shhh... Be quiet the Taskmasters have sharp hearing. There is a green metal found in the mines that our masters despise. We must carefully separate it from the ore before working with the purified metal. Any tainted metal is quickly destroyed. Many a slave has lost their life for not properly purifying the metal. I'm convinced the secret to the master's weakness lies in the tainted metal.");
	elseif(e.message:findi("tainted metal")) then
		e.self:Say("Yes, though none of us would dare wield a sacred weapon of the masters perhaps you could. Forge one of their weapons and some of the green metal from the mines and you can taint the metal of the weapon. Their own corrupted weapons shall be the instrument of their downfall.");
	end
end
