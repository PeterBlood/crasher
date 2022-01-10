local killer
local player
local bot

while script.parent:GetCustomProperty("Owner")=="" do
    Task.Wait(0.1)
end

while script.parent:GetCustomProperty("PlayerTarget")=="" and script.parent:GetCustomProperty("BotTarget")==nil do
    Task.Wait(0.1)
end

killer=script.parent:GetCustomProperty("Owner")
if script.parent:GetCustomProperty("PlayerTarget")~="" then
    player=script.parent:GetCustomProperty("PlayerTarget")
else
    bot=script.parent:GetCustomProperty("BotTarget")
end

function Destroy()
    Events.Broadcast("StopGrab")
end

function StopGrab()
    if Object.IsValid(script.parent) then
        script.parent:Destroy()
    end
end

script.parent.destroyEvent:Connect(Destroy)
script.destroyEvent:Connect(Destroy)
Events.Connect("StopGrab",StopGrab)