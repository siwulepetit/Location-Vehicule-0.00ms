ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local Positions = {x = -489.88, y = -670.84, z = 31.88}

Citizen.CreateThread(function()
    while true do
        local wait = 750
        for k in pairs(Positions) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, -489.88745117188, -670.84857177734, 31.864154815674)

            if dist <= 3 then
                wait = 1
                DrawMarker(6, -489.88745117188, -670.84857177734, 31.864154815674, 3.0, 5.0, 500.0, 1.0, 50.0, 0.0, 0.8, 1.2, 0.8, 0, 122, 255, 250, false, false, 2, nil, nil, false)
                if dist <= 2.0 then
                    wait = 1
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_PICKUP~ pour choisir un vehicle")
                    if IsControlJustPressed(1,51) then
                        Loc()
                        TriggerEvent('esx:showNotification', 'Bienvenu sur le server de HyperiaRP')
                    end
                end
            end
        end
        Wait(wait)
    end
end)
local prixp = 0
local prixf = 0




function Loc()

    local menuTest = RageUI.CreateMenu(nil,GetPlayerName(PlayerId()))

    RageUI.Visible(menuTest, not RageUI.Visible(menuTest))

    while menuTest do

        Citizen.Wait(0)

        RageUI.IsVisible(menuTest,true,true,true,function()
            RageUI.Separator('Votre ID : '..GetPlayerServerId(PlayerId()))
            RageUI.line()
            RageUI.ButtonWithStyle("Panto", nil, {RightLabel = "~g~"..prixp.."~g~$" }, true, function(Hovered, Actived, Selected)
                if Selected then
                    ExecuteCommand("car panto")

                end
            end)
            RageUI.ButtonWithStyle("Faggio", nil, {RightLabel = "~g~"..prixf.."~g~$" }, true, function(Hovered, Actived, Selected)
                if Selected then
                    ExecuteCommand("car faggio")
                end
            end)
            RageUI.line()



        end, function()
        end)

        if not RageUI.Visible(menuTest) then
            menuTest=RMenu:DeleteType("", true)
        end

    end

end