function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("turns toward you with an icy glare. ''Hail Findim , I am Vorshar the Despised. I trust that you have important business with me? Why else would you disturb one such as I when it is so obvious that I am a being of great power. I was [selected by Innoruuk] himself to reside in the Realm of Heroes. I have sacrificed many a mortal in the eyes of hate and do not be so quick to assume that I would not be delighted to perform such a rite again.'' Vorshar the Despised curls his lip in a twisted, sinister smirk.");
	elseif(e.message:findi("selected")) then
		e.self:Say("Why? You dare to ask one such as I the will of the Hateful Father?! However, you do seem to be quite lacking in the field of thought and intelligence, which would easily explain why you have not heard my name [nor of my legend].");
	elseif(e.message:findi("legend")) then
		e.self:Say("I. my dear witless Dark Elf. was chosen by Innoruuk's hand during the uprising and fall of the [Combine Empire.] When the Teir`Dal first began to discuss the decision to sign a treaty and join the Empire. I was one of the few who opposed siding with humans and the rest of the lowly creatures of this world.");
	elseif(e.message:findi("combine")) then
		e.self:Emote("narrows his eyes, blazing with hatred and a sinister amusement. 'The Combine Empire was a short-lived political structure of many of the world's races that fell shortly after my ascension. Innoruuk had found my faith and devotion to his word and his children so appealing, that he had chosen me to walk within the Hall of Heroes, although now, I have been [allowed a return]. To this moment, I know not why I have been given such a punishment as to again lay sight and ear to the grotesque, obtuse creatures of Norrath.'");
	elseif(e.message:findi("return")) then
		e.self:Say("It is the Dark Father's will that I have returned to this realm. I do not question his judgement. nor shall I ever. His will is mine. and I do not question myself. The Dark Father wishes to expand his followers within the Realm of Heroes. and thus. I have been sent as more of a judge and jury for those who would [consider themselves worthy] of Innoruuk's recognition and divine favor.");
	elseif(e.message:findi("worthy")) then
		e.self:Emote("looks at you a moment, his features emotionless beyond the searing impatience and hatred within his eyes. 'Then you have only furthered my faith in your utter lack in wit. Those who would gain favor with The Dark Father carry a symbol, a coin, that they must give to me for proper judgement. Without that coin, you are but another fool among a sea of imbeciles.'");
	end
end

--END of FILE Zone:neriakb  ID:41082 -- Vorshar_the_Despised
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------