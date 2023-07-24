function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Blessed are the followers of [Rodcet Nife].  Do you [seek the answers to life]?");
	elseif(e.message:findi("rodcet")) then
		e.self:Say("He is the preserver of life.  Go to Qeynos.  Visit the Temple of Life.  Join us.");
	elseif(e.message:findi("answers")) then
		e.self:Say("Take this.  I urge you to visit the Temple of Life in Qeynos.  The answers can be found therein.");
		e.other:SummonCursorItem(18830);
	elseif(e.message:findi("oil")) then
		e.self:Say("Oh!  Do you have the blessed oil?  [Brother Estle] has been waiting for it.  He shall be here soon or you can find him at a merchant's homestead opposite this side of the path.");
	elseif(e.message:findi("bertoxxulous")) then
		e.self:Say("You speak of the spawn of all disease.  Seek no more knowledge of this evil lord.  Know only that his way can lead only to eternal damnation.");
	elseif(e.message:findi("trintle")) then
		e.self:Say("Brother Trintle is a member of my order, the Priests of Life.  I take his watch from time to time.  The last I saw of him, he was met by some lady named Nomaria Dosenar.  She appeared to be a cleric of some kind, but I have never seen her in Qeynos.  Perhaps she is new to the Knights of Thunder.");
	elseif(e.message:findi("estle")) then
		e.self:Say("Brother Estle spends most of his time at the merchant's homestead opposite this tree.  He is one of the young acolytes sent by the Temple of Life to assist the residents of the plains, as am I.");		
	end
end
