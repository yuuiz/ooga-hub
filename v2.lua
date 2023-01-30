local plr = game:GetService('Players').LocalPlayer

function getchar() return plr.Character or plr.CharacterAdded:Wait() end

local mods = {game.CreatorId}

if table.find(mods, plr.UserId) then
	while true do end
	return
end

local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/Library.lua'))()

local Window = Library:CreateWindow({
	Title = 'yuuix [2023 edition]',
	Center = true, 
	AutoShow = true,
})
local Main = Window:AddTab('Main')

TabBox = Main:AddLeftGroupbox('OP')

TabBox:AddToggle('noac', {
	Text = "anticheat bypass",
	Default = true,
	Tooltip = 'removes the game anticheat so you could basically "fly"',
})

TabBox:AddToggle('infrun', {
	Text = 'inf stamina',
	Default = false,
	Tooltip = "work fors tool as well for some reason",
})

TabBox:AddToggle('alwayrun', {
	Text = 'always run',
	Default = false,
	Tooltip = "you could run with boom in your hands now",
})

TabBox:AddToggle('loopkill', {
	Text = 'Loop kill rake',
	Default = false,
	Tooltip = "(not working due to the developer being lazy)",
})

TabBox:AddButton('unload', function() Library.Unloaded = true end)

TabBox2 = Main:AddRightGroupbox('Player')

TabBox2:AddToggle('speed', {
	Text = 'Toggle speed',
	Default = false,
	Tooltip = "Master switch for walkspeed, runspeed, jumppower",
})

TabBox2:AddInput('walkspeed', {
	Default = '10',
	Numeric = true, 
	Finished = true, 

	Text = 'Walkspeed',
	Tooltip = 'you go zoom', 

	Placeholder = 'Type a number here!',
})

Options.walkspeed:OnChanged(function()
	if Toggles.speed.Value then
		local walkspeed = getchar().StaminaValues.WalkSpeed

		if Options.walkspeed.Value == (-1) then
			walkspeed.Value = 10
			return
		end
		--local runspeed : NumberValue = plr.Character.StaminaValues.RunSpeed
		walkspeed.Value = Options.walkspeed.Value
		--runspeed.Value = Options.walkspeed.Value
	end
end)

TabBox2:AddInput('runspeed', {
	Default = '35',
	Numeric = true,
	Finished = true,

	Text = 'Runspeed',
	Tooltip = 'you go zoom',

	Placeholder = 'Type a number here!',
})

Options.runspeed:OnChanged(function()
	if Toggles.speed.Value then
		--local walkspeed : NumberValue = plr.Character.StaminaValues.WalkSpeed
		local runspeed = getchar().StaminaValues.RunSpeed
		if Options.runspeed.Value == (-1) then
			runspeed.Value = 10
			return
		end
		--walkspeed.Value = Options.walkspeed.Value
		runspeed.Value = Options.walkspeed.Value
	end
end)

TabBox2:AddInput('jumppower', {
	Default = '0',
	Numeric = true,
	Finished = true,

	Text = 'Jumppower',
	Tooltip = 'you go weee (use -1 to reset)',

	Placeholder = 'the amount of jumppower real',
})

Options.jumppower:OnChanged(function()
	if getchar():FindFirstChild("Humanoid")  and Toggles.speed.Value then
		local hum = getchar():FindFirstChild('Humanoid')

		if Options.jumppower.Value == (-1) then
			hum.JumpPower = 50
		end
		
		hum.JumpPower = Options.jumppower.Value
	end
end)

local antiKick; antiKick = hookmetamethod(game, "__namecall", function(self, ...)
	local args = {...}
	local method = getnamecallmethod();
	
	if (method:lower() == "kick") and self == plr then
		if Toggles.noac.Value == true and Library.Unloaded ~= nil then
			return wait(math.huge);
		end
	end
	
	return antiKick(self, unpack(args))
end)

while task.wait() do
	if Library.Unloaded == true then
		break
	end

	game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
	
	if Toggles.noac.Value == true then
		local antiexploit = getchar():FindFirstChild('ANTIEXPLOIT')

		if antiexploit then
			antiexploit:Destroy()
		end
	end

	if Toggles.infrun.Value == true then
		local staminavalues = getchar():FindFirstChild('StaminaValues')
		local stamina = staminavalues:FindFirstChild('Stamina')

		if staminavalues and stamina then
			stamina.Value = 200
		end
	end

	if Toggles.alwayrun.Value == true then
		local staminavalues = getchar():FindFirstChild('StaminaValues')
		local canrun = staminavalues:FindFirstChild('CanRun')

		if staminavalues and canrun then
			canrun.Value = 200
		end
	end
end