function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("lowers his horn towards " .. e.other:GetCleanName() .. ". The air around you begins to waver as if immense heat was rising from the floor, yet the air feels no different. You begin to feel heavy and disoriented as you hear a loud whisper begin to speak yet hear no sound at all. 'wHaT sEeK iT Is YoU FrOM LiTHiNiaTh?'");
	elseif(e.message:findi("loot")) then
		e.self:Say("Prince Thirneg of the Tunarean Court has amassed a vast supply of phat lewts! Perhaps you should ask him for some!");
	elseif(e.message:findi("bristlebane")) then
		e.self:Emote("smiles, exposing his yellowed equine teeth and emits a deep rumbling chuckle. 'I wOuLD ADviSe aGaiNST seEKing tHat inDiviDuAl. Trust me, he is quite mad!! HahahahHHHaAAahhaAhahahahHhahahaahahaHHHhahah!!'");
	elseif(e.message:findi("white stallion")) then
		e.self:Say("WhY dOeS eVErYonE aSk mE abOuT tHaT crEAturE? ThE oNly sTalLions I hAVe sEeN aRe iN tHe PLaNe oF GrOwTh! SuReLy BrisTleBaNe iS cAUsiNg yOuR eYeS tO deCieVe yOu!! NeXt yOu'rE gOiNg tO tEll Me tHeRe aRe fLyiNG MOnkeYs! ThEre sHaLL bE nO mOre tALk oF nOn eXistaNt cReAturEs.");
	elseif(e.message:findi("tunarean court")) then
		e.self:Say("I aM nO LoNger AFfiLiaTeD wItH thAt pArtiCulaR sOciEtY oF bEiNgs. I hAve bEcOme thE aNtiTheSis Of tHeiR maGicAl naTuRe sO Am nO LOngEr weLcOme iN mY foREst.");
	elseif(e.message:findi("forest")) then
		e.self:Say("THaT's riGHt. It'S mY foREst.");
	end
end
