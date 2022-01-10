local TEXT_BOX = script:GetCustomProperty("TextBox"):WaitForObject()

function Destroy()
    Events.Broadcast("Boom")
end

function Boom()
    if Object.IsValid(script.parent) then
        script.parent:Destroy()
    end
end

script.parent.destroyEvent:Connect(Destroy)
script.destroyEvent:Connect(Destroy)
Events.Connect("Boom",Boom)



function DoomsdayCount()
    TEXT_BOX.text="Prepare yourself for server crash"
    Task.Wait(3)
    TEXT_BOX.text=TEXT_BOX.text.." in"
    Task.Wait(0.25)
    TEXT_BOX.text=TEXT_BOX.text.." 3"
    Task.Wait(1)
    TEXT_BOX.text=TEXT_BOX.text.." 2"
    Task.Wait(1)
    TEXT_BOX.text=TEXT_BOX.text.." 1"
    Task.Wait(1)
    TEXT_BOX.text="BOOM!"
    script.parent:Destroy()
end

Game.playerJoinedEvent:Connect(DoomsdayCount)