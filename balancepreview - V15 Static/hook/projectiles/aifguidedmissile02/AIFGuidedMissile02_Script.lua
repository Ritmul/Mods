#****************************************************************************
#**
#**  File     :  /data/projectiles/AIFGuidedMissile02/AIFGuidedMissile02_script.lua
#**  Author(s):  Gordon Duclos
#**
#**  Summary  :  Aeon Guided Split Missile, DAA0206
#**
#**  Copyright � 2007 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************
local AGuidedMissileProjectile = import('/lua/aeonprojectiles.lua').AGuidedMissileProjectile

AIFGuidedMissile02 = Class(AGuidedMissileProjectile) {

    OnCreate = function(self)
		AGuidedMissileProjectile.OnCreate(self)
		self:ForkThread( self.MovementThread )
    end,
    
	MovementThread = function(self)
		WaitSeconds(1)
		self:TrackTarget(true)
	end,
}
TypeClass = AIFGuidedMissile02
