--This iksar crusader is actually Hero Goxnok, for the fifth leg of the Greenmist quest. He gives you a coin that you give back to him in Firiona Vie, to get him out of his disguise and speaking to you.

function event_spawn(e)
	eq.set_timer("depop",900000);
end

function event_say(e)
	if(e.message:findi("hail")) then 				--Test of Betrayal (Greenmist Quest 5/8)
		e.self:Emote("clicks his heels together at attention. 'Hail, follower of Pain. Have you been sent to me?'");
	elseif(e.message:findi("sent")) then 			--Test of Betrayal (Greenmist Quest 5/8)
		e.self:Emote("spies the khukri sheath at your side. 'This cannot be. I was told a duke would attend the matter. Still, if the Lords have sent you, then you must be able to complete the task. The [traitor] most certainly must be stopped from delivering the [Charasis Tome]. The [recipients] appear quite formidable and I cannot handle such a deed, not single-handed.'");
	elseif(e.message:findi("traitor")) then 		--Test of Betrayal (Greenmist Quest 5/8)
		e.self:Say("I am afraid I do not know. The babble is that he is from Cabilis, but he could have been a disguised sarnak. Who knows? The tink is that at night within the Outland territory, near the old skinless outpost, they are to meet. We should depart at once. Go get outfitted and let me know when you are [ready to depart].");
	elseif(e.message:findi("charasis tome")) then 	--Test of Betrayal (Greenmist Quest 5/8)
		e.self:Say("The Charasis Tome, the tome of the old city of Charasis. It was taken from this temple and must be returned. The one sent to apprehend the traitor who stole the tome must be [ready to depart] with me at once.");
	elseif(e.message:findi("recipients")) then 		--Test of Betrayal (Greenmist Quest 5/8)
		e.self:Emote("shows signs of fear and his face turns olive. 'I do not know. The [spider riders]!! I have only heard tales of them from dying lizards. Evil skinless stubs. From the wounds inflicted on the lizards, I can tell they are vicious opponents. Bloated and frayed flesh, disembowelment. Their steeds must have also joined the fray, for some of the victims were covered in webs.'");
	elseif(e.message:findi("spider riders")) then 	--Test of Betrayal (Greenmist Quest 5/8)
		e.self:Say("As I have reported, the babble states they appear to be skinless stubs who ride giant spiders. Most encounters occur when the moon is high. Little is known about them and only in recent weeks have they begun to appear.");
	elseif(e.message:findi("ready to depart")) then	--Test of Betrayal (Greenmist Quest 5/8)
		e.self:Emote("slings his pack on his back and locks his sheath. 'Very well. I shall follow shortly. You must depart on your own. Go to the plains of the old skinless outpost. Beware, they have returned and patrol the hillside. Keep an eye on the gates of the outpost. I will be disguised within their ranks, I shall kneel as a sign. Give me this coin as your token.'");
		e.other:SummonCursorItem(12691);	--A Coin
	end
end

function event_timer(e)
	eq.depop();
end

--Submitted by: Jim Mills
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
