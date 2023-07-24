function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings.  May [Rodcet Nife] keep you healthy and watch over you in times of disease.");
	elseif(e.message:findi("rodcet") or e.message:findi("prime")) then
		e.self:Say("Rodcet Nife is the healer and bringer of all life.  Go to the Temple of Life in Qeynos to learn more of his ways.");
	elseif(e.message:findi("chintle")) then
		e.self:Say("Chintle is nothing more than a naive child.  I do not know where he is, nor do I care.");
	elseif(e.message:findi("estle")) then
		e.self:Say("Brother Estle is your run-of-the-mill follower of Rodcet Nife.  He needs to quit preaching so much and truly find himself.  Maybe a trip to the Qeynos sewers will change him.");
	elseif(e.message:findi("sewer")) then
		e.self:Say("What of the sewers?  I spent one month down in the Qeynos sewers converting beggars.  I truly found myself down there.");
	end
end
