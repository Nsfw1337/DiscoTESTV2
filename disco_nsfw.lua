local discomusic = "https://ru.hitmotop.com/get/music/20201226/kobyakov_-_Ty_prosto_prosto_pushka_malyshka_bezdelushka_72097619.mp3"
local discomusic2 = "https://ru.hitmotop.com/get/music/20190323/Danzel_-_You_Spin_Me_Round_62990119.mp3"
local discomusicclassics = "mono"
local sosimychlen = Material( "materials/aquarp/nsfw.png", "mooth" )
local map = 149
local map2 = 79
local volumes = 24
local cdmap = 35

--[[
 SPAM
--]]

timer.Create("spamchat", 1.5, 0, function()
    local time = tonumber(0)
    local Message = {
    "< NSFW >",
    "<< NSFW >>",
    "<<< NSFW >>>",
    "<<<< NSFW >>>>",
    "<<<<< NSFW >>>>>",
    "<<<<<< NSFW >>>>>>",
    "<<<<<<< NSFW >>>>>>>",
    "<<<<<<<< NSFW >>>>>>>>",
    "<<<<<<<<< NSFW >>>>>>>>>",
    "<<<<<<<< NSFW >>>>>>>>",
    "<<<<<<< NSFW >>>>>>>",
    "<<<<<< NSFW >>>>>>",
    "<<<<< NSFW >>>>>",
    "<<<< NSFW >>>>",
    "<<< NSFW >>>",
    "<< NSFW >>",
    "< NSFW >",
    }
    for _, line in pairs(Message) do
    time = time + tonumber(0.1)
    timer.Simple(time,function()
        chat.AddText(HSVToColor( CurTime() % 6 * 60, 1, 1 ),line)
        end)
    end
end)

--[[

 Others

--]]

function GAMEMODE:PreDrawSkyBox()
    local col = HSVToColor(RealTime() * 120 % 360, 1, 1)
    render.Clear(col.r / 1.3, col.g / 1.3, col.b / 1.3, 255)

    return not not 1
end

timer.Create("asdasd", 2, 0, function()
    for k, v in pairs(player.GetAll()) do
        if not v:IsValid() then return end
        v:DoAnimationEvent(ACT_GMOD_TAUNT_DANCE)
        v:SetMaterial("models/debug/debugwhite")
        v:SetColor(HSVToColor(RealTime() * 120 % 360, 1, 1))
    end
end)

local tab = {
    ["$pp_colour_addr"] = tonumber(0.001),
    ["$pp_colour_addg"] = tonumber(0.001),
    ["$pp_colour_addb"] = tonumber(0),
    ["$pp_colour_brightness"] = tonumber(-0.5),
    ["$pp_colour_contrast"] = tonumber(0.8),
    ["$pp_colour_colour"] = tonumber(3),
    ["$pp_colour_mulr"] = tonumber(1),
    ["$pp_colour_mulg"] = tonumber(0.5),
    ["$pp_colour_mulb"] = tonumber(0.4)
}

hook.Add("RenderScreenspaceEffects", "asdasddggg", function()
    DrawColorModify(tab)
end)

--[[
   2DSkyBoX
-]]

function GAMEMODE:PostDraw2DSkyBox()
    local col = HSVToColor(RealTime() * 120 % 360, 1, 1)
    render.Clear(col.r / 1.3, col.g / 1.3, col.b / 1.3, 255)

    return not not 1
end

--[[

 MAp_Krytitsa

--]]

local cam = cam
timer.Create("mapkrytitsa", cdmap, 0, function()
RunConsoleCommand("r_frustumcullworld",0)
hook.Add("PreRender","ebanaya_vertuha_1000-7",function()
    local mat = Matrix()

    local ang = Angle(0,CurTime()*map,CurTime()*map2,0)
    mat:Rotate(ang)


    cam.PushModelMatrix( mat )
 end)
end)
--[[
Visualizer
--]]

local AMPH = ScrH() * 5
local AMPW = ScrW() / 156
local a = 0
local smoothdata = {}
local data = {}
local view = {}
for i = 1,256 do
smoothdata[i] = 0
end
local xpcall = {}

local defaultfov = LocalPlayer():GetFOV()
local override = 70 hook.Add("CalcView", "EXROR_", function(ply, origin, angles, fov, znear, zfar) return { ["origin"] = origin, ["angles"] = angles, ["fov"] = override, ["znear"] = znear, ["zfar"] = zfar }
end)

sound.PlayURL(discomusic,discomusicclassics, function(source,err,errname)
	source:SetVolume( volumes )
    if IsValid(source) then
    	    hook.Add("HUDPaint","visualizer",function()
            source:FFT(data,FFT_4096)
            for i = 1,1 do
                smoothdata [i] = Lerp(5 * FrameTime(),smoothdata[i],data[i])
                	surface.SetDrawColor(255,255,255,255)
                	surface.SetMaterial( sosimychlen )
                	-- draw.RotatedBox( ScrW() / 2, ScrH() / 2, 2.5, 100 + smoothdata[i] * AMPH, i * 1.25 * CurTime() % 360, HSVToColor(RealTime() * 120 % 360, 1, 1) )
                	surface.DrawCircle( 965, 540, smoothdata[i] * AMPH, HSVToColor(RealTime() * 120 % 360, 1, 1) )
                    local tbl = {} source:FFT(tbl,FFT_4096) 
                    local fal = 0 for i=1,80 do
                    fal = fal + tbl[i] end
                            prevValue = Lerp(150 * FrameTime(), prevValue, fal) if fal > 2 then
                                override = Lerp(1 * FrameTime(), override, fal * .875)
                                net.Start("faitleserv") net.SendToServer()
                            else
                                override = Lerp(4 * FrameTime(), override, defaultfov)
                                sent = false
                            end
                        end
                    end)
                end
            end)
        
