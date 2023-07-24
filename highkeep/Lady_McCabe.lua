function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Pleasure to meet you, %s. What brings you to High Hold? You do not appear to be the gambling type. Then again, you are speaking with me. That is quite a gamble in itself. I just love high rollers. Really, I do!",e.other:GetName()));
	elseif(e.message:findi("carson")) then
		e.self:Say("You do not know who Carson McCabe is?!  No wonder you dare to speak with me! You know what they say, 'Those who dare, win!'");
	elseif(e.message:findi("anna")) then
		e.self:Say("The Highpass hussy? I don't think you are rich enough to attract her affections. She would search for other requirements if she were... a lady. But she is a blatant trollop! I would have her executed if Carson would allow me. She is some sort of friend to Carson. <rolls eyes> Hmph! Grrrrr!");
	elseif(e.message:findi("are you")) then
		e.self:Say("You really know all the right things to say. If only I'd never married Carson.");
	elseif(e.message:findi("staff")) then
		e.self:Say("I have no idea what you are talking about. Battle staff...  Hmmm...  No, it does not ring a bell.");
	end
end
