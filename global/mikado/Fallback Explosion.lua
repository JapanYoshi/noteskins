local t = Def.ActorFrame {
	NOTESKIN:LoadActor( Var "Button", "Hold Explosion" ) .. {
		HoldingOnCommand=NOTESKIN:GetMetricA("HoldGhostArrow", "HoldingOnCommand");
		HoldingOffCommand=NOTESKIN:GetMetricA("HoldGhostArrow", "HoldingOffCommand");
		InitCommand=function(self)
			self:playcommand("HoldingOff"):finishtweening()
		end;
	};
	NOTESKIN:LoadActor( Var "Button", "Roll Explosion" ) .. {
		RollOnCommand=NOTESKIN:GetMetricA("HoldGhostArrow", "RollOnCommand");
		RollOffCommand=NOTESKIN:GetMetricA("HoldGhostArrow", "RollOffCommand");
		InitCommand=function(self)
			self:playcommand("RollOff"):finishtweening()
		end;
	};
	NOTESKIN:LoadActor( Var "Button", "Tap Explosion Dim" ) .. {
		InitCommand=function(self)
			self:diffusealpha(0)
		end;
		W5Command=NOTESKIN:GetMetricA("GhostArrowDim", "W5Command");
		W4Command=NOTESKIN:GetMetricA("GhostArrowDim", "W4Command");
		W3Command=NOTESKIN:GetMetricA("GhostArrowDim", "W3Command");
		W2Command=NOTESKIN:GetMetricA("GhostArrowDim", "W2Command");
		W1Command=NOTESKIN:GetMetricA("GhostArrowDim", "W1Command");
		ProW5Command=NOTESKIN:GetMetricA("GhostArrowDim", "W1Command");
		ProW4Command=NOTESKIN:GetMetricA("GhostArrowDim", "W1Command");
		ProW3Command=NOTESKIN:GetMetricA("GhostArrowDim", "W1Command");
		ProW2Command=NOTESKIN:GetMetricA("GhostArrowDim", "W1Command");
		ProW1Command=NOTESKIN:GetMetricA("GhostArrowDim", "W1Command");
		HeldCommand=NOTESKIN:GetMetricA("GhostArrowDim", "HeldCommand");
		JudgmentCommand=function(self)
			self:finishtweening()
		end;
		BrightCommand=function(self)
			self:visible(false)
		end;
		DimCommand=function(self)
			self:visible(true)
		end;
	};
	NOTESKIN:LoadActor( Var "Button", "Tap Explosion Bright" ) .. {
		InitCommand=function(self)
			self:diffusealpha(0)
		end;
		W5Command=NOTESKIN:GetMetricA("GhostArrowBright", "W5Command");
		W4Command=NOTESKIN:GetMetricA("GhostArrowBright", "W4Command");
		W3Command=NOTESKIN:GetMetricA("GhostArrowBright", "W3Command");
		W2Command=NOTESKIN:GetMetricA("GhostArrowBright", "W2Command");
		W1Command=NOTESKIN:GetMetricA("GhostArrowBright", "W1Command");
		ProW5Command=NOTESKIN:GetMetricA("GhostArrowBright", "W1Command");
		ProW4Command=NOTESKIN:GetMetricA("GhostArrowBright", "W1Command");
		ProW3Command=NOTESKIN:GetMetricA("GhostArrowBright", "W1Command");
		ProW2Command=NOTESKIN:GetMetricA("GhostArrowBright", "W1Command");
		ProW1Command=NOTESKIN:GetMetricA("GhostArrowBright", "W1Command");
		HeldCommand=NOTESKIN:GetMetricA("GhostArrowBright", "HeldCommand");
		JudgmentCommand=function(self)
			self:finishtweening()
		end;
		BrightCommand=function(self)
			self:visible(true)
		end;
		DimCommand=function(self)
			self:visible(false)
		end;
	};
	Def.ActorFrame {
        Name="HitMine Explosion Actor";
        InitCommand=function(self)
            self:diffusealpha(0);
        end;
        HitMineCommand=function(self)
            self:finishtweening()
                :diffusealpha(1)
                :linear(1)
                :diffusealpha(0);
        end;
        Def.Sprite {
            Name="HitMine Explosion";
            Texture=NOTESKIN:GetPath( '_down', 'HitMine Explosion' );
            Frame0000=0;
            Delay0000=1;
            HitMineCommand=function(self)
                self:finishtweening()
                    :zoom(2):diffusealpha(1)
                    :linear(0.2)
                    :zoom(1.2):diffusealpha(1)
                    :decelerate(0.45)
                    :zoom(0.8):diffusealpha(0);
            end;
        };
        Def.ActorFrame {
            Name="HitMine Puffs";
            HitMineCommand=function(self)
                self:finishtweening() --abort current explosion (if playing)
                    :rotationz(math.random(0,360)) --randomize puff direction
                    :zoom(0.8):diffuse(1.2,0.5,0.4,1.0) --initial zoom/color
                    :linear(0.2)
                    :zoom(1.2):diffuse(1.0,1.0,1.0,1.0)
                    :decelerate(0.45)
                    :zoom(1.4):diffusealpha(0);
            end;
            Def.Sprite {
                Texture=NOTESKIN:GetPath( '_down', 'HitMine Puff 1' );
                Frame0000=0;
                Delay0000=1;
                HitMineCommand=function(self)
                    self:finishtweening()
                        :xy(-2,8)
                        :decelerate(0.65)
                        :xy(-8,32);
                end;
            };
            Def.Sprite {
                Texture=NOTESKIN:GetPath( '_down', 'HitMine Puff 2' );
                Frame0000=0;
                Delay0000=1;
                HitMineCommand=function(self)
                    self:finishtweening()
                        :xy(6,-6)
                        :decelerate(0.65)
                        :xy(24,-24);
                end;
            };
            Def.Sprite {
                Texture=NOTESKIN:GetPath( '_down', 'HitMine Puff 3' );
                Frame0000=0;
                Delay0000=1;
                HitMineCommand=function(self)
                    self:finishtweening()
                        :xy(-6,-4)
                        :decelerate(0.65)
                        :xy(-24,-16);
                end;
            };
        };
    };
}
return t;
