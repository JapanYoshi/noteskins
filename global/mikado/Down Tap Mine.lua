return Def.ActorFrame{
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_down', 'tap mine' );
		Frame0000=0;
		Delay0000=1;
		InitCommand=function(self)
			self:effectclock('beat'):effectmagnitude(0,0,60):spin()
		end;
	};
};
