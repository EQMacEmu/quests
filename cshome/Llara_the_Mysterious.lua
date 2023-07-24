function event_say(e)
 if(e.message:findi("hail"))then
		e.self:Say("Might you be an [apprentice] or a [guide]?' Llara then grins evilly...");
	elseif(e.message:findi("apprentice"))then
		e.self:Say("Welcome to the Guide Program, " .. e.other:GetCleanName() .. ". I am sure you will enjoy your time here. Do not worry about being only an apprentice right now, I'm sure that in time you will be ready for promotion. This is truly the best place to be in the world. Good luck to you, " .. e.other:GetCleanName() .. "!");
	elseif(e.message:findi("guide"))then
		e.self:Emote("cracks her whip in " .. e.other:GetCleanName() .. "'s direction and says, 'Well, if you are a guide, then what the heck are you doing here!?! Get to work on the queue, it's not going to be under 20 all day!.'");
	elseif(e.message:findi("miss you"))then
		e.self:Say("I miss you, too, " .. e.other:GetCleanName() .. "! But don't worry about me. I am in a good place now, watching over all of you.");
	elseif(e.message:findi("Valtron"))then
		e.self:Say("I am Llara. I was a guide on Erollisi Marr some time ago. I passed away shortly after becoming an apprentice trainer. My rebirth came from the help of Valtron. He is that stinky little dorf always running around Norrath. Valtron held a memorial service on Erollisi Marr shortly after I passed away. It was truly a beautiful event. Many people showed up to honor my passage.' Llara smiles...");
	elseif(e.message:findi("your story"))then
		e.self:Say("Llara was a Guide on Erollisi Marr server. She was there for 6 months and was also the training Co-Ordinator. David, her controller, was a private person but we did learn that he was married with a family and had a dry sense of humour that tickled us all. Llara was one of those Guides, who hardly ever missed a shift and if she did, she never missed posting it. She never complained, not about a petitioner, a peer or the weather. On one Sunday while waiting for new candidates for buffing Llara hadn't been in touch with us like she always was. The Guide Board was checked and it was noticed that she hadn't guided since Wednesday and for someone who was -always- around it seemed very strange. GM Valtron was called to ask when he might be in to buff the new apprentices and if he had heard anything from Llara. While talking to him, an email from Heather, David's daughter arrived. She explained that David had a heart attack on the Tuesday night and had sadly not survived.");
	end
end

--Submitted by: Jim Mills
--Converted to LUA by Speedz