#****************************************************************************
#**
#**  File     :  /cdimage/units/XRL0305/XRL0305_script.lua
#**  Author(s):  Drew Staltman, Jessica St. Croix, Gordon Duclos
#**
#**  Summary  :  Cybran Siege Assault Bot Script
#**
#**  Copyright � 2007 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************
local CWalkingLandUnit = import('/lua/cybranunits.lua').CWalkingLandUnit
local CWeapons = import('/lua/cybranweapons.lua')
local CDFHeavyDisintegratorWeapon = CWeapons.CDFHeavyDisintegratorWeapon
local CANNaniteTorpedoWeapon = import('/lua/cybranweapons.lua').CANNaniteTorpedoWeapon
local CIFSmartCharge = import('/lua/cybranweapons.lua').CIFSmartCharge

XRL0305 = Class(CWalkingLandUnit)
{
    Weapons = {
        Disintigrator = Class(CDFHeavyDisintegratorWeapon) {},
        Torpedo = Class(CANNaniteTorpedoWeapon) {},
        AntiTorpedo = Class(CIFSmartCharge) {},
    },
    
	OnLayerChange = function(self, new, old)
		CLandUnit.OnLayerChange(self, new, old)
		if self.WeaponsEnabled then
			local LandSpeedMult = self:GetBlueprint().Physics.WaterSpeedMultiplier
			if( new == 'Land' ) then
                self:SetSpeedMult(1)
			elseif ( new == 'Seabed' ) then
                self:SetSpeedMult(LandSpeedMult)
			end
		end
	end,
}
TypeClass = XRL0305