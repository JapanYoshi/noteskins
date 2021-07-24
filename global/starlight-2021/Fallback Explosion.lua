return Def.ActorFrame {
	--Hold Explosion Commands (I'll use the same thing for Rolls)
	NOTESKIN:LoadActor( "Down", "Hold Explosion" ) .. {
		HoldingOnCommand=function(self)
			self:effectoffset(math.random())
			self:rotationz(0);
			self:finishtweening();
			self:zoom(1):diffusealpha(1);
		end,
		HoldingOffCommand=function(self)
			self:finishtweening();
			self:zoom(1):diffusealpha(1);
			self:linear(0.1);
			self:rotationz(180);
			self:zoom(1.4):diffusealpha(0);
		end,
		RollOnCommand=function(self) self:playcommand("HoldingOn") end,
		RollOffCommand=function(self) self:playcommand("HoldingOff") end,
		InitCommand=function(self)
			self:effectclock("timer"):effectmagnitude(0,0,1):effectperiod(1)
				:spin();
			self:diffusealpha(0);
		end,
	},
    --We use this for Seperate Explosions for every Judgement
	NOTESKIN:LoadActor( "Down", "Tap Explosion Bad" ) .. {
		InitCommand=function(self) self:diffusealpha(0) end,
		W3Command=function(self)
			self:diffuse(JudgmentLineToColor("JudgmentLine_W3"));
			(NOTESKIN:GetMetricA("GhostArrowDim", "GlowCommand"))(self);
		end,
		W4Command=function(self)
			self:diffuse(JudgmentLineToColor("JudgmentLine_W4"));
			(NOTESKIN:GetMetricA("GhostArrowDim", "GlowCommand"))(self);
		end,
		W5Command=function(self)
			self:diffuse(JudgmentLineToColor("JudgmentLine_W5"));
			(NOTESKIN:GetMetricA("GhostArrowDim", "GlowCommand"))(self);
		end,
		JudgmentCommand=function(self) self:finishtweening() end,
		--BrightCommand=function(self) self:visible(true) end,
		--DimCommand=function(self) self:visible(true) end,
	},
	NOTESKIN:LoadActor( "Down", "Tap Explosion Good" ) .. {
		InitCommand=function(self) self:diffusealpha(0) end,
		W2Command=function(self)
			self:diffuse(JudgmentLineToColor("JudgmentLine_W2"));
			(NOTESKIN:GetMetricA("GhostArrowDim", "GlowCommand"))(self);
		end,
		JudgmentCommand=function(self) self:finishtweening() end,
		--BrightCommand=function(self) self:visible(true) end,
		--DimCommand=function(self) self:visible(true) end,
	},
	NOTESKIN:LoadActor( "Down", "Tap Explosion Great" ) .. {
		InitCommand=function(self) self:diffusealpha(0) end,
		HoldingOffCommand==function(self)
			self:diffuse(1,1,1,1);
			(NOTESKIN:GetMetricA("GhostArrowDim", "GlowCommand"))(self);
		end,
		RollOffCommand==function(self)
			self:diffuse(0.8,1,0,1);
			(NOTESKIN:GetMetricA("GhostArrowDim", "GlowCommand"))(self);
		end,
		W1Command=function(self)
			self:diffuse(JudgmentLineToColor("JudgmentLine_W1"));
			(NOTESKIN:GetMetricA("GhostArrowDim", "GlowCommand"))(self);
		end,
		ProW1Command=function(self)
			self:diffuse(JudgmentLineToColor("JudgmentLine_W1"));
			(NOTESKIN:GetMetricA("GhostArrowDim", "GlowCommand"))(self);
		end,
		ProW2Command=function(self)
			self:diffuse(JudgmentLineToColor("JudgmentLine_W2"));
			(NOTESKIN:GetMetricA("GhostArrowDim", "GlowCommand"))(self);
		end,
		ProW3Command=function(self)
			self:diffuse(JudgmentLineToColor("JudgmentLine_W3"));
			(NOTESKIN:GetMetricA("GhostArrowDim", "GlowCommand"))(self);
		end,
		ProW4Command=function(self)
			self:diffuse(JudgmentLineToColor("JudgmentLine_W4"));
			(NOTESKIN:GetMetricA("GhostArrowDim", "GlowCommand"))(self);
		end,
		ProW5Command=function(self)
			self:diffuse(JudgmentLineToColor("JudgmentLine_W5"));
			(NOTESKIN:GetMetricA("GhostArrowDim", "GlowCommand"))(self);
		end,
		JudgmentCommand=function(self) self:finishtweening() end,
		--BrightCommand=function(self) self:visible(true) end,
		--DimCommand=function(self) self:visible(true) end,
	},
	NOTESKIN:LoadActor( "Down", "Tap Particle Base" ) .. {
		InitCommand=function(self) self:diffusealpha(0) end,
		ProW1Command=NOTESKIN:GetMetricA("ExplosionParticle", "DimCommand"),
		ProW2Command=NOTESKIN:GetMetricA("ExplosionParticle", "DimCommand"),
		ProW3Command=NOTESKIN:GetMetricA("ExplosionParticle", "DimCommand"),
		ProW4Command=NOTESKIN:GetMetricA("ExplosionParticle", "DimCommand"),
		ProW5Command=NOTESKIN:GetMetricA("ExplosionParticle", "DimCommand"),
		W1Command=NOTESKIN:GetMetricA("ExplosionParticle", "DimCommand"),
		JudgmentCommand=function(self) self:finishtweening():rotationz(math.random() * 360) end,
		BrightCommand=function(self) self:visible(true) end,
		DimCommand=function(self) self:visible(true) end,
	},
	NOTESKIN:LoadActor( "Down", "Tap Particle Extra" ) .. {
		InitCommand=function(self) self:diffusealpha(0) end,
		ProW1Command=NOTESKIN:GetMetricA("ExplosionParticle", "BrightCommand"),
		ProW2Command=NOTESKIN:GetMetricA("ExplosionParticle", "BrightCommand"),
		ProW3Command=NOTESKIN:GetMetricA("ExplosionParticle", "BrightCommand"),
		JudgmentCommand=function(self) self:finishtweening():rotationz(math.random() * 360) end,
		BrightCommand=function(self) self:visible(true) end,
		DimCommand=function(self) self:visible(true) end,
	},
	--Mine Explosion Commands
	NOTESKIN:LoadActor( "Down", "HitMine Explosion" ) .. {
		InitCommand=NOTESKIN:GetMetricA("GhostArrowDim", "MineInitCommand"),
		HitMineCommand=NOTESKIN:GetMetricA("GhostArrowDim", "HitMineCommand"),
	},
}