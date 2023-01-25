local plr = game:GetService('Players').LocalPlayer

function getchar() return plr.Character or plr.CharacterAdded:Wait() end

--[[
local function DamageRake(damage : number)
    pcall(function()
        local args = {
            [1] = workspace.Rake.HumanoidRootPart,
            [2] = workspace.Rake.Humanoid,
            [3] = damage,
            [4] = "AAKKAKKAAKKA112121",
            [5] = "ALALALAQAQAQ1+!'SA",
            [6] = "TESTMQMQOQZP11A"
        }
    
        game:GetService("ReplicatedStorage").PanRE.DamageRE:FireServer(unpack(args))
    end)
end
--]]
local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local Window = Library:CreateWindow({
    Title = 'yuuix [BETA]',
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
TabBox:AddButton('unload', function() Library:Unload() end)
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
    if getchar() and Toggles.speed.Value then
        local walkspeed : NumberValue = getchar().StaminaValues.WalkSpeed
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
        local runspeed : NumberValue = getchar().StaminaValues.RunSpeed
        --walkspeed.Value = Options.walkspeed.Value
        runspeed.Value = Options.walkspeed.Value
    end
end)
TabBox2:AddInput('jumppower', {
    Default = '0',
    Numeric = true, -- true / false, only allows numbers
    Finished = true, -- true / false, only calls callback when you press enter

    Text = 'Jumppower',
    Tooltip = 'you go weee', -- Information shown when you hover over the textbox

    Placeholder = 'the amount of jumppower real', -- placeholder text when the box is empty
})
Options.jumppower:OnChanged(function()
    if getchar():FindFirstChildOfClass("Humanoid")  and Toggles.speed.Value then
        if Options.jumppower.Value == 0 then
            getchar():FindFirstChildOfClass("Humanoid").JumpPower = 50
        end
        getchar():FindFirstChildOfClass("Humanoid").JumpPower = Options.jumppower.Value
    end
end)
local antiKick; antiKick = hookmetamethod(game, "__namecall", function(self, ...)
    local args = {...}
    local method = getnamecallmethod();
    
    if (method == "Kick" or method == "kick") and self == plr then
        if Toggles.noac.Value == true and Library.Unloaded == true then
            print("anti kick disabler best")
            return wait(9e9);
        end
    end
    
    return antiKick(self, unpack(args))
 end)
Library:OnUnload(function()
    Library.Unloaded = true
end)
while task.wait() do
    if Library.Unloaded == true then
        break
    end
    game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
    if Toggles.noac.Value == true then
        if getchar():FindFirstChild('ANTIEXPLOIT') then
            local antiexploit = getchar():FindFirstChild('ANTIEXPLOIT')

            if antiexploit then
				antiexploit:Destroy()
			end
        end
    end
    if Toggles.infrun.Value == true then
        if getchar():FindFirstChild('StaminaValues') and getchar().StaminaValues:FindFirstChild('Stamina') then
			getchar().StaminaValues.Stamina.Value = 200
		end
    end
    if Toggles.alwayrun.Value == true then
        if getchar():FindFirstChild('StaminaValues') and getchar():FindFirstChild('CanRun') then
			getchar().StaminaValues.CanRun.Value = true
		end
    end
end
