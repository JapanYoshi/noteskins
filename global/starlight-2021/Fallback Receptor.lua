-- reinventing the button redirect wheel bc stepmania theming is hell
local ButtonRedir =
{
	Up = "Down",
	Down = "Down",
	Left = "Down",
	Right = "Down",
	UpLeft = "UpLeft",
	UpRight = "UpLeft",
	DownLeft = "UpLeft",
	DownRight = "UpLeft",
	Center = "Center",
};
local Button = ButtonRedir[Var "Button"] or "Center";
local t = Def.ActorFrame {
	Def.Sprite {
		Texture=NOTESKIN:GetPath(Button, '_ReceptorSheet' );
		Name="Base";
		Frame0000=0;
		Delay0000=1;
		InitCommand=NOTESKIN:GetMetricA('ReceptorArrow', 'InitCommand');
		PressCommand=NOTESKIN:GetMetricA('ReceptorArrow', 'PressCommand');
		LiftCommand=NOTESKIN:GetMetricA('ReceptorArrow', 'LiftCommand');
		NoneCommand=NOTESKIN:GetMetricA('ReceptorArrow', 'PressCommand');
	};
	Def.Sprite {
		Texture=NOTESKIN:GetPath(Button, '_ReceptorSheet' );
		Name="Flash";
		Frame0000=1;
		Delay0000=1;
		InitCommand=function(self)
			self:effectclock("beat");
			self:diffuseramp():effectcolor1(1,1,1,1):effectcolor2(1,1,1,0);
			self:effecttiming(
				0.0625, -- ramp_to_half
				0.0000, -- hold_at_half
				0.0625, -- ramp_to_full
				0.1250, -- hold_at_zero
				0.7500  -- hold_at_full
			)
		end;
		NOTESKIN:GetMetricA('ReceptorArrow', 'FlashCommand');
	};
	Def.Sprite {
		Texture=NOTESKIN:GetPath(Button, '_ReceptorSheet' );	
		Frames=Sprite.LinearFrames(1,1);
		Frame0000=2;
		InitCommand=NOTESKIN:GetMetricA('ReceptorOverlay', 'InitCommand');
		PressCommand=NOTESKIN:GetMetricA('ReceptorOverlay', 'PressCommand');
		LiftCommand=NOTESKIN:GetMetricA('ReceptorOverlay', 'LiftCommand');
		NoneCommand=NOTESKIN:GetMetricA('ReceptorOverlay', 'NoneCommand');
	};
};
return t;
