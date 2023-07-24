function event_signal(e)
	if ( e.signal == 1 ) then
		e.self:Shout("Damnation and doom!  Some fool has awakened The Sleeper!  Avoid those places where Dragons dwell, for Kerafyrm shall surely seek revenge upon us!");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Oi, what is this?  A " .. e.other:Race() .. ", if my tired old eyes are not mistaken. Knew it would happen.  Sooner rather than later.  No stopping the flood now, eh?");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("flood")) then	
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("The flood of beings to Velious.  Starts with a trickle, like all floods.  Sweeps the old away in the end, leaving a new landscape.  Blessing and shame that I will not be around to see it all unfold.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("be around")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("I will be leaving this world soon enough, I think.  Too tired to continue this existence, too jaded to believe tomorrow would be any different than today.  Seeing you here is the most exciting thing that has happened to me in aeons, and even that isn't enough to make me want to continue.  Yes, it is the Necropolis for me, and the swift embrace of fire, and then my dust shall fly free as I once did.");	
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("fly") or e.message:findi("free")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Dragons have never been truly free.  The Claws, the Ring, the One Who Sleeps, our very nature, all conspire to keep us enslaved.  We cannot grow beyond what we are now, so doomed we all are.  Masters of this world we are not.  Your very presence here screams this to any who have ears to hear.  The Age of Scale is long past.");	
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("long past")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("It proves how weak and static our race has become. Here you stand, in the most sacred of places, fearing nothing, daring to converse with me.  If I were to consume you now, a dozen  would appear to replace you.  As mighty as Dragonkind is, we can never hope to match the power you wield.  Dragons have limits set upon themselves,  while you and your kind refuse to accept any limits.  We cannot compete with that.  If only we could throw off these shackles we bind ourselves with.");	
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("shackles")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("I do not see this happening. Too proud, too sure of ourselves, as a race we could never concede that we have anything to learn from the likes of you.  We need a revelation. Something to open our eye, a poke in the rump.  The Iksar almost woke us up, they had us united and striving for something for a brief while, but the Iksar Empire was in many ways as doomed as we are, too inflexible. What does not bend will break. The same could be said of the Kromzek.");	
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("kromzek")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("The Kromzek are also clinging to the old ways, they have changed no more than we have over the generations.  We kill some, they kill some, nothing really changes.  Now the Coldain, they are a group to admire, the first trickles of that flood I spoke of.");	
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("coldain")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("I admire the Coldain  They are strong because they adapt. They fought the Kromzek to a standstill, then pushed them back.  They have not really crossed Dragons yet, but I feel that if they had a feud with us, they would present quite a challenge.  And lo!  There is a whole WORLD of peoples such as yourself, hardy and flexible as the Coldain, and here you stand at our doorstep, knocking.");	
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	end
end