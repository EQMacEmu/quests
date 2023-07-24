---- Bidils_the_Quickhand.pl
---- Quest: The Realm of Heroes -- Misty Thicket


function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Why, hello there " .. e.other:GetCleanName() .. "! And what brings ya to see little old me? Oh, let me guess! I am sure it is because ya wish t'buy a good spot of Jumjum and listen to [my tale]? Oh, quite lovely so! Why else would one well rounded " .. e.other:Race() .. " come to see the great Bidils the Quickhand other than to hear of this rogue's great adventures!");
	elseif(e.message:findi("my tale")) then
		e.self:Say("Ahhh. . . I see the gods have found the time to be now for a good ear to lend to my words! So long as ya share the Jumjum, I can speak t'ya of the endless adventures and triumphs of Bidils the Quickhand! Now. . . where shall I begin? Yes! [The beginning], of course! Indeed, quite lovely so.");
	elseif(e.message:findi("The beginning")) then
		e.self:Say("Yes, of course I shall begin at the beginning! No proper tale would begin anywhere other than the beginning! You see, good " .. e.other:Race() .. ", I was once a humble rog. . . [merchant] within this here fair   city. Oh, how the Jumjum and gol. . . merchandise flowed in then! Quite lovely, indeed, it was. Well then, where was I?");
	elseif(e.message:findi("merchant")) then
		e.self:Say("hhh yes! Those days were fair indeed. How I do miss them! Of course, that is not to say that Bidils the Quickhand does not appreciate the eyes and favor of [Bristlebane] upon him! In fact, it is quite the contrary! I do love a good prank! Yes, quite lovely so!");
	elseif(e.message:findi("Bristlebane")) then
		e.self:Say("Fizzlethorp Bristlebane, indeed quite the trickster and with a sense of humor! I bet you could not have seen that Bidils the Quickhand would have caught the eye of such a dignified individual, now did ya? Yes, The King of Thieves. . . and merchants finds it amusing when one [takes his possessions]!");
	elseif(e.message:findi("takes his possessions")) then
		e.self:Emote("eyes grow wide with an eager, child-like anticipation.");
		e.self:Say("Oh yes! Upon one of my several adventures through this great, glorious land of Norrath, I did stumble upon a [lovely treasure], indeed! Great skill and cunning was used, skill that belonged only to Bidils the Quickhand, and has yet to be surpassed within this realm!");
	elseif(e.message:findi("lovely treasure")) then
		e.self:Say("A lovely gem, far more beautiful than even the most delicate and fury feet of a halfling lass! It was larger than my face, and sparkled more than the most pure of Jumjum catching the rays of Karana's blessed skies! Indeed, it was a divine treasure to behold. . . but little then did I know that such a treasure truly belonged to the King of Thieves. . . and merchants himself! But no, such truths still would not have [stopped me]!");
	elseif(e.message:findi("stopped me")) then
		e.self:Say("Ahh ha! I was not stopped, and the gem was mine! Right from beneath the arms of Bristlebane   himself did I take it! That was when he noticed me. . . and that is when I was taken from the humble life of a merchant and placed within the glorious [realm of heroes]! Of course. . . Bristlebane took back the gem. What a shame. Indeed, quite so.");
	elseif(e.message:findi("realm of heroes")) then
		e.self:Say("The realm of heroes, that is my new home. . . Well, it was. Ahhh, indeed, it is quite lovely! It is where all that catch the eyes of the gods in favor ascend if their deeds be true and worthy   enough for note! Perhaps one day, " .. e.other:GetCleanName() .. " , you shall rise as well!! Look at Bidils the Quickhand, once a sturdy merchant and now a [humble servant] and rewarder of deeds!");
	elseif(e.message:findi("humble servant")) then
		e.self:Say("Yes! Indeed, a humble servant I am! I complain not for my occupation. . . as I am humble. I   collect [deeds and make recognition] of those who have caught the eyes of the gods. Why the gods do it not themselves, I am lost for answers. . . but, I do not complain. They are gods, you know. Quite busy! Indeed, lovely so!");
	elseif(e.message:findi("deeds and make recognition")) then
		e.self:Say("Deeds! Yes, the gods are quite tricky and intelligent you know! They have found a way to mark deeds in the form of a coin! A [coin] in which one who has been so fortunate enough as to accept would give to me. . . or one of the [other Heroes] that have recently come to this land.");
	elseif(e.message:findi("other Heroes")) then
		e.self:Say("Oh yes! I am not the only one who has returned to Norrath in search of Heroes! There are many others, indeed! Although, as the gods, their colors vary. Some are [kind and gentle] while some are [vile and nasty] beings of which ya should watch ya'r back for.");
	elseif(e.message:findi("kind and gentle")) then
		e.self:Emote("sighs heavily, a twinkle in his eye and warm smile upon his heavy cheeks.");
		e.self:Say("Yes. . . none so as Ailerina the Gentle, as she was so rightfully named. A lovely lass. Tender as a gentle morning mist. . . Yes. . . Indeed, quite lovely so. An enchanting creature. . . and as pure as Tunare's good grace itself. It is no wonder she caught the Earth Mother's eye.");
	elseif(e.message:findi("vile and nasty")) then
		e.self:Emote("glares and spits on the ground beside him.");
		e.self:Say("I know not why some of these. . . villains are called heroes. It is all part of the fold and plan, I am sure. However, I shall give ya this warning of one of them, perhaps the most vile of all, and that is Kizrak the Tyrant, a brutal creature of the Warlord who has quite the taste for halflings. . . and I mean not in the sense of good grace and kindness");
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
