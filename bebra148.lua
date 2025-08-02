
require("zxcmodule")
ded.Write = nil
ded.Read = nil

local ultimate                          = {}


local MetaPlayer                        = FindMetaTable("Player")

local TraceHull                         = util.TraceHull    
local TraceLine                         = util.TraceLine





surface.CreateFont("Watermark_Bold", {
    font = "Verdana",
    size = 13,
    weight = 1000,
    antialias = true,
    shadow = true
})

surface.CreateFont("Watermark_Symbols", {
    font = "Verdana",
    size = 14,
    weight = 500,
    antialias = true
})



surface.CreateFont( "veranda", { font = "Verdana", size = 12, antialias = false, outline = true } )
surface.CreateFont( "veranda_s", { font = "Verdana", size = 12, antialias = false, shadow = true } )
surface.CreateFont( "veranda_scr", { font = "Verdana", size = ScreenScale( 9 ), antialias = false, outline = true } )

surface.CreateFont( "saddamhussein", { font = "Open Sans", size = 64, weight = 1000 } )

ultimate.Colors = {}

for i = 0,255 do  
    ultimate.Colors[i] = Color( i, i, i )
end

ultimate.Colors["Red"] = Color( 255, 0, 0)

ultimate.accent = Color( 255, 255, 255 )





local settings = {

}

local theme = {
    ["Frame background"] = Color(20, 10, 30),       -- Тёмно-фиолетовый
    ["Frame foreground"] = Color(40, 20, 60),       -- Средний фиолетовый
    ["Frame title"] = Color(180, 120, 220),         -- Светло-фиолетовый (акцент)
}

local pLocalPlayer = LocalPlayer()

local screenWidth = ScrW()
local screenHeight = ScrH()

local traceResult = {}
local traceStruct = { output = traceResult }

local flTickInterval = engine.TickInterval()

surface.CreateFont( "DermaSmall", {	
    font = "Comic Sans MS", 
    antialias = false,
    size = 15
} )










ultimate.cached = {}

ultimate.Materials = {}

ultimate.Materials["Gradient"] = Material("gui/gradient_up", "noclamp smooth")
ultimate.Materials["Gradient down"] = Material("gui/gradient_down", "noclamp smooth")
ultimate.Materials["Gradient right"] = Material("gui/gradient", "noclamp smooth")
ultimate.Materials["Alpha grid"] = Material("gui/alpha_grid.png", "noclamp smooth")
ultimate.blur = Material("pp/blurscreen")


ultimate.presets = {}
ultimate.cfg = { vars = {}, binds = {}, colors = {} }

ultimate.cfg.vars["Enable aimbot"]              = false
ultimate.cfg.binds["Aim on key"]                = 0

ultimate.cfg.vars["Silent aim"]                 = true
ultimate.cfg.vars["pSilent"]                    = false

ultimate.cfg.vars["Auto reload"]                = false
ultimate.cfg.vars["Auto fire"]                  = false
ultimate.cfg.vars["Auto reload"]                = false
ultimate.cfg.vars["Auto fire"]                  = false
ultimate.cfg.vars["Rapid fire"]                 = false
ultimate.cfg.vars["Alt Rapid fire"]             = false

ultimate.cfg.vars["Nospread"]                   = false
ultimate.cfg.vars["Force seed"]                 = false
ultimate.cfg.vars["Wait for seed"]              = false
ultimate.cfg.vars["Norecoil"]                   = false

ultimate.cfg.vars["Extrapolation"]              = false
ultimate.cfg.vars["last update"]                = false
ultimate.cfg.vars["Invalidate activity"]         = false
ultimate.cfg.vars["Bone fix"]                   = false
ultimate.cfg.vars["Update Client Anim fix"]     = false
ultimate.cfg.vars["Wait for simulation"]    = false
ultimate.cfg.vars["Disable interpolation"]      = true
ultimate.cfg.vars["Disable Sequence interpolation"] = true

ultimate.cfg.vars["Target selection"]           = 2 
ultimate.cfg.vars["Ignores-Friends"]            = false
ultimate.cfg.vars["Target-Priority-Only"]       = false
ultimate.cfg.vars["Ignores-Steam friends"]      = false
ultimate.cfg.vars["Ignores-Teammates"]          = false
ultimate.cfg.vars["Ignores-Admins"]             = false
ultimate.cfg.vars["Ignores-Bots"]               = false
ultimate.cfg.vars["Ignores-Frozen"]             = false
ultimate.cfg.vars["Ignores-Nodraw"]             = false
ultimate.cfg.vars["Ignores-Nocliping"]          = false
ultimate.cfg.vars["Ignores-God time"]           = false
ultimate.cfg.vars["Ignores-Head unhitable"]     = false
ultimate.cfg.vars["Ignores-Driver"]             = false
ultimate.cfg.vars["Wallz"]                      = false

ultimate.cfg.vars["Max targets"]                = 0
ultimate.cfg.vars["Max distance"]               = 4096

ultimate.cfg.vars["Hitbox selection"]           = 1
ultimate.cfg.vars["Hitscan"]                    = false
ultimate.cfg.vars["Hitscan groups-Head"]        = false
ultimate.cfg.vars["Hitscan groups-Chest"]       = false
ultimate.cfg.vars["Hitscan groups-Stomach"]     = false
ultimate.cfg.vars["Hitscan groups-Arms"]        = false
ultimate.cfg.vars["Hitscan groups-Legs"]        = false
ultimate.cfg.vars["Hitscan groups-Generic"]     = false
ultimate.cfg.vars["Hitscan mode"]               = 1
ultimate.cfg.vars["Multipoint"]                 = false
ultimate.cfg.vars["Multipoint scale"]           = 0.8
ultimate.cfg.vars["Multipoint groups-Head"]     = false
ultimate.cfg.vars["Multipoint groups-Chest"]    = false
ultimate.cfg.vars["Multipoint groups-Stomach"]  = false
ultimate.cfg.vars["Multipoint groups-Arms"]     = false
ultimate.cfg.vars["Multipoint groups-Legs"]     = false
ultimate.cfg.vars["Multipoint groups-Generic"]  = false

ultimate.cfg.vars["Adjust tickcount"]           = false
ultimate.cfg.vars["Gun switch"]                 = false
ultimate.cfg.vars["Auto detonator"]             = false
ultimate.cfg.vars["AutoD distance"]             = 96

ultimate.cfg.vars["Backtrack"]                  = false
ultimate.cfg.vars["Always backtrack"]           = false
ultimate.cfg.vars["Backtrack mode"]             = 1
ultimate.cfg.vars["Sampling interval"]          = 0
ultimate.cfg.vars["Backtrack time"]             = 200

ultimate.cfg.vars["Aimbot smoothing"]           = false
ultimate.cfg.vars["Smoothing"]                  = 0.05

ultimate.cfg.vars["Fov limit"]                  = false
ultimate.cfg.vars["Fov dynamic"]                = false
ultimate.cfg.vars["Aimbot FOV"]                 = 30
ultimate.cfg.vars["Show FOV"]                   = false
ultimate.cfg.colors["Show FOV"]                 = "255 255 0 255"
ultimate.cfg.colors["WaterMarkColor"]           = "255 255 255 255"

ultimate.cfg.vars["Aimbot snapline"]                   = false
ultimate.cfg.colors["Aimbot snapline"]                 = "255 128 0 255"
ultimate.cfg.vars["Aimbot marker"]                   = false
ultimate.cfg.colors["Aimbot marker"]                 = "255 255 255 255"



ultimate.cfg.vars["Trigger bot"]                = false
ultimate.cfg.binds["Trigger bot"]               = 0

ultimate.cfg.vars["Prop aimbot"]                = false
ultimate.cfg.vars["PA thrower"]                 = false
ultimate.cfg.vars["PA thrower dist"]            = 128
ultimate.cfg.vars["Prop max simtime"]           = 4
ultimate.cfg.vars["Sync mode"]                  = 1

ultimate.cfg.vars["Crossbow prediction"]        = false
ultimate.cfg.vars["Smg grenade prediction"]     = false

ultimate.cfg.vars["Simulation limit"]           = 4

ultimate.cfg.vars["Baim low health"]            = false
ultimate.cfg.vars["Baim health"]                = 65

ultimate.cfg.vars["Auto healthkit"]             = false
ultimate.cfg.vars["Healthkit-Self heal"]        = false
ultimate.cfg.vars["Healthkit-Heal closest"]     = false

ultimate.cfg.vars["Knifebot"]                   = false
ultimate.cfg.vars["Knifebot mode"]              = 1
ultimate.presets["Knifebot mode"] = { "Damage", "Fast", "Fatal" }

ultimate.cfg.vars["Facestab"]                   = false

ultimate.cfg.vars["Knifebot Range"]             = false

ultimate.cfg.vars["Projectile aimbot"]          = false
ultimate.cfg.vars["Predict fist"]               = false
ultimate.cfg.vars["Debug mode"]                 = true

ultimate.cfg.vars["Forwardtrack"]               = false
ultimate.cfg.vars["Forwardtrack time"]          = 100

ultimate.cfg.vars["NoAimLag"] = false

ultimate.cfg.vars["Lag fix"]                    = false
ultimate.cfg.vars["Backshoot"]                  = false





// Resolver 

ultimate.cfg.vars["left"] = false
ultimate.cfg.vars["right"] = false
ultimate.cfg.vars["pitchres"] = false

ultimate.cfg.vars["Resolver"] = false
ultimate.cfg.vars["Yaw mode"] = 1
ultimate.cfg.vars["Pitch resolver"] = false
ultimate.cfg.vars["Taunt resolver"] = false
ultimate.cfg.vars["Memory bullets"] = false




ultimate.cfg.vars["Invert first shot"] = false
ultimate.cfg.vars["Resolver max misses"] = 2
ultimate.cfg.vars["add delta"] = 0
ultimate.cfg.vars["add pitch"] = 0

// Tickbase 
ultimate.cfg.vars["Tickbase shift"] = false
ultimate.cfg.vars["Wait for unlag"] = false

ultimate.cfg.vars["Fakelag comp"] = 2

ultimate.cfg.vars["Skip fire tick"] = false
ultimate.cfg.vars["Double tap"] = false
ultimate.cfg.vars["Dodge projectiles"] = false
ultimate.cfg.vars["Passive recharge"] = false

ultimate.cfg.vars["Auto recharge"] = false
ultimate.cfg.vars["Wait for charge"] = false
ultimate.cfg.vars["Warp on peek"] = false

ultimate.cfg.vars["Charge ticks"] = 48
ultimate.cfg.vars["Shift ticks"] = 48
ultimate.cfg.binds["Tickbase shift"] = 0
ultimate.cfg.binds["Auto recharge"] = 0


ultimate.cfg.vars["Engine pred"] = false
ultimate.cfg.vars["GetManipulateInterp"] = false
ultimate.cfg.vars["LerpTime"] = false
ultimate.cfg.vars["LagCompensation"] = false




ultimate.cfg.vars["Anti aim"]                   = false
ultimate.cfg.vars["Yaw randomisation"]          = false

ultimate.cfg.vars["Custom real"]                = 75
ultimate.cfg.vars["Custom fake"]                = 180
ultimate.cfg.vars["Fake switch"]                = 180
ultimate.cfg.vars["Real switch"]                = 180
ultimate.cfg.vars["Custom pitch"]               = 89
ultimate.cfg.vars["Spin speed"]                 = 30
ultimate.cfg.vars["LBY min delta"]              = 100
ultimate.cfg.vars["LBY break delta"]            = 120
ultimate.cfg.vars["Sin delta"]                  = 89
ultimate.cfg.vars["Sin add"]                    = 11
ultimate.cfg.vars["Jitter delta"]               = 45
ultimate.cfg.vars["Low delta value"]            = 0
ultimate.cfg.vars["Switch time"]                = 0.6

ultimate.cfg.vars["Anti-BruteForce"]            = false

ultimate.cfg.vars["Yaw base"]                   = 1
ultimate.presets["Yaw base"] = { "Viewangles", "At targets" }
ultimate.cfg.vars["Yaw"]                        = 1
ultimate.presets["Yaw"] = { 
    "Backward", "Fake Forward", "Legit Delta",
    "Sideways", "Half Sideways",
    "Fake Spin", "LBY", "LBY Breaker",
    "Sin Sway", "Pendulum Sway", "Lag Sway",
    "Fake Jitter", "Kappa Jitter", "Abu Jitter",
    "Satanic Spin", "Custom",
    "Hand Block", "Low delta",
    "Desync", "Tank AA", "Fake switch",
    "Dolphin Mode", "Freeze Frame",
    "Invisible Man", "Matrix Glitch",
    "Unhittable", "Unhittable2"
}
ultimate.cfg.vars["Pitch"]                      = 1
ultimate.presets["Pitch"] = { 
    "Down", "Up", "Zero", 
    "Fake down", "Fake fake down", 
    "Fake jitter","Fake down break", "Kizaru", 
    "Fake zero", "Fake Up jitter",
    "Up jitter","Flicker +Up","Fucker Flicker +Up",
    "Custom pitch"
}
ultimate.cfg.vars["Edge"]                       = 1

ultimate.cfg.binds["Anti aim"]                   = 0







ultimate.cfg.vars["Antiaim material"] = 1
ultimate.cfg.vars["Antiaim fullbright"] = false
ultimate.cfg.colors["Real chams"] = "128 128 255 255"

// Anim breakers 

ultimate.cfg.vars["Taunt spam"] = false
ultimate.cfg.vars["Taunt"] = 1
ultimate.cfg.vars["Taunt 2"] = false
ultimate.cfg.vars["Taunt 2.1"] = 1

ultimate.cfg.vars["Handjob"] = false
ultimate.cfg.vars["Handjob mode"] = 1


ultimate.cfg.vars["Micromovement"] = false
ultimate.cfg.vars["On shot aa"] = false
ultimate.cfg.vars["Freestanding"] = false
ultimate.cfg.binds["freestand"] = 0
ultimate.cfg.vars["Inverter"] = false
ultimate.cfg.binds["Inverter"] = 0
ultimate.cfg.vars["Anti aim chams"] = false

ultimate.cfg.vars["Angle arrows"] = false






ultimate.cfg.vars["Free standing"] = false
ultimate.cfg.vars["Dancer"] = false
    ultimate.cfg.vars["Dance"] = 1
    ultimate.cfg.vars["Arm breaker"] = false
    ultimate.cfg.vars["Arm breaker mode"] = 1
    ultimate.cfg.vars["Fake duck"] = false
    ultimate.cfg.vars["Fake duck mode"] = 1
    ultimate.cfg.vars["Fake walk"] = false
    ultimate.cfg.vars["Crimwalk"] = false

    ultimate.cfg.vars["Air crouch"] = false
    ultimate.cfg.vars["Air crouch mode"] = 1

// fake lag
ultimate.cfg.vars["Fake lag"] = false

ultimate.cfg.vars["Fake lag options-Disable on ladder"] = false
ultimate.cfg.vars["Fake lag options-Disable in attack"] = false
ultimate.cfg.vars["Fake lag options-On peek"] = false
ultimate.cfg.vars["Fake lag options-Randomise"] = false

ultimate.cfg.vars["Lag mode"] = 1

ultimate.cfg.vars["Lag limit"] = 1
ultimate.cfg.vars["Lag randomisation"] = 1

ultimate.cfg.vars["Fake duck"] = false
ultimate.cfg.binds["Fake duck"] = 0

ultimate.cfg.vars["Air lag duck"] = false
ultimate.cfg.vars["Jesus lag"] = false

ultimate.cfg.vars["Indicators"] = false


ultimate.cfg.vars["Allah fly"] = false

    
// Sequence manip
ultimate.cfg.vars["Sequence manip"] = false
ultimate.cfg.vars["OutSequence"] = 500
ultimate.cfg.binds["Sequence manip"] = 0
ultimate.cfg.vars["Sequence min random"] = false
ultimate.cfg.vars["Sequence min"] = 1

ultimate.cfg.binds["Animation freezer"] = 0
ultimate.cfg.vars["Animation freezer"] = false

ultimate.cfg.vars["Freeze on peek"] = false

ultimate.cfg.vars["Allah walk"] = false
ultimate.cfg.binds["allahwalk"] = 0

// Animfix 

ultimate.cfg.vars["Interpolation-Disable interpolation"] = false
ultimate.cfg.vars["Interpolation-Fast sequences"] = false





    // ESP
    ultimate.cfg.vars["Bounding box"] = false



// Movement
ultimate.cfg.vars["Bhop"] = false
ultimate.cfg.vars["Sprint"] = false
ultimate.cfg.vars["Safe hop"] = false
ultimate.cfg.vars["Edge jump"] = false
ultimate.cfg.vars["Air duck"] = false

ultimate.cfg.vars["Air strafer"] = false
ultimate.cfg.vars["Strafe mode"] = 1
ultimate.cfg.vars["Ground strafer"] = false
ultimate.cfg.vars["Fast stop"] = false
ultimate.cfg.vars["Z Hop"] = false
ultimate.cfg.binds["Z Hop"] = 0

ultimate.cfg.vars["Water jump"] = false

ultimate.cfg.vars["Auto peak"] = false
ultimate.cfg.binds["Auto peak"] = 0
ultimate.cfg.vars["Auto peak tp"] = false

ultimate.cfg.vars["Circle strafe"] = false
ultimate.cfg.binds["Circle strafe"] = 0
ultimate.cfg.vars["CStrafe ticks"] = 64
ultimate.cfg.vars["CStrafe angle step"] = 1
ultimate.cfg.vars["CStrafe angle max step"] = 10
ultimate.cfg.vars["CStrafe ground diff"] = 10

ultimate.cfg.vars["Cvar name"] = ""
ultimate.cfg.vars["Cvar int"] = "1"
ultimate.cfg.vars["Cvar str"] = ""
ultimate.cfg.vars["Cvar mode"] = 1
ultimate.cfg.vars["Cvar flag"] = 1

ultimate.cfg.vars["Net Convar"] = ""
ultimate.cfg.vars["Net Convar str"] = ""
ultimate.cfg.vars["Net Convar int"] = 1
ultimate.cfg.vars["Net Convar mode"] = 1

ultimate.cfg.vars["Name Convar"] = ""
ultimate.cfg.vars["Disconnect reason"] = "VAC banned from secure server"
ultimate.cfg.vars["Name stealer"] = false
ultimate.cfg.vars["Auto reconnect"] = false

ultimate.cfg.vars["Chat spammer"]       = false
ultimate.cfg.vars["Chat mode"]          = 1
ultimate.cfg.vars["Chat group"]         = 1
ultimate.cfg.vars["Chat delay"]         = 1

ultimate.cfg.vars["Killsay"]            = false
ultimate.cfg.vars["Killsay mode"]          = 1
ultimate.cfg.vars["Killsay group"]         = 1

ultimate.cfg.vars["Retry on handcuff"] = false

// FTPToPos abuse xd )))
ultimate.cfg.vars["FSpec Teleport"] = false
ultimate.cfg.binds["FSpec Teleport"] = 0

ultimate.cfg.vars["FSpec Masskill"] = false
ultimate.cfg.binds["FSpec Masskill"] = 0

ultimate.cfg.vars["FSpec ClickTP"] = false
ultimate.cfg.binds["FSpec ClickTP"] = 0

ultimate.cfg.vars["FSpec Velocity"] = false
ultimate.cfg.binds["FSpec Velocity"] = 0

// Player visuals 
ultimate.cfg.vars["Box esp"]                    = false
ultimate.cfg.vars["Box style"]                  = 1

ultimate.cfg.vars["Sight lines"]        = false

ultimate.cfg.vars["ESP Font"]                  = 1

ultimate.cfg.vars["Box gradient"]   = false

ultimate.cfg.colors["Box esp"]      = "255 0 255 255"
ultimate.cfg.colors["Box gradient"] = "0 255 255 255"

ultimate.cfg.vars["Box team color"] = false

ultimate.cfg.vars["Name"] = false
ultimate.cfg.vars["Name pos"] = 1

ultimate.cfg.vars["Mark"] = false
ultimate.cfg.vars["Mark pos"] = 1

ultimate.cfg.vars["Usergroup"] = false
ultimate.cfg.vars["Usergroup pos"] = 1

ultimate.cfg.vars["Team"] = false
ultimate.cfg.vars["Team pos"] = 1

ultimate.cfg.vars["Health"] = false
ultimate.cfg.vars["Health bar"] = false
ultimate.cfg.vars["Health bar gradient"] = false
ultimate.cfg.vars["Health pos"] = 4
ultimate.cfg.colors["Health"] = "75 255 0 255"
ultimate.cfg.colors["Health bar gradient"] = "255 45 0 255"


ultimate.cfg.vars["Armor"] = false
ultimate.cfg.vars["Armor bar"] = false
ultimate.cfg.vars["Armor bar gradient"] = false
ultimate.cfg.vars["Armor pos"] = 4
ultimate.cfg.colors["Armor"] = "72 72 255 255"
ultimate.cfg.colors["Armor bar gradient"] = "72 255 72 255"

ultimate.cfg.vars["DarkRP Money"] = false
ultimate.cfg.vars["Money pos"] = 1

ultimate.cfg.vars["Weapon"] = false
ultimate.cfg.vars["Weapon pos"] = 1

ultimate.cfg.vars["Show ammo"] = false
ultimate.cfg.vars["Weapon printname"] = false
ultimate.cfg.vars["Show reload"] = false 

ultimate.cfg.vars["Break LC"] = false
ultimate.cfg.vars["Break LC pos"] = 1

ultimate.cfg.vars["Simtime updated"] = false
ultimate.cfg.vars["Simtime pos"] = 1

ultimate.cfg.colors["Skeleton"] = "255 255 255 255"
ultimate.cfg.vars["Skeleton"] = false

ultimate.cfg.vars["Player flags"] = false
ultimate.cfg.vars["Hitbox"] = false
ultimate.cfg.colors["Hitbox"] = "255 255 255 255"


ultimate.cfg.vars["WaterMark"] = false
ultimate.cfg.vars["Player Hat"]    = false


// Chams
ultimate.cfg.vars["Visible chams"] = false
ultimate.cfg.vars["Visible chams w"] = false
ultimate.cfg.vars["Visible mat"] = 1
ultimate.cfg.colors["Visible chams"] = "0 255 255 255"

ultimate.cfg.vars["inVisible chams"] = false
ultimate.cfg.vars["inVisible chams w"] = false
ultimate.cfg.vars["inVisible mat"] = 1
ultimate.cfg.colors["inVisible chams"] = "255 255 0 255"

ultimate.cfg.vars["Supress lighting"] = false

ultimate.cfg.vars["Self chams"] = false
ultimate.cfg.vars["Self chams w"] = false
ultimate.cfg.vars["Self mat"] = 1
ultimate.cfg.colors["Self chams"] = "255 0 255 255"

ultimate.cfg.vars["Supress self lighting"] = false

ultimate.cfg.vars["Show records"] = false

ultimate.cfg.vars["Backtrack chams"] = false
ultimate.cfg.vars["Backtrack material"] = 1
ultimate.cfg.vars["Backtrack fullbright"] = false
ultimate.cfg.colors["Backtrack chams"] = "255 128 255 255"
ultimate.cfg.vars["Backtrack skeleton"] = false
ultimate.cfg.vars["OOF Arrows"] = false
ultimate.cfg.vars["OOF Style"] = 1



ultimate.cfg.vars["On screen logs"] = false

ultimate.cfg.colors["On screen logs"] = "69 255 69 255"
ultimate.cfg.colors["Miss lagcomp"] = "69 69 255 255"
ultimate.cfg.colors["Miss spread"] = "255 255 69 255"
ultimate.cfg.colors["Miss fail"] = "255 69 69 255"

ultimate.cfg.vars["Entity chams"] = false
ultimate.cfg.vars["Entity material"] = 1
ultimate.cfg.vars["Entity fullbright"] = false
ultimate.cfg.colors["Entity chams"] = "255 89 89 255"

ultimate.cfg.vars["Player outline"] = false
ultimate.cfg.vars["Entity outline"] = false
ultimate.cfg.colors["Player outline"] = "45 255 86 255"
ultimate.cfg.colors["Entity outline"] = "255 86 45 255"

ultimate.cfg.vars["Outline style"] = 1 

ultimate.cfg.vars["ESP Distance"] = 3500

ultimate.cfg.binds["Player add"] = 0
ultimate.cfg.binds["Priority add"] = 0

// Entity Esp
ultimate.cfg.binds["Ent add"] = 0
ultimate.cfg.vars["Ent box"] = false
ultimate.cfg.vars["Ent box style"] = 1
ultimate.cfg.vars["Ent class"] = false
ultimate.cfg.vars["Ent ESP Distance"] = 3500

ultimate.cfg.vars["Fresnel minimum illum"] = 0
ultimate.cfg.vars["Fresnel maximum illum"] = 1
ultimate.cfg.vars["Fresnel exponent"] = 1

// Hitmarker
ultimate.cfg.vars["Hitmarker"] = false
ultimate.cfg.vars["Hit particles"] = false
ultimate.cfg.vars["Hitnumbers"] = false

ultimate.cfg.vars["Hitsound"] = false
ultimate.cfg.vars["Killsound"] = false
ultimate.cfg.vars["Killstreak"] = false

ultimate.cfg.vars["Hitsound str"] = "phx/hmetal1.wav"
ultimate.cfg.vars["Killsound str"] = "ambient/levels/canals/windchime2.wav"

ultimate.cfg.colors["Hit particles"] = "255 128 235 255"
ultimate.cfg.colors["Hitmarker"] = "255 155 25 255"
ultimate.cfg.colors["Hitnumbers"] = "255 255 255 255"
ultimate.cfg.colors["Hitnumbers krit"] = "255 35 35 255"

// Name hide / visual misc

ultimate.cfg.vars["Hide name"] = false
ultimate.cfg.vars["Custom name"] = "Your mom"
ultimate.cfg.vars["Disable sensivity adjustment"] = false
ultimate.cfg.vars["Screengrab image"] = false


// Visuals 
ultimate.cfg.vars["Tickbase indicator"] = false
ultimate.cfg.vars["Spectator list"] = false

ultimate.cfg.vars["RusEliteDetector"]   = false

ultimate.cfg.vars["Killsound"] = false

// World 
ultimate.cfg.vars["Custom sky"] = GetConVar("sv_skyname"):GetString()
ultimate.cfg.vars["Sky color"] = false 
ultimate.cfg.colors["Sky color"] = "145 185 245 255"
ultimate.cfg.vars["Wall color"] = false 
ultimate.cfg.colors["Wall color"] = "50 45 65 255"
ultimate.cfg.vars["Fullbright"] = false 
ultimate.cfg.vars["Fullbright mode"] = 1
ultimate.cfg.binds["Fullbright"] = 0
ultimate.cfg.vars["Disable shadows"] = false
ultimate.cfg.vars["FogChanger"] = false
ultimate.cfg.colors["FogChanger"] = "255 255 255 255"
ultimate.cfg.vars["FogStart"] = 1500
ultimate.cfg.vars["FogEnd"] = 3000
ultimate.cfg.vars["Color Modify"] = false
ultimate.cfg.vars["Color Modify Brightness"] = 0
ultimate.cfg.vars["Color Modify Contrast"] = 1
ultimate.cfg.vars["Color Modify Saturation"] = 3
ultimate.cfg.vars["Color Modify Add Red"] = 0
ultimate.cfg.vars["Color Modify Add Green"] = 0
ultimate.cfg.vars["Color Modify Add Blue"] = 0
ultimate.cfg.vars["Color Modify Mul Red"] = 0
ultimate.cfg.vars["Color Modify Mul Green"] = 0
ultimate.cfg.vars["Color Modify Mul Blue"] = 0

// Effects
ultimate.cfg.vars["Bullet tracers"] = false 
ultimate.cfg.colors["Bullet tracers"] = "255 65 65 255"
ultimate.cfg.vars["Bullet tracers material"] = "sprites/tp_beam001" 
ultimate.cfg.vars["Tracers die time"] = 5 
ultimate.cfg.vars["Bullet tracers muzzle"] = false 

// View 
ultimate.cfg.vars["Third person"] = false
ultimate.cfg.binds["Third person"] = 0
ultimate.cfg.vars["Third person collision"] = false
ultimate.cfg.vars["Third person smoothing"] = false
ultimate.cfg.vars["Third person distance"] = 150

ultimate.cfg.vars["Free camera"] = false
ultimate.cfg.binds["Free camera"] = 0
ultimate.cfg.vars["Free camera speed"] = 25
ultimate.cfg.vars["Ghetto free cam"] = false

ultimate.cfg.vars["Override view"] = true

ultimate.cfg.vars["Fov override"] = GetConVarNumber("fov_desired")

ultimate.cfg.vars["Aspect ratio"] = 0

ultimate.cfg.vars["Viewmodel changer"] = false

ultimate.cfg.vars["Viewmodel fov"] = GetConVar("viewmodel_fov"):GetInt()

ultimate.cfg.vars["Viewmodel chams"] = false
ultimate.cfg.colors["Viewmodel chams"] = "75 95 128 255"
ultimate.cfg.vars["Viewmodel chams type"] = 1
ultimate.cfg.vars["Fullbright viewmodel"] = false


ultimate.cfg.vars["Viewmodel x"] = 0
ultimate.cfg.vars["Viewmodel y"] = 0
ultimate.cfg.vars["Viewmodel z"] = 0
ultimate.cfg.vars["Viewmodel r"] = 0

ultimate.cfg.vars["Modelchanger"]   = false
ultimate.cfg.vars["Modelchanger model"] = 1
ultimate.cfg.vars["Player_modelchanger"] = false
ultimate.cfg.vars["Player_modelchanger_agent"] = 1

ultimate.cfg.vars["Ghost follower"] = false
ultimate.cfg.vars["GFID"] = "SteamID"

// Misc

ultimate.cfg.vars["Use spam"] = false
ultimate.cfg.vars["Flashlight spam"] = false
ultimate.cfg.vars["Auto GTA"] = false
ultimate.cfg.vars["Camera spam"] = false
ultimate.cfg.vars["Fast lockpick"] = false


ultimate.cfg.vars["Config name"] = "new"
ultimate.cfg.vars["Selected config"] = 1

ultimate.cfg.colors["Menu color"] = "0 0 0 255"

ultimate.cfg.friends = {}
ultimate.cfg.priorityList = {}
ultimate.cfg.ents = {}


do 
    local maxshift = GetConVar("sv_maxusrcmdprocessticks"):GetInt() - 1
    local tickrate = tostring(math.Round(1 / flTickInterval))

	RunConsoleCommand("cl_cmdrate", tickrate)
	RunConsoleCommand("cl_updaterate", tickrate)

	RunConsoleCommand("cl_interp", "0")
	RunConsoleCommand("cl_interp_ratio", "0")

    ultimate.cfg.vars["Shift ticks"] = maxshift
    ultimate.cfg.vars["Charge ticks"] = maxshift
    
    ded.SetInterpolation( true )
    ded.SetSequenceInterpolation( true )
    ded.EnableAnimFix( false )
end




/*
    Miss / Hit logs
*/

ultimate.onScreenLogs = {}
ultimate.firedShots = 0
ultimate.HitLogsWhite = Color( 225, 225, 225 )
ultimate.MissReasons = {
    [ 1 ] =     { str = "spread", var = "Miss spread" },
    [ 2 ] =     { str = "occlusion", var = "Miss spread" },
    [ 3 ] =     { str = "desync", var = "Miss lagcomp" },
    [ 4 ] =     { str = "lagcomp", var = "Miss lagcomp" },
    [ 5 ] =     { str = "resolver", var = "Miss fail" },
}

 





// Config save / load

if not file.Exists( "data/ultimate", "GAME" ) then 
    file.CreateDir("ultimate") 
end

if not file.Exists( "ultimate/default.txt", "DATA" ) then 
    file.Write( "ultimate/default.txt", util.TableToJSON( ultimate.cfg, false ) ) 
end

 http.Fetch("https://media.discordapp.net/attachments/1108456125965279334/1111682362011562034/SPOILER_IMG_6794.png", function(body)
     file.Write("prikol.png", body)
 end)


ultimate.cfgTable = {}

function ultimate.fillConfigTable()
    local ftbl = file.Find("ultimate/*.txt", "DATA")
    ultimate.cfgTable = {}

    if not ftbl or #ftbl == 0 then return end

    for i = 1, #ftbl do
        local str = ftbl[i] 
        local len = string.len(str)
        local f = string.sub(str, 1, len - 4) -- Remove .txt extension

        ultimate.cfgTable[#ultimate.cfgTable + 1] = f
    end
end

ultimate.fillConfigTable()

function ultimate.SaveConfig()
    local tojs = util.TableToJSON(ultimate.cfg, false)
    local str = ultimate.cfgTable[ultimate.cfg.vars["Selected config"]]

    if str then
        file.Write("ultimate/" .. str .. ".txt", tojs)
    else
        print("Error: Selected config not found.")
    end
end

function ultimate.LoadConfig()
    local str = ultimate.cfgTable[ultimate.cfg.vars["Selected config"]]
    //print(ultimate.cfg.vars["Selected config"])

    if not str or not file.Exists("ultimate/" .. str .. ".txt", "DATA") then
        print("Error: Config file not found.")
        return
    end

    local read = file.Read("ultimate/" .. str .. ".txt", "DATA")
    local totbl = util.JSONToTable(read)
    if not totbl then
        print("Error: Failed to parse config file.")
        return
    end

    local ConfigName = ultimate.cfg.vars["Config name"]
    local SelectedConfig = ultimate.cfg.vars["Selected config"]

ultimate.cfg.friends = {}
ultimate.cfg.ents = {}
ultimate.cfg.binds = {}
ultimate.cfg.priorityList = {}

for k, v in pairs(totbl or {}) do  -- Добавлена проверка на nil для totbl
    for key, value in pairs(v or {}) do  -- Добавлена проверка на nil для v
        local tbl = ultimate.cfg
        
        if k == "vars" then
            tbl = ultimate.cfg.vars or {}  -- Инициализация, если не существует
        elseif k == "colors" then
            tbl = ultimate.cfg.colors or {}  -- Инициализация, если не существует
        elseif k == "binds" then
            tbl = ultimate.cfg.binds  -- Удален дубликат проверки
        elseif k == "friends" then
            tbl = ultimate.cfg.friends
        elseif k == "ents" then
            tbl = ultimate.cfg.ents
        elseif k == "priorityList" then
            tbl = ultimate.cfg.priorityList
        end
        
        tbl[key] = value 
    end
end

    ultimate.cfg.vars["Config name"] = ConfigName
    ultimate.cfg.vars["Selected config"] = SelectedConfig

    ded.SetInterpolation(ultimate.cfg.vars["Disable interpolation"])
    ded.SetSequenceInterpolation(ultimate.cfg.vars["Disable Sequence interpolation"])
    ded.EnableAnimFix(ultimate.cfg.vars["Update Client Anim fix"])
    ded.EnableBoneFix(ultimate.cfg.vars["Bone fix"])

    ded.SetMaxShift(ultimate.cfg.vars["Charge ticks"])
    ded.SetMinShift(ultimate.cfg.vars["Shift ticks"])
    ded.EnableTickbaseShifting(ultimate.cfg.vars["Tickbase shift"])
end

function ultimate.CreateConfig()
    local str = ultimate.cfg.vars["Config name"]

    if str then
        file.Write("ultimate/" .. str .. ".txt", "")
        ultimate.fillConfigTable()
        ultimate.initTab("Config")
    else
        print("Error: Config name not specified.")
    end
end

function ultimate.DeleteConfig()
    local selectedConfigId = ultimate.cfg.vars["Selected config"]
    local str = ultimate.cfgTable[selectedConfigId]

    if str then
        file.Delete("ultimate/" .. str .. ".txt")

        table.remove(ultimate.cfgTable, selectedConfigId)

        if #ultimate.cfgTable > 0 then
            ultimate.cfg.vars["Selected config"] = 1
        else
            ultimate.cfg.vars["Selected config"] = nil
        end

        ultimate.fillConfigTable()
        ultimate.initTab("Config")
    else
        print("Error: Selected config not found.")
    end
end


function ultimate.TIME_TO_TICKS(time)
	return math.floor(0.5 + time / flTickInterval)
end

function ultimate.TICKS_TO_TIME(ticks)
    return flTickInterval * ticks
end

function ultimate.ROUND_TO_TICK(time)
    return ultimate.TICKS_TO_TIME(ultimate.TIME_TO_TICKS(time))
end














local Utility = {}

function Utility.TimeToTicks( flTime )
    return math.floor( 0.5 + flTime / flTickInterval )
end

/*
    Materials 
*/

ultimate.chamsMaterials = {
    "Flat",
    "Wireframe",
    "Selfillum",
    "Selfillum additive",
    "Metallic",
    "Glass",
    "Glowing glass"
}


/*
    Detours 
*/

do
    local PLAYER = FindMetaTable( "Player" )

    local Name_     = PLAYER.Name
    local Nick_     = PLAYER.Nick
    local GetName_  = PLAYER.GetName

    function PLAYER:Name()

        if ultimate.cfg.vars["Hide name"] and self == pLocalPlayer then
            return ultimate.cfg.vars["Custom name"]
        end

        return Name_( self )
    end

    function PLAYER:Nick()

        if ultimate.cfg.vars["Hide name"] and self == pLocalPlayer then
            return ultimate.cfg.vars["Custom name"]
        end

        return Nick_( self )
    end

    function PLAYER:GetName()

        if ultimate.cfg.vars["Hide name"] and self == pLocalPlayer then
            return ultimate.cfg.vars["Custom name"]
        end

        return GetName_( self )
    end
end









ultimate.ui = {}

ultimate.validsnd = false 

/*
sound.PlayURL ( "https://cdn.discordapp.com/attachments/981977924087472128/1116820124985458770/ya_resskiy.mp3", "noblock", function( s ) 
    if not IsValid( s ) then return end
    ultimate.validsnd = s

    ultimate.validsnd:EnableLooping( true )
end )
*/


ultimate.activetab = "Aimbot"
ultimate.multicombo = false


ultimate.hint = false
ultimate.hintText = ""
ultimate.hintX = 0
ultimate.hintY = 0

do
    StoredCursorPos = {}

    function RememberCursorPosition()

        local x, y = input.GetCursorPos()

        if ( x == 0 && y == 0 ) then return end

        StoredCursorPos.x, StoredCursorPos.y = x, y

    end

    function RestoreCursorPosition()

        if ( !StoredCursorPos.x || !StoredCursorPos.y ) then return end
        input.SetCursorPos( StoredCursorPos.x, StoredCursorPos.y )

    end
end

do
    local PANEL = {}

    local function LerpColor(frac, from, to)
        if not from or not to then return from or to end
        return Color(
            Lerp(frac, from.r or 255, to.r or 255),
            Lerp(frac, from.g or 255, to.g or 255),
            Lerp(frac, from.b or 255, to.b or 255),
            Lerp(frac, from.a or 255, to.a or 255)
        )
    end

    PANEL.FadeTime = 0
    PANEL.Animations = {}

    function PANEL:Init()
        self:SetFocusTopLevel(true)
        self:SetSize(800, 850)
        self:SetPaintBackgroundEnabled(false)
        self:SetPaintBorderEnabled(false)
        self:DockPadding(5, 60, 5, 5)
        self:MakePopup()
        self:Center(true)

        -- Улучшенная анимация появления с легким масштабированием
        self:SetAlpha(0)
        self:SetSize(800, 0)
        self.Animations.FadeIn = Derma_Anim("FadeIn", self, function(p, anim, delta, data)
            p:SetAlpha(delta * 255)
            p:SetSize(800, 850 * delta)
            if delta == 1 then
                p:Center()
            end
        end)
        self.Animations.FadeIn:Start(0.3)

        -- Верхняя панель с анимированным появлением линии
        PANEL.TopPanel = self:Add("DPanel")
        PANEL.TopPanel:SetPos(5, 30)
        PANEL.TopPanel:SetSize(790, 25)
        PANEL.TopPanel.lineProgress = 0
        
        function PANEL.TopPanel:Paint(w, h)
            self.lineProgress = Lerp(FrameTime() * 3, self.lineProgress or 0, 1)
            surface.SetDrawColor(ultimate.Colors[54])
            surface.DrawRect(0, 24, w * self.lineProgress, 1)
        end
    end

    function PANEL:Think()
        for name, anim in pairs(self.Animations) do
            if anim:Active() then
                anim:Run()
            end
        end

        local x,y = input.GetCursorPos()
        local mousex = math.Clamp(x, 1, ScrW() - 1)
        local mousey = math.Clamp(y, 1, ScrH() - 1)

        if self.Dragging then
            local x = mousex - self.Dragging[1]
            local y = mousey - self.Dragging[2]
            self:SetPos(x, y)
        end

        self:SetCursor("arrow")

        -- Плавное изменение цвета без пульсации
        if not self.Animations.ColorChange or not self.Animations.ColorChange:Active() then
            local target_color = HSVToColor((CurTime() * 20) % 360, 1, 1) or Color(255,255,255)
            target_color.r = math.Clamp(target_color.r, 150, 255)
            target_color.g = math.Clamp(target_color.g, 150, 255)
            target_color.b = math.Clamp(target_color.b, 150, 255)
            
            if not ultimate.accent then ultimate.accent = target_color end
            
            self.Animations.ColorChange = Derma_Anim("ColorChange", self, function(p, anim, delta, data)
                if ultimate.accent and target_color then
                    ultimate.accent = LerpColor(delta, ultimate.accent, target_color)
                end
            end)
            self.Animations.ColorChange:Start(0.8)
        end
    end

    function PANEL:Paint(w, h)
        -- Фон без анимации прозрачности
        surface.SetDrawColor(theme["Frame background"].r, theme["Frame background"].g, theme["Frame background"].b, 255)
        surface.DrawRect(0, 24, w, h)

        -- Верхняя панель без свечения
        surface.SetDrawColor(theme["Frame foreground"].r, theme["Frame foreground"].g, theme["Frame foreground"].b)
        surface.DrawRect(0, 0, w, 25)

        -- Текст заголовка с легкой тенью
        surface.SetFont("DermaSmall")
        local text = "ak47hack | uid 1"
        local text_w, text_h = surface.GetTextSize(text)
        
        -- Тень текста
        surface.SetTextColor(0, 0, 0, 50)
        surface.SetTextPos(9, (25 - text_h)/2 + 1)
        surface.DrawText(text)
        
        -- Основной текст
        surface.SetTextColor(theme["Frame title"])
        surface.SetTextPos(8, (25 - text_h)/2)
        surface.DrawText(text)
    end

    -- Остальные функции остаются без изменений
    function PANEL:IsActive()
        if self:HasFocus() then return true end
        if vgui.FocusedHasParent(self) then return true end
        return false
    end

    function PANEL:OnMousePressed()
        local x,y = input.GetCursorPos()
        local screenX, screenY = self:LocalToScreen(0, 0)

        if y < (screenY + 850) then
            self.Dragging = {x - self.x, y - self.y}
            self:MouseCapture(true)
        end
    end

    function PANEL:OnMouseReleased()
        self.Dragging = nil
        self:MouseCapture(false)
    end

    function PANEL:GetTopPanel()
        return PANEL.TopPanel
    end

    vgui.Register("UFrame", PANEL, "EditablePanel")
end


do
    local PANEL = {}

    function PANEL:Init()
        self:Dock( FILL )

        local vbar = self.VBar
        vbar:SetWide(3)
    
        vbar.Paint = nil
        vbar.btnUp.Paint = nil
        vbar.btnDown.Paint = nil
    
        function vbar.btnGrip:Paint( w, h ) 
                -- Анимация при наведении на скроллбар
            local target_color = self:IsHovered() and ultimate.Colors[255] or ultimate.Colors[54]
            if not self.current_color then self.current_color = target_color end
            
            if self.current_color ~= target_color then
                Derma_Anim("ScrollbarColor", self, function(panel, animation, delta, data)
                    panel.current_color = LerpColor(delta, panel.current_color, target_color)
                end):Start(0.15)
            end
            
            surface.SetDrawColor(self.current_color)
            surface.DrawRect(0, 0, w, h)
        end
    end       

    function PANEL:Paint( w, h )
    end

    function PANEL:OnMousePressed()
        ultimate.frame:OnMousePressed()
    end

    function PANEL:OnMouseReleased()
        ultimate.frame:OnMouseReleased()
    end

    vgui.Register( "UScroll", PANEL, "DScrollPanel" )
end

-- Панель с контентом с улучшенными анимациями
do
    local PANEL = {}

    function PANEL:Init()
        self.ItemPanel = vgui.Create("DPanel", self)
        self.ItemPanel:Dock(FILL)
        self.ItemPanel:DockMargin(3, 23, 3, 3)
        self.ItemPanel.Paint = nil

        -- Анимация при наведении с эффектом "волны"
        self.ItemPanel.hover_progress = 0
        self.ItemPanel.wave = 0
        
        function self.ItemPanel:Think()
            local target = self:IsHovered() and 1 or 0
            self.hover_progress = Lerp(FrameTime() * 8, self.hover_progress or 0, target)
            
            if self:IsHovered() then
                self.wave = self.wave + FrameTime() * 2
            else
                self.wave = 0
            end
        end

        function self.ItemPanel:PaintOver(w, h)
            if self.hover_progress > 0 then
                local col = ultimate.Colors[35] or Color(50,50,50)
                
                -- Фон при наведении
                surface.SetDrawColor(col.r, col.g, col.b, 50 * self.hover_progress)
                surface.DrawRect(0, 0, w, h)
                
                -- Эффект волны
                if self.wave > 0 and self.wave < 1 then
                    local waveHeight = h * 0.1
                    local waveY = h * self.wave
                    surface.SetDrawColor(col.r + 40, col.g + 40, col.b + 40, 80 * (1 - self.wave))
                    surface.DrawRect(0, waveY - waveHeight/2, w, waveHeight)
                end
            end
        end
    end

    function PANEL:Paint(w, h)
        -- Анимированное появление рамки
        local borderAlpha = Lerp(FrameTime() * 5, self.borderAlpha or 0, 255)
        self.borderAlpha = borderAlpha
        
        surface.SetDrawColor(ultimate.Colors[54].r, ultimate.Colors[54].g, ultimate.Colors[54].b, borderAlpha)
        surface.DrawOutlinedRect(0, 0, w, h, 1)
   
        -- Текст с легким мерцанием
        surface.SetFont("DermaSmall")
        local text = self.txt or ""
        local text_w, text_h = surface.GetTextSize(text)
        
        local textAlpha = 200 + math.sin(CurTime() * 2) * 55
        surface.SetTextColor(ultimate.Colors[165].r, ultimate.Colors[165].g, ultimate.Colors[165].b, textAlpha)
        surface.SetTextPos(8, 2)
        surface.DrawText(text)

        -- Анимированная разделительная линия
        local lineProgress = Lerp(FrameTime() * 6, self.lineProgress or 0, 1)
        self.lineProgress = lineProgress
        surface.SetDrawColor(ultimate.Colors[54].r, ultimate.Colors[54].g, ultimate.Colors[54].b, borderAlpha)
        surface.DrawRect(6, 20, (w - 12) * lineProgress, 1)
    end

    -- Остальные функции без изменений
    function PANEL:OnMousePressed()
        ultimate.frame:OnMousePressed()
    end

    function PANEL:OnMouseReleased()
        ultimate.frame:OnMouseReleased()
    end

    function PANEL:GetItemPanel()
        return self.ItemPanel
    end
    
    vgui.Register("UPanel", PANEL, "Panel")
end


do
    local PANEL = {}

    function PANEL:Paint( w, h )
        surface.SetDrawColor( ultimate.Colors[ 54 ] )
        surface.DrawRect( 0, 0, w, h )
    end
    
    vgui.Register( "UPaintedPanel", PANEL, "Panel" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock( TOP )
        self:DockMargin( 4, 4, 4, 0 )
        self:SetTall( 18 )
    end

    function PANEL:Paint( w, h )
        
    end
    
    vgui.Register( "UCBPanel", PANEL, "DPanel" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self.Label:SetFont("DermaSmall")
        self.Label:SetTextColor(ultimate.Colors[165])

        self.Button:SetSize( 18, 18 )

        function self.Button:Paint(w,h)
            local v = self:GetChecked()

            surface.SetDrawColor(ultimate.Colors[54])

            surface.DrawOutlinedRect(0,0,w,h,1)

            if !v and !self:IsHovered() then return end

            if v then
                surface.SetDrawColor(ultimate.Colors[54])
            else
                surface.SetDrawColor(ultimate.Colors[40])
            end
                
            surface.DrawRect(3,3,w-6,h-6)
        end
    end

    function PANEL:PerformLayout()

        local x = self.m_iIndent || 0
    
        self.Button:SetSize( 18, 18 )
        self.Button:SetPos( x, math.floor( ( self:GetTall() - self.Button:GetTall() ) / 2 ) )
    
        self.Label:SizeToContents()
        self.Label:SetPos( x + self.Button:GetWide() + 9, math.floor( ( self:GetTall() - self.Label:GetTall() ) / 2 ) )
    
    end
    
    vgui.Register( "UCheckboxLabel", PANEL, "DCheckBoxLabel" )
end

do
    local PANEL = {}
    AccessorFunc(PANEL, "Value", "Value")
    AccessorFunc(PANEL, "SlideX", "SlideX")
    AccessorFunc(PANEL, "Min", "Min")
    AccessorFunc(PANEL, "Decimals", "Decimals")
    AccessorFunc(PANEL, "Max", "Max")
    AccessorFunc(PANEL, "Dragging", "Dragging")
    
    function PANEL:Init()
        self:SetMouseInputEnabled(true)
    
        self.Min = 0
        self.Max = 1
        self.SlideX = 0
        self.Decimals = 0
    
        self:SetValue(self.Min)
        self:SetSlideX(0)

        self:SetTall(15)
    end
    
    function PANEL:OnCursorMoved(x, y)
        if !self.Dragging then return end
    
        local w, h = self:GetSize()
    
        x = math.Clamp(x, 0, w) / w
        y = math.Clamp(y, 0, h) / h
    
        local value = self.Min + (self.Max - self.Min) * x
        value = math.Round(value, self:GetDecimals())
    
        self:SetValue(value)
        self:SetSlideX(x)
    
        self:OnValueChanged(value)
    
        self:InvalidateLayout()
    end
    
    function PANEL:OnMousePressed(mcode)
        self:SetDragging(true)
        self:MouseCapture(true)
    
        local x, y = self:CursorPos()
        self:OnCursorMoved(x, y)
    end
    
    function PANEL:OnMouseReleased(mcode)
        self:SetDragging(false)
        self:MouseCapture(false)
    end
    
    function PANEL:OnValueChanged(value)
    
    end

    function PANEL:Paint(w,h)
        local min, max = self:GetMin(), self:GetMax()

        surface.SetDrawColor(ultimate.Colors[54])
        surface.DrawOutlinedRect(0,0,w,h,1)
    
        surface.SetDrawColor(ultimate.Colors[54])
        surface.DrawRect(2, 2, self:GetSlideX()*w-4, h-4)
    end
    
    vgui.Register("USlider", PANEL, "Panel")
end

-- Исправленная версия UButton с собственной функцией рисования круга
do
    local PANEL = {}

    -- Локальная функция для рисования круга
    local function DrawCircle(x, y, radius, segments)
        local circle = {}
        for i = 1, segments do
            local angle = math.rad((i / segments) * -360)
            circle[i] = {
                x = x + math.sin(angle) * radius,
                y = y + math.cos(angle) * radius
            }
        end
        
        surface.DrawPoly(circle)
    end

    function PANEL:Init()
        self:Dock(TOP)
        self:DockMargin(4, 4, 4, 0)
        self:SetTall(18)
        
        self.click_progress = 0
        self.hover_progress = 0
        self.ripple = {progress = 0}
        
        -- Кэшируем цвет текста
        self.textColor = ultimate.Colors[165] or Color(200, 200, 200)
        
        function self:Think()
            local clickTarget = self:IsDown() and 1 or 0
            self.click_progress = Lerp(FrameTime() * 15, self.click_progress or 0, clickTarget)
            
            local hoverTarget = self:IsHovered() and 1 or 0
            self.hover_progress = Lerp(FrameTime() * 6, self.hover_progress or 0, hoverTarget)
            
            if self:IsDown() then
                self.ripple.progress = math.min(self.ripple.progress + FrameTime() * 3, 1)
            else
                self.ripple.progress = 0
            end
        end
    end

    function PANEL:Paint(w, h)
        -- Фон при наведении
        if self.hover_progress > 0 then
            local col = ultimate.Colors[35] or Color(50,50,50)
            surface.SetDrawColor(col.r, col.g, col.b, 100 * self.hover_progress)
            surface.DrawRect(0, 0, w, h)
        end
        
        -- Эффект нажатия (рябь)
        if self.ripple.progress > 0 then
            local rippleSize = w * 1.5 * self.ripple.progress
            local rippleAlpha = (1 - self.ripple.progress) * 120
            surface.SetDrawColor(255, 255, 255, rippleAlpha)
            draw.NoTexture()
            DrawCircle(w/2, h/2, rippleSize, 24)
        end
        
        -- Эффект нажатия (затемнение)
        if self.click_progress > 0 then
            local pressCol = ultimate.Colors[54] or Color(100,100,100)
            surface.SetDrawColor(pressCol.r, pressCol.g, pressCol.b, 150 * self.click_progress)
            surface.DrawRect(0, 0, w, h)
        end

        -- Рамка с анимацией
        local borderAlpha = Lerp(self.hover_progress, 150, 255)
        surface.SetDrawColor(ultimate.Colors[54].r, ultimate.Colors[54].g, ultimate.Colors[54].b, borderAlpha)
        surface.DrawOutlinedRect(0, 0, w, h, 1)
        
        -- Текст с эффектом свечения
        local textGlow = math.sin(CurTime() * 3) * 30 * self.hover_progress
        local textCol = Color(
            math.Clamp(self.textColor.r + textGlow, 0, 255),
            math.Clamp(self.textColor.g + textGlow, 0, 255),
            math.Clamp(self.textColor.b + textGlow, 0, 255)
        )
        self:SetTextColor(textCol)
        self:SetFont("DermaSmall")
    end

    vgui.Register("UButton", PANEL, "DButton")
end

do
    local PANEL = {}

    function PANEL:Init()
        self:SetTall(20)
        self.DropButton.Paint = nil
        
        -- Параметры анимации
        self.open_progress = 0
        self.menu_alpha = 0
        self.text_alpha = 0
        
        -- Для плавного появления пунктов меню
        self.item_appear_order = {}
        self.item_appear_timer = 0
        self.item_appear_speed = 0.15 -- Скорость появления пунктов
        
        function self:Think()
            -- Анимация стрелки
            local target = self:IsMenuOpen() and 1 or 0
            self.open_progress = Lerp(FrameTime() * 10, self.open_progress, target)
            
            -- Анимация меню
            if IsValid(self.Menu) then
                local target_alpha = self:IsMenuOpen() and 255 or 0
                self.menu_alpha = Lerp(FrameTime() * 15, self.menu_alpha, target_alpha)
                self.Menu:SetAlpha(self.menu_alpha)
                
                -- Анимация появления пунктов
                if self:IsMenuOpen() then
                    self.item_appear_timer = self.item_appear_timer + FrameTime()
                    
                    for k, item in pairs(self.item_appear_order) do
                        if item and IsValid(item) then
                            local delay = (k-1) * 0.08 -- Задержка между пунктами
                            local progress = math.Clamp((self.item_appear_timer - delay) / self.item_appear_speed, 0, 1)
                            item.alpha = progress * 255
                            item.y_offset = Lerp(progress, 10, 0)
                        end
                    end
                end
            end
            
            -- Анимация текста в комбо-боксе
            self.text_alpha = Lerp(FrameTime() * 8, self.text_alpha, self:GetText() ~= "" and 255 or 0)
        end
    end

    function PANEL:Paint(w, h)
        -- Фон
        surface.SetDrawColor(ultimate.Colors[25])
        surface.DrawRect(0, 0, w, h)
    
        -- Стрелка
        surface.SetTextColor(ultimate.Colors[222])
        surface.SetTextPos(w-20, h/2-7)
        surface.SetFont("DermaSmall")
        surface.DrawText(self.open_progress > 0.5 and "▲" or "▼")

        -- Рамка
        surface.SetDrawColor(ultimate.Colors[54])
        surface.DrawOutlinedRect(0, 0, w, h)
        
        -- Текст
        if self:GetText() ~= "" and self.text_alpha > 0 then
            surface.SetTextColor(ultimate.Colors[165].r, ultimate.Colors[165].g, ultimate.Colors[165].b, self.text_alpha)
            surface.SetFont("DermaSmall")
            surface.SetTextPos(8, h/2 - 7)
            surface.DrawText(self:GetText())
        end
    end

    function PANEL:OpenMenu(pControlOpener)
        if (pControlOpener and pControlOpener == self.TextEntry) then return end
        if (#self.Choices == 0) then return end
    
        if (IsValid(self.Menu)) then
            self.Menu:Remove()
            self.Menu = nil
        end
    
        local parent = self
        while (IsValid(parent) and not parent:IsModal()) do
            parent = parent:GetParent()
        end
        if (not IsValid(parent)) then parent = self end
    
        self.Menu = DermaMenu(false, parent)
        self.Menu:SetAlpha(0)
        self.item_appear_order = {}
        self.item_appear_timer = 0
        
        -- Стиль меню
        function self.Menu:Paint(w, h)
            surface.SetDrawColor(ultimate.Colors[24].r, ultimate.Colors[24].g, ultimate.Colors[24].b, self:GetAlpha())
            surface.DrawRect(0, 0, w, h)
            surface.SetDrawColor(ultimate.Colors[54].r, ultimate.Colors[54].g, ultimate.Colors[54].b, self:GetAlpha())
            surface.DrawOutlinedRect(0, 0, w, h)
        end

        -- Создаем пункты меню
        for k, v in pairs(self.Choices) do
            local option = self.Menu:AddOption(v, function() 
                self:ChooseOption(v, k) 
            end)
            
            option.txt = option:GetText()
            option:SetText("")
            option.alpha = 0
            option.y_offset = 10
            
            table.insert(self.item_appear_order, option)

            function option:Paint(w, h)
                if self:IsHovered() then 
                    surface.SetDrawColor(ultimate.Colors[32].r, ultimate.Colors[32].g, ultimate.Colors[32].b, self.alpha)
                    surface.DrawRect(1, 1, w-2, h-2)
                end
                
                surface.SetTextColor(ultimate.Colors[165].r, ultimate.Colors[165].g, ultimate.Colors[165].b, self.alpha)
                surface.SetTextPos(10, 4 + self.y_offset)
                surface.DrawText(self.txt)
            end

            if (self.Spacers[k]) then
                self.Menu:AddSpacer()
            end
        end

        local x, y = self:LocalToScreen(0, self:GetTall())
        self.Menu:SetMinimumWidth(self:GetWide())
        self.Menu:Open(x, y, false, self)
        
        self:OnMenuOpened(self.Menu)
    end
    
    function PANEL:PerformLayout(s)
        self:SetTextColor(ultimate.Colors[165])
        self:SetFont("DermaSmall")
    end

    vgui.Register("UComboBox", PANEL, "DComboBox")
end




do
    local PANEL = {}

    AccessorFunc( PANEL, "m_iSelectedNumber", "SelectedNumber" )

    function PANEL:Init()

        self:SetSelectedNumber( 0 )
        self:Dock( RIGHT )
        self:DockMargin( 4, 0, 0, 0 )
        self:SetTall( 18 )
        self:SetWide( 75 )

    end

    function PANEL:UpdateText()

        local str = input.GetKeyName( self:GetSelectedNumber() )
        if ( !str ) then str = "" end

        str = language.GetPhrase( str )

        self:SetText( "["..str.."]" )
        self:SetTextColor(ultimate.Colors[165])
        self:SetFont("DermaSmall")
    end

    function PANEL:Paint(w,h)
        surface.SetDrawColor(ultimate.Colors[54])
        surface.DrawOutlinedRect(0,0,w,h,1)
    end

    function PANEL:DoClick()

        self:SetText( "PRESS A KEY" )
        input.StartKeyTrapping()
        self.Trapping = true

    end

    function PANEL:DoRightClick()

        self:SetText( "[]" )
        self:SetValue( 0 )

    end

    function PANEL:SetSelectedNumber( iNum )

        self.m_iSelectedNumber = iNum
        self:UpdateText()
        self:OnChange( iNum )

    end

    function PANEL:Think()

        if ( input.IsKeyTrapping() && self.Trapping ) then

            local code = input.CheckKeyTrapping()
            if ( code ) then

                if ( code == KEY_ESCAPE ) then

                    self:SetValue( self:GetSelectedNumber() )

                else

                    self:SetValue( code )

                end

                self.Trapping = false

            end

        end

    end

    function PANEL:SetValue( iNumValue )

        self:SetSelectedNumber( iNumValue )

    end

    function PANEL:GetValue()

        return self:GetSelectedNumber()

    end

    function PANEL:OnChange()
    end

    vgui.Register( "UBinder", PANEL, "DButton" )
end

do
    local PANEL = {}

    PANEL.Color = Color(255,255,255,255)

    function PANEL:Init()
        self:Dock( RIGHT )
        self:DockMargin( 4, 0, 0, 0 )
        self:SetTall(18)
        self:SetWide(18)
        
        self:SetText("")
    end

    function PANEL:Paint(w,h)
        if self.Color.a < 255 then
            surface.SetDrawColor( ultimate.Colors[255] )
            surface.SetMaterial( ultimate.Materials["Alpha grid"] )
            surface.DrawTexturedRect( 0, 0, w, h )
        end

        surface.SetDrawColor(self.Color)
        surface.DrawRect(0,0,w,h)
    end

    vgui.Register( "UCPicker", PANEL, "DButton" )
end

do
    local PANEL = {}

    PANEL.lifeTime = 0

    function PANEL:Paint( w, h )
        surface.SetDrawColor( ultimate.Colors[ 25 ] )
        surface.DrawRect( 0, 0, w, h )

        surface.SetDrawColor( ultimate.Colors[54] )
        surface.DrawOutlinedRect( 0, 0, w, h, 1 )
    end

    function PANEL:Init()
        self:RequestFocus()
        self:MakePopup()
    end

    function PANEL:Think()
        if self.lifeTime < 15 then self.lifeTime = self.lifeTime + 1 end

        if not self:HasFocus() and self.lifeTime >= 14 then
            self:Remove()
        end
    end

    vgui.Register( "ULifeTimeBase", PANEL, "EditablePanel" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:SetSize(200, 200)
        self:SetAlpha(0)
        
        -- Анимация появления
        self.Animations = {}
        self.Animations.FadeIn = Derma_Anim("FadeIn", self, function(panel, animation, delta, data)
            panel:SetAlpha(delta * 255)
        end)
        self.Animations.FadeIn:Start(0.15)
    end 

    function PANEL:Paint(w, h)
        surface.SetDrawColor(ultimate.Colors[25])
        surface.DrawRect(0, 0, w, h)

        surface.SetDrawColor(ultimate.Colors[54])
        surface.DrawOutlinedRect(0, 0, w, h, 1)
    end

    vgui.Register("UColorPanel", PANEL, "ULifeTimeBase")
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock( FILL )
        self:DockPadding(5, 5, 5, 5)
        self:SetPalette( false )
        self:SetWangs( false )
    end

    vgui.Register( "UColorMixer", PANEL, "DColorMixer" )
end

do
    local PANEL = {}

    AccessorFunc( PANEL, "m_bDirty", "Dirty", FORCE_BOOL )
    AccessorFunc( PANEL, "m_bSortable", "Sortable", FORCE_BOOL )

    AccessorFunc( PANEL, "m_iHeaderHeight", "HeaderHeight" )
    AccessorFunc( PANEL, "m_iDataHeight", "DataHeight" )

    AccessorFunc( PANEL, "m_bMultiSelect", "MultiSelect" )
    AccessorFunc( PANEL, "m_bHideHeaders", "HideHeaders" )

    function PANEL:Init()
        self:SetSortable( true )
        self:SetMouseInputEnabled( true )
        self:SetMultiSelect( true )
        self:SetHideHeaders( false )

        self:SetPaintBackground( true )
        self:SetHeaderHeight( 16 )
        self:SetDataHeight( 17 )

        self.Columns = {}

        self.Lines = {}
        self.Sorted = {}

        self:SetDirty( true )

        self.pnlCanvas = vgui.Create( "Panel", self )

        self.VBar = vgui.Create( "DVScrollBar", self )
        self.VBar:SetZPos( 20 )
    end

    function PANEL:DisableScrollbar()

        if ( IsValid( self.VBar ) ) then
            self.VBar:Remove()
        end

        self.VBar = nil

    end

    function PANEL:GetLines()
        return self.Lines
    end

    function PANEL:GetInnerTall()
        return self:GetCanvas():GetTall()
    end

    function PANEL:GetCanvas()
        return self.pnlCanvas
    end

    function PANEL:AddColumn( strName, iPosition )

        if ( iPosition ) then
            if ( iPosition <= 0 ) then
                ErrorNoHaltWithStack( "Attempted to insert column at invalid position ", iPosition )
                return
            end
        
            if ( IsValid( self.Columns[ iPosition ] ) ) then
                ErrorNoHaltWithStack( "Attempted to insert duplicate column." )
                return
            end
        end

        local pColumn = nil

        if ( self.m_bSortable ) then
            pColumn = vgui.Create( "DListView_Column", self )
        else
            pColumn = vgui.Create( "DListView_ColumnPlain", self )
        end

        pColumn:SetName( strName )
        pColumn:SetZPos( 10 )

        if ( iPosition ) then

            table.insert( self.Columns, iPosition, pColumn )

            local i = 1
            for id, pnl in pairs( self.Columns ) do
                pnl:SetColumnID( i )
                i = i + 1
            end

        else

            local ID = table.insert( self.Columns, pColumn )
            pColumn:SetColumnID( ID )

        end

        self:InvalidateLayout()

        return pColumn

    end

    function PANEL:RemoveLine( LineID )

        local Line = self:GetLine( LineID )
        local SelectedID = self:GetSortedID( LineID )

        self.Lines[ LineID ] = nil
        table.remove( self.Sorted, SelectedID )

        self:SetDirty( true )
        self:InvalidateLayout()

        Line:Remove()

    end

    function PANEL:ColumnWidth( i )

        local ctrl = self.Columns[ i ]
        if ( !ctrl ) then return 0 end

        return ctrl:GetWide()

    end

    function PANEL:FixColumnsLayout()

        local NumColumns = table.Count( self.Columns )
        if ( NumColumns == 0 ) then return end

        local AllWidth = 0
        for k, Column in pairs( self.Columns ) do
            AllWidth = AllWidth + math.ceil( Column:GetWide() )
        end

        local ChangeRequired = self.pnlCanvas:GetWide() - AllWidth
        local ChangePerColumn = math.floor( ChangeRequired / NumColumns )
        local Remainder = ChangeRequired - ( ChangePerColumn * NumColumns )

        for k, Column in pairs( self.Columns ) do

            local TargetWidth = math.ceil( Column:GetWide() ) + ChangePerColumn
            Remainder = Remainder + ( TargetWidth - Column:SetWidth( TargetWidth ) )

        end

        local TotalMaxWidth = 0

        -- If there's a remainder, try to palm it off on the other panels, equally
        while ( Remainder != 0 ) do

            local PerPanel = math.floor( Remainder / NumColumns )

            for k, Column in pairs( self.Columns ) do

                Remainder = math.Approach( Remainder, 0, PerPanel )

                local TargetWidth = math.ceil( Column:GetWide() ) + PerPanel
                Remainder = Remainder + ( TargetWidth - Column:SetWidth( TargetWidth ) )

                if ( Remainder == 0 ) then break end

                TotalMaxWidth = TotalMaxWidth + math.ceil( Column:GetMaxWidth() )

            end

            -- Total max width of all the columns is less than the width of the DListView, abort!
            if ( TotalMaxWidth < self.pnlCanvas:GetWide() ) then break end

            Remainder = math.Approach( Remainder, 0, 1 )

        end

        -- Set the positions of the resized columns
        local x = 0
        for k, Column in pairs( self.Columns ) do

            Column.x = x
            x = x + math.ceil( Column:GetWide() )

            Column:SetTall( math.ceil( self:GetHeaderHeight() ) )
            Column:SetVisible( !self:GetHideHeaders() )

        end

    end

    function PANEL:PerformLayout()

        -- Do Scrollbar
        local Wide = self:GetWide()
        local YPos = 0

        if ( IsValid( self.VBar ) ) then

            self.VBar:SetPos( self:GetWide() - 16, 0 )
            self.VBar:SetSize( 16, self:GetTall() )
            self.VBar:SetUp( self.VBar:GetTall() - self:GetHeaderHeight(), self.pnlCanvas:GetTall() )
            YPos = self.VBar:GetOffset()

            if ( self.VBar.Enabled ) then Wide = Wide - 16 end

        end

        if ( self.m_bHideHeaders ) then
            self.pnlCanvas:SetPos( 0, YPos )
        else
            self.pnlCanvas:SetPos( 0, YPos + self:GetHeaderHeight() )
        end

        self.pnlCanvas:SetSize( Wide, self.pnlCanvas:GetTall() )

        self:FixColumnsLayout()

        --
        -- If the data is dirty, re-layout
        --
        if ( self:GetDirty() ) then

            self:SetDirty( false )
            local y = self:DataLayout()
            self.pnlCanvas:SetTall( y )

            -- Layout again, since stuff has changed..
            self:InvalidateLayout( true )

        end

    end

    function PANEL:OnScrollbarAppear()

        self:SetDirty( true )
        self:InvalidateLayout()

    end

    function PANEL:OnRequestResize( SizingColumn, iSize )

        -- Find the column to the right of this one
        local Passed = false
        local RightColumn = nil
        for k, Column in pairs( self.Columns ) do

            if ( Passed ) then
                RightColumn = Column
                break
            end

            if ( SizingColumn == Column ) then Passed = true end

        end

        -- Alter the size of the column on the right too, slightly
        if ( RightColumn ) then

            local SizeChange = SizingColumn:GetWide() - iSize
            RightColumn:SetWide( RightColumn:GetWide() + SizeChange )

        end

        SizingColumn:SetWide( iSize )
        self:SetDirty( true )

        -- Invalidating will munge all the columns about and make it right
        self:InvalidateLayout()

    end

    function PANEL:DataLayout()

        local y = 0
        local h = self.m_iDataHeight

        local alt = false
        for k, Line in ipairs( self.Sorted ) do

            if ( !Line:IsVisible() ) then continue end

            Line:SetPos( 1, y )
            Line:SetSize( self:GetWide() - 2, h )
            Line:DataLayout( self )

            Line:SetAltLine( alt )
            alt = !alt

            y = y + Line:GetTall()

        end

        return y

    end

    PANEL.Cur = true
    function PANEL:AddLine( ... )

        self.Cur = not self.Cur

        self:SetDirty( true )
        self:InvalidateLayout()

        local Line = vgui.Create( "DListView_Line", self.pnlCanvas )
        local c = self.Cur and 48 or 32

        function Line:Paint( w, h )
            
            surface.SetDrawColor( c, c, c )
            surface.DrawRect( 0, 0, w, h )
        end

        local ID = table.insert( self.Lines, Line )

        Line:SetListView( self )
        Line:SetID( ID )

        -- This assures that there will be an entry for every column
        for k, v in pairs( self.Columns ) do
            Line:SetColumnText( k, "" )
        end

        for k, v in pairs( {...} ) do
            Line:SetColumnText( k, v )
        end

        -- Make appear at the bottom of the sorted list
        local SortID = table.insert( self.Sorted, Line )

        if ( SortID % 2 == 1 ) then
            Line:SetAltLine( true )
        end

        return Line

    end

    function PANEL:OnMouseWheeled( dlta )

        if ( !IsValid( self.VBar ) ) then return end

        return self.VBar:OnMouseWheeled( dlta )

    end

    function PANEL:ClearSelection( dlta )

        for k, Line in pairs( self.Lines ) do
            Line:SetSelected( false )
        end

    end

    function PANEL:GetSelectedLine()

        for k, Line in pairs( self.Lines ) do
            if ( Line:IsSelected() ) then return k, Line end
        end

    end

    function PANEL:GetLine( id )

        return self.Lines[ id ]

    end

    function PANEL:GetSortedID( line )

        for k, v in pairs( self.Sorted ) do

            if ( v:GetID() == line ) then return k end

        end

    end

    function PANEL:OnClickLine( Line, bClear )

        local bMultiSelect = self:GetMultiSelect()
        if ( !bMultiSelect && !bClear ) then return end

        --
        -- Control, multi select
        --
        if ( bMultiSelect && input.IsKeyDown( KEY_LCONTROL ) ) then
            bClear = false
        end

        --
        -- Shift block select
        --
        if ( bMultiSelect && input.IsKeyDown( KEY_LSHIFT ) ) then

            local Selected = self:GetSortedID( self:GetSelectedLine() )
            if ( Selected ) then

                local LineID = self:GetSortedID( Line:GetID() )

                local First = math.min( Selected, LineID )
                local Last = math.max( Selected, LineID )

                -- Fire off OnRowSelected for each non selected row
                for id = First, Last do
                    local line = self.Sorted[ id ]
                    if ( !line:IsLineSelected() ) then self:OnRowSelected( line:GetID(), line ) end
                    line:SetSelected( true )
                end

                -- Clear the selection and select only the required rows
                if ( bClear ) then self:ClearSelection() end

                for id = First, Last do
                    local line = self.Sorted[ id ]
                    line:SetSelected( true )
                end

                return

            end

        end

        --
        -- Check for double click
        --
        if ( Line:IsSelected() && Line.m_fClickTime && ( !bMultiSelect || bClear ) ) then

            local fTimeDistance = SysTime() - Line.m_fClickTime

            if ( fTimeDistance < 0.3 ) then
                self:DoDoubleClick( Line:GetID(), Line )
                return
            end

        end

        --
        -- If it's a new mouse click, or this isn't
        -- multiselect we clear the selection
        --
        if ( !bMultiSelect || bClear ) then
            self:ClearSelection()
        end

        if ( Line:IsSelected() ) then return end

        Line:SetSelected( true )
        Line.m_fClickTime = SysTime()

        self:OnRowSelected( Line:GetID(), Line )

    end

    function PANEL:SortByColumns( c1, d1, c2, d2, c3, d3, c4, d4 )

        table.Copy( self.Sorted, self.Lines )

        table.sort( self.Sorted, function( a, b )

            if ( !IsValid( a ) ) then return true end
            if ( !IsValid( b ) ) then return false end

            if ( c1 && a:GetColumnText( c1 ) != b:GetColumnText( c1 ) ) then
                if ( d1 ) then a, b = b, a end
                return a:GetColumnText( c1 ) < b:GetColumnText( c1 )
            end

            if ( c2 && a:GetColumnText( c2 ) != b:GetColumnText( c2 ) ) then
                if ( d2 ) then a, b = b, a end
                return a:GetColumnText( c2 ) < b:GetColumnText( c2 )
            end

            if ( c3 && a:GetColumnText( c3 ) != b:GetColumnText( c3 ) ) then
                if ( d3 ) then a, b = b, a end
                return a:GetColumnText( c3 ) < b:GetColumnText( c3 )
            end

            if ( c4 && a:GetColumnText( c4 ) != b:GetColumnText( c4 ) ) then
                if ( d4 ) then a, b = b, a end
                return a:GetColumnText( c4 ) < b:GetColumnText( c4 )
            end

            return true
        end )

        self:SetDirty( true )
        self:InvalidateLayout()

    end

    function PANEL:SortByColumn( ColumnID, Desc )

        table.Copy( self.Sorted, self.Lines )

        table.sort( self.Sorted, function( a, b )

            if ( Desc ) then
                a, b = b, a
            end

            local aval = a:GetSortValue( ColumnID ) || a:GetColumnText( ColumnID )
            local bval = b:GetSortValue( ColumnID ) || b:GetColumnText( ColumnID )

            -- Maintain nicer sorting for numbers
            if ( isnumber( aval ) && isnumber( bval ) ) then return aval < bval end

            return tostring( aval ) < tostring( bval )

        end )

        self:SetDirty( true )
        self:InvalidateLayout()

    end

    function PANEL:SelectItem( Item )

        if ( !Item ) then return end

        Item:SetSelected( true )
        self:OnRowSelected( Item:GetID(), Item )

    end

    function PANEL:SelectFirstItem()

        self:ClearSelection()
        self:SelectItem( self.Sorted[ 1 ] )

    end

    function PANEL:DoDoubleClick( LineID, Line )

        -- For Override

    end

    function PANEL:OnRowSelected( LineID, Line )

        -- For Override

    end

    function PANEL:OnRowRightClick( LineID, Line )

        -- For Override

    end

    function PANEL:Clear()

        for k, v in pairs( self.Lines ) do
            v:Remove()
        end

        self.Lines = {}
        self.Sorted = {}

        self:SetDirty( true )

    end

    function PANEL:GetSelected()

        local ret = {}

        for k, v in pairs( self.Lines ) do
            if ( v:IsLineSelected() ) then
                table.insert( ret, v )
            end
        end

        return ret

    end

    function PANEL:SizeToContents()

        self:SetHeight( self.pnlCanvas:GetTall() + self:GetHeaderHeight() )

    end

    vgui.Register( "UListView", PANEL, "DPanel" )
end


do
    local PANEL = {}

    function PANEL:Paint( w, h )
        surface.SetDrawColor( ultimate.Colors[24] )
        surface.DrawRect( 0, 0, w, h )

        surface.SetDrawColor( ultimate.Colors[54] )
        surface.DrawOutlinedRect( 0, 0, w, h, 1 )
    end

    vgui.Register( "USettingsPanel", PANEL, "ULifeTimeBase" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock( RIGHT )
        self:DockMargin( 4, 0, 0, 0 )
        self:SetTall( 18 )
        self:SetWide( 18 )
        self:SetText( "..." )
    end

    vgui.Register( "USPanelButton", PANEL, "UButton" )
end

do
    local PANEL = {}

    function PANEL:Init()

        self.ButtonPanel = vgui.Create( "DPanel", self )
        self.ButtonPanel:Dock( TOP )
        self.ButtonPanel:DockMargin(3,3,3,2)
        self.ButtonPanel:SetTall(18)

        self.ItemPanel = vgui.Create( "DPanel", self )
        self.ItemPanel:Dock( FILL )
        self.ItemPanel:DockMargin( 3, 0, 3, 3 )

        self.ButtonPanel.Paint = nil
        self.ItemPanel.Paint = nil

        self.ActiveTab = "NIL"

        function self.ItemPanel:OnMousePressed()
            ultimate.frame:OnMousePressed()
        end
    
        function self.ItemPanel:OnMouseReleased()
            ultimate.frame:OnMouseReleased()
        end
    end

    function PANEL:Paint( w, h )
        surface.SetDrawColor( ultimate.Colors[54] )
        surface.DrawOutlinedRect( 0, 0, w, h, 1 )
   
        surface.SetFont( "DermaSmall" )

        surface.SetTextColor( ultimate.Colors[165] )
        surface.SetTextPos( 8, 2 ) 
        surface.DrawText( self.txt ) 

        surface.SetDrawColor( ultimate.Colors[ 54 ] )
        surface.DrawRect( 6, 20, w - 12, 1 )
    end

    function PANEL:OnMousePressed()
        ultimate.frame:OnMousePressed()
    end

    function PANEL:OnMouseReleased()
        ultimate.frame:OnMouseReleased()
    end

    function PANEL:GetItemPanel()
        return self.ItemPanel
    end

    function PANEL:GetButtonPanel()
        return self.ButtonPanel
    end

    vgui.Register( "UButtonBarPanel", PANEL, "Panel" )
end




// GUI FUNCS

ultimate.ui.ColorWindow = false
ultimate.ui.SettingsPan = false
ultimate.ui.MultiComboP = false

function ultimate.ui.RemovePanel( pan )
    if not pan then return end 

    pan:Remove()
    pan = false
end

function ultimate.ui.Binder( cfg, par )
    local b = vgui.Create( "UBinder", par )
    b:SetValue( ultimate.cfg.binds[ cfg ] )

    function b:OnChange()
        ultimate.cfg.binds[ cfg ] = b:GetValue()
    end

    return b
end

function ultimate.ui.ColorPicker(cfg, par, onChange)
    local b = vgui.Create("UCPicker", par)
    b.Color = string.ToColor(ultimate.cfg.colors[cfg] or "255 255 255 255") -- Добавлено значение по умолчанию

    function b:DoClick()
        local x, y = self:LocalToScreen(0, self:GetTall())
        
        -- Закрываем существующее окно, если есть
        if IsValid(ultimate.ui.ColorWindow) then
            ultimate.ui.ColorWindow:Remove()
        end

        -- Создаем новое окно
        ultimate.ui.ColorWindow = vgui.Create("UColorPanel")
        ultimate.ui.ColorWindow:SetPos(x+25, y-100)
        ultimate.ui.ColorWindow:SetSize(200, 200) -- Явно задаем размер
        
        -- Настройка анимации появления
        ultimate.ui.ColorWindow:SetAlpha(0)
        ultimate.ui.ColorWindow:AlphaTo(255, 0.2, 0, function() end)

        -- Создаем цветовой микшер
        local c = vgui.Create("UColorMixer", ultimate.ui.ColorWindow)
        c:Dock(FILL)
        c:SetColor(b.Color)
        
        -- Кастомизация элементов выбора цвета
        c.HSV.Knob:SetSize(5, 5)
        
        function c.HSV.Knob:Paint(w, h)
            surface.SetDrawColor(b.Color.r, b.Color.g, b.Color.b, 255)
            surface.DrawRect(0, 0, w, h)
            surface.SetDrawColor(ultimate.Colors[255] or color_white)
            surface.DrawOutlinedRect(0, 0, w, h, 1)
        end

        -- Обработка изменения цвета
        function c:ValueChanged(col)
            b.Color = col
            ultimate.cfg.colors[cfg] = string.format("%d %d %d %d", col.r, col.g, col.b, col.a)
            if onChange then 
                onChange(col) 
            end
            
            -- Обновляем отображение кнопки
            if IsValid(b) then
                b:SetColor(col)
            end
        end
    end

    -- Функция для обновления цвета кнопки
    function b:SetColor(col)
        self.Color = col
        self:SetTooltip(string.format("R: %d G: %d B: %d A: %d", col.r, col.g, col.b, col.a))
    end

    -- Инициализация кнопки
    b:SetColor(b.Color)
    
    return b
end

function ultimate.ui.SPanel( func, p )
    local b = vgui.Create( "USPanelButton", p )

    function b:DoClick()
        local mx, my = input.GetCursorPos()

        ultimate.ui.RemovePanel( ultimate.ui.SettingsPan )

        ultimate.ui.SettingsPan = vgui.Create( "USettingsPanel" )
        ultimate.ui.SettingsPan:SetPos( mx+25, my-10 )

        func()
    end
end

function ultimate.ui.Label( pan, str, postCreate )
    local p = vgui.Create( "UCBPanel", pan )

    local lbl = vgui.Create( "DLabel", p )
    lbl:SetText( str )
    lbl:SetFont( "DermaSmall" )
    lbl:SetTextColor( ultimate.Colors[165] )
    lbl:Dock( LEFT )
    lbl:DockMargin( 4, 2, 4, 0 )
    lbl:SizeToContents()

    if postCreate then postCreate( p ) end
end
    
function ultimate.ui.CheckBox( par, lbl, cfg, hint, bind, color, spanel, onToggle, postCreate )
    local p = vgui.Create( "UCBPanel", par )

    local c = vgui.Create( "UCheckboxLabel", p )
    c:SetText( lbl )
    c:SetPos( 0, 0 )
    c:SetValue( ultimate.cfg.vars[cfg] )

    function c:OnChange( bval )
        ultimate.cfg.vars[cfg] = bval

        if onToggle then onToggle(bval) end
    end

    if postCreate then postCreate( p ) end

    if bind then ultimate.ui.Binder( cfg, p ) end
    if color then ultimate.ui.ColorPicker( cfg, p ) end
    if spanel then ultimate.ui.SPanel( spanel, p ) end

    if hint then
        function c.Label:Paint()
            if self:IsHovered() then
                local x, y = input.GetCursorPos()

                ultimate.hint = true
                ultimate.hintText = hint
                ultimate.hintX = x + 45
                ultimate.hintY = y - 5
            end
        end
    end
end

function ultimate.ui.Slider( p, str, cfg, min, max, dec, onChange )
    local pan = vgui.Create( "DPanel", p )
    pan:Dock( TOP )
    pan:DockMargin( 4, 2, 4, 0 )
    pan:SetTall( 20 )

    function pan:Paint( w, h )
        surface.SetFont("DermaSmall")

        local s = ultimate.cfg.vars[cfg]
        local tw, th = surface.GetTextSize(s)
        
        surface.SetTextColor( ultimate.Colors[165] )

        surface.SetTextPos( 2, 4 ) 
        surface.DrawText( str ) 

        surface.SetTextPos( w - tw - 2, 4 ) 
        surface.DrawText( ultimate.cfg.vars[cfg] ) 
    end

    local c = vgui.Create( "USlider", p )
    c:Dock( TOP )
    c:DockMargin( 4, 2, 4, 0 )
    c:SetMax( max )
    c:SetMin( min )
    c:SetDecimals( dec )

    c:SetValue( ultimate.cfg.vars[cfg] )

    local value, min, max = c:GetValue(), c:GetMin(), c:GetMax()

	c:SetSlideX((value - min) / (max - min))

    function c:OnValueChanged( val )
        ultimate.cfg.vars[cfg] = val

        if onChange then onChange(val) end
    end
end

function ultimate.ui.Button( str, func, p ) 
    local b = vgui.Create( "UButton", p )
    b:SetText( str )

    function b:DoClick()
        func()
    end
end

function ultimate.ui.TextEntry( str, cfg, pan, chars, postCreate )
    local lbl = vgui.Create("DLabel",pan)
    lbl:Dock(TOP)
    lbl:DockMargin(4,2,4,0)
    lbl:SetText(str)
    lbl:SetFont("DermaSmall")
    lbl:SetColor(ultimate.Colors[165])

    local p = vgui.Create("DPanel",pan)
    p:SetTall(25)
    p:Dock(TOP)
    p:DockMargin(4,2,4,0)

    p.Paint = function(s,w,h)
        surface.SetDrawColor(ultimate.Colors[54])
        surface.DrawOutlinedRect(0,0,w,h)
    end
	
	local txt = vgui.Create("DTextEntry",p)
	txt:Dock(FILL)
	txt:DockMargin(4,4,4,4) 
	txt:IsMultiline( false )
	txt:SetMaximumCharCount(chars)
	txt:SetPlaceholderText(str)
	txt:SetFont( "DermaSmall" )
    txt:SetPaintBackground(false)
    txt:SetTextColor(ultimate.Colors[165])

	if ultimate.cfg.vars[cfg] != nil and ultimate.cfg.vars[cfg] != "" then
		txt:SetValue(ultimate.cfg.vars[cfg])
	end

	function txt.Think()
		if txt:IsEditing() then return end
        if ultimate.cfg.vars[cfg] == txt:GetValue() then return end

		ultimate.cfg.vars[cfg] = txt:GetValue()
	end 

	function txt.OnValueChange()
		ultimate.cfg.vars[cfg] = txt:GetValue()
	end

    if postCreate then postCreate(p) end
end

function ultimate.ui.dropdownButton( str, v, p, a )
    local b = p:Add("DButton")
    b:Dock(TOP)
    b:SetTall(20)
    b:DockMargin(2,2,2,0)
    b:SetText("")
    
    function b:Paint(w,h)
        if self:IsHovered() then 
            surface.SetDrawColor( ultimate.Colors[ 32 ] )
            surface.DrawRect( 1, 1, w - 2, h - 2 )
        end

        surface.SetTextColor(ultimate.Colors[165])

        if ultimate.cfg.vars[str.."-"..v] then
            surface.SetTextColor(ultimate.Colors[235]) 
        end

        surface.SetTextPos(5,3)
        surface.SetFont("DermaSmall")
        surface.DrawText(v)
    end

    function b:DoClick()
        ultimate.cfg.vars[str.."-"..v] = not ultimate.cfg.vars[str.."-"..v] 
    end
end

function ultimate.ui.MultiCombo( pan, str, choices )
    local lbl = vgui.Create("DLabel",pan)
    lbl:Dock(TOP)
    lbl:DockMargin(4,1,4,0)
    lbl:SetText(str)
    lbl:SetFont("DermaSmall")
    lbl:SetColor(ultimate.Colors[165])

    local d = vgui.Create("DButton",pan)
    d:Dock(TOP)
    d:DockMargin(4,1,4,0)
    d:SetTall(20)
    d:SetText("")
    
    d.preview = {}

    function d:Paint(w,h)
        local preview = ""

        for k, v in pairs(choices) do
            if ultimate.cfg.vars[str.."-"..v] == true and (d.preview[v] == false or d.preview[v] == nil) and not table.HasValue(d.preview, v) then
                table.insert(d.preview,v) 
            elseif ultimate.cfg.vars[str.."-"..v] == false and (d.preview[v] == true or d.preview[v] == nil) and table.HasValue(d.preview, v) then
                table.RemoveByValue(d.preview,v)
            elseif d.preview[v] == false then 
                table.RemoveByValue(d.preview,v)
            end
        end

        preview = table.concat(d.preview,", ")

        surface.SetDrawColor(ultimate.Colors[25])
        surface.DrawRect(0,0,w,h)
    
        surface.SetTextColor(ultimate.Colors[165])
        surface.SetTextPos(8,20/2-15/2)
        surface.SetFont("DermaSmall")
        surface.DrawText(preview)
    
        surface.SetDrawColor(ultimate.Colors[32])
        surface.DrawRect(w-25,0,25,25)
    
        surface.SetTextColor(ultimate.Colors[165])
        surface.SetTextPos(w-20,20/2-15/2)
        surface.SetFont("DermaSmall")
        surface.DrawText("▼")

        surface.SetDrawColor(ultimate.Colors[54])
        surface.DrawOutlinedRect(0,0,w,h,1)
    end

    function d:DoClick()
        local x,y = self:LocalToScreen( 0, self:GetTall() )

        ultimate.ui.RemovePanel( ultimate.ui.MultiComboP )

        local ctoh = #choices
    
        ultimate.ui.MultiComboP = vgui.Create( "ULifeTimeBase" )
        ultimate.ui.MultiComboP:SetPos( x, y - 1 )
        ultimate.ui.MultiComboP:SetSize( 243, ctoh * 22 + 2 )
    
        for k, v in pairs(choices) do
            ultimate.ui.dropdownButton( str, v, ultimate.ui.MultiComboP, d.preview )
        end
    end
end

function ultimate.ui.ComboBox( pan, str, cfg, choices )
    local lbl = vgui.Create("DLabel",pan)
    lbl:Dock(TOP)
    lbl:DockMargin(4,1,4,0)
    lbl:SetText(str)
    lbl:SetFont("DermaSmall")
    lbl:SetColor(ultimate.Colors[165])

    local dropdown = vgui.Create("UComboBox",pan)
    dropdown:Dock(TOP)
    dropdown:DockMargin(4,1,4,0)
    
    if ultimate.presets[ cfg ] then
        choices = ultimate.presets[ cfg ]
    end 
    
    for k, v in ipairs( choices ) do
        dropdown:AddChoice( v )
    end
    
    dropdown:SetSortItems(false)

    if ultimate.cfg.vars[cfg] <= #choices then
        dropdown:ChooseOptionID(ultimate.cfg.vars[cfg])
    else
        dropdown:ChooseOptionID(1)
    end

    function dropdown:OnSelect(index, value, data)
        ultimate.cfg.vars[cfg] = index
    end

    return lbl, dropdown
end

function ultimate.ui.InitMT( p, postCreate )
    p.ItemPanel:Remove()

    p.ItemPanel = vgui.Create( "DPanel", p )
    p.ItemPanel:Dock( FILL )
    p.ItemPanel:DockMargin( 3, 0, 3, 3 )

    p.ItemPanel.Paint = nil

    if postCreate then postCreate( p.ItemPanel ) end
end

function ultimate.ui.MTButton( p, str, postCreate )
    surface.SetFont("DermaSmall")
    local w, h = surface.GetTextSize(str)

    local fw = w + 5

    local tx, ty = fw/2 - w/2, 18 / 2-h / 2 - 1

    local b = p:GetButtonPanel():Add("DButton")
    b:Dock(RIGHT)
    b:DockMargin(2,0,2,1)
    b:SetWide(fw)
    b:SetText("")
    
    function b:DoClick()
        p.ActiveTab = str
        ultimate.ui.InitMT( p, postCreate )
    end

    function b:Paint(width,height)
        if p.ActiveTab == str then
            surface.SetTextColor(235,235,235,255)
        else
            surface.SetTextColor(165,165,165,255)
        end
        
        surface.DrawRect(0,0,width,height)

        surface.SetFont("DermaSmall")
        surface.SetTextPos(tx,ty)
        surface.DrawText(str)
    end

    p.ActiveTab = str
    ultimate.ui.InitMT( p, postCreate )
end

ultimate.pty = { 5, 5, 5 }
do
    local xt = { 
        [1] = 5,
        [2] = 267,
        [3] = 529
    }

    function ultimate.itemPanel( str, tbl, h )
        local p = vgui.Create( "UPanel", ultimate.scrollpanel )
        p:SetPos( xt[tbl], ultimate.pty[tbl] )
        p:SetSize( 257, h )
        p.txt = str

        ultimate.pty[ tbl ] = ultimate.pty[ tbl ] + h + 5

        return p
    end

    function ultimate.itemPanelB( str, tbl, h, buttonsFunc )
        local p = vgui.Create( "UButtonBarPanel", ultimate.scrollpanel )
        p:SetPos( xt[tbl], ultimate.pty[tbl] )
        p:SetSize( 257, h )
        p.txt = str

        if buttonsFunc then buttonsFunc( p ) end

        ultimate.pty[ tbl ] = ultimate.pty[ tbl ] + h + 5

        return p
    end

end

/*
    Drag n drop 
*/

ultimate.espposes = {"Up","Down","Right","Left"}
ultimate.espelements = {"Name pos","Mark pos","Usergroup pos","Health pos","Armor pos","Money pos","Weapon pos","Team pos","Break LC pos","Simtime pos"}
ultimate.lastdrag = ""
ultimate.esppans = {}

ultimate.esppansposes = {
    [1] = {
        x = 85,
        y = 0,
    },
    [2] = {
        x = 85,
        y = 250,
    },
    [3] = {
        x = 170,
        y = 125,
    },
    [4] = {
        x = 0,
        y = 125,
    },
}

for i = 1, 4 do
    ultimate.esppans[i] = {}
end

function ultimate.DoDrop( self, panels, bDoDrop, Command, x, y )
    if ( bDoDrop ) then
        local newpos = self.pos
        
        for i = 1, #panels do
            local v = panels[i]

            ultimate.cfg.vars[ v:GetText() ] = newpos
            v:SetParent( self )
        end
    end
end
    
ultimate.spfuncs = {}

// PANEL CREATION

ultimate.frame = vgui.Create("UFrame")
ultimate.scrollpanel = vgui.Create("UScroll",ultimate.frame)

ultimate.tabs = {}

// Aimbot

ultimate.spfuncs[30] = function()
    ultimate.ui.SettingsPan:SetSize(250,200)

    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Force seed", "Force seed" )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Wait for seed", "Wait for seed" )

    
end

ultimate.spfuncs[32] = function()
    ultimate.ui.SettingsPan:SetSize(250,200)

    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Max simulation time", "Crossbow max simtime", 1, 10, 2 )

end

function ultimate.tabs.Aimbot()

    local p = ultimate.itemPanel("Main",1,145):GetItemPanel()

    ultimate.ui.CheckBox( p, "Enable aimbot", "Enable aimbot", false, false, false, false, false, function( p ) ultimate.ui.Binder( "Aim on key", p ) end )
    ultimate.ui.CheckBox( p, "Silent aim", "Silent aim" )
    ultimate.ui.CheckBox( p, "pSilent", "pSilent", "Make aim completely invisible." )
    ultimate.ui.CheckBox( p, "Auto fire", "Auto fire", "Automatically fires when targets can be damaged.", false, false, ultimate.spfuncs[2] )
    ultimate.ui.CheckBox( p, "Auto reload", "Auto reload", "Automatically reloads weapon when clip is empty." )

    local p = ultimate.itemPanel("Legit",1,100):GetItemPanel()

    ultimate.ui.CheckBox( p, "Aimbot smoothing", "Aimbot smoothing", false, false, false, ultimate.spfuncs[4] )
    ultimate.ui.CheckBox( p, "Fov limit", "Fov limit", false, false, false, ultimate.spfuncs[5] )
    ultimate.ui.CheckBox( p, "Triggerbot", "Trigger bot", false, true )

    local p = ultimate.itemPanel( "Visualisation", 1, 120 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "FOV Circle", "Show FOV", false, false, true )
    ultimate.ui.CheckBox( p, "Snapline", "Aimbot snapline", false, false, true )
    ultimate.ui.CheckBox( p, "Marker", "Aimbot marker", false, false, true )
    ultimate.ui.CheckBox( p, "Knifebot Range", "Knifebot Range" )

    local p = ultimate.itemPanel( "Accuracy", 2, 80 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Compensate recoil", "Norecoil" )
    ultimate.ui.CheckBox( p, "Compensate spread", "Nospread", "Supported HL2, M9K, FAS2, CW2, SWB", false, false, ultimate.spfuncs[30] )

    local p = ultimate.itemPanel( "Prediction", 2, 100 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Crossbow prediction", "Crossbow prediction" )
    ultimate.ui.Slider( p, "Simulation limit", "Simulation limit", 1, 10, 2 )
    --ultimate.ui.CheckBox( p, "Predict fist", "Predict fist" )

    local p = ultimate.itemPanel("Knife bot",2,120):GetItemPanel()

    ultimate.ui.CheckBox( p, "Knife bot", "Knifebot", false, false, false )
    ultimate.ui.ComboBox( p, "Knifebot mode", "Knifebot mode"  )
    ultimate.ui.CheckBox( p, "Facestab", "Facestab" )

    --local p = ultimate.itemPanel( "Tickbase", 2, 100 ):GetItemPanel()

    --ultimate.ui.CheckBox( p, "Engine pred", "Engine pred" )
    //ultimate.ui.Slider( p, "TicksTime", "tickfix_time", 0, 6, 2 )
    --ultimate.ui.CheckBox( p, "NoPlyLag", "NoAimLag", "Off comp lag" )
    //ultimate.ui.CheckBox( p, "GetManipulateInterp", "GetManipulateInterp" )
    --ultimate.ui.CheckBox( p, "LagCompensation", "LagCompensation", "Compensate ping loss" )
    --ultimate.ui.CheckBox( p, "LerpTime abjust", "LerpTime", "abuse lerptime target" )



    local p = ultimate.itemPanel( "Target selection", 3, 260 ):GetItemPanel()

    ultimate.ui.ComboBox( p, "Target selection", "Target selection", { "Distance", "FOV" } )
    ultimate.ui.MultiCombo( p, "Ignores", { "Friends", "Steam friends", "Teammates", "Driver", "Head unhitable", "God time", "Nocliping", "Nodraw", "Frozen", "Bots", "Admins" } )
    ultimate.ui.CheckBox( p, "Wallz", "Wallz" ) 
    ultimate.ui.Slider( p, "Max targets", "Max targets", 0, 10, 0 )
    ultimate.ui.Slider( p, "Max distance", "Max distance", 0, 4096, 0 )
    ultimate.ui.CheckBox( p, "Target-Priority-Only", "Target-Priority-Only" )
    ultimate.ui.CheckBox( p, "auto dist for ruselit", "RusEliteDetector" )

    local p = ultimate.itemPanel( "Hitbox selection", 3, 240 ):GetItemPanel()

    ultimate.ui.ComboBox( p, "Hitbox selection", "Hitbox selection", { "Head", "Chest", "Penis" } )
    ultimate.ui.CheckBox( p, "Hitscan", "Hitscan" ) 
    //ultimate.ui.ComboBox( p, "Hitscan mode", { "Damage", "Safety", "Scale" }, "Hitscan mode" )
    ultimate.ui.MultiCombo( p, "Hitscan groups", { "Head", "Chest", "Stomach", "Arms", "Legs", "Generic" } )
    ultimate.ui.CheckBox( p, "Multipoint", "Multipoint" ) 
    ultimate.ui.MultiCombo( p, "Multipoint groups", { "Head", "Chest", "Stomach", "Arms", "Legs", "Generic" } )
    ultimate.ui.Slider( p, "Multipoint scale", "Multipoint scale", 0.5, 1, 1 )
end



ultimate.spfuncs[22] = function()
    ultimate.ui.SettingsPan:SetSize(250,200)

    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Lag limit","Lag limit",1,23,0 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Random min","Lag randomisation",1,23,0 )
    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Lag mode", "Lag mode", {"Static","Adaptive","Hybrid"})
    ultimate.ui.MultiCombo( ultimate.ui.SettingsPan, "Fake lag options", {"Disable on ladder","Disable in attack","Randomise","On peek"} )
end

ultimate.spfuncs[24] = function( p )
   
end

ultimate.spfuncs[36] = function()
    ultimate.ui.SettingsPan:SetSize(250,200)
    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Material", "Antiaim material", ultimate.chamsMaterials)
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Fullbright", "Antiaim fullbright" )
end

function ultimate.tabs.Rage()
    local p = ultimate.itemPanel( "Angles", 1, 245 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Enable Anti-Aim", "Anti aim", false, true )
    ultimate.ui.CheckBox( p, "Inverter", "Inverter", false, true )
    ultimate.ui.ComboBox( p, "Yaw base", "Yaw base" )
    ultimate.ui.ComboBox( p, "Yaw", "Yaw" )
    ultimate.ui.ComboBox( p, "Pitch", "Pitch" )
    ultimate.ui.ComboBox( p, "Edge", "Edge", { "Disabled", "Hide", "Show", "Jitter" } )

    local p = ultimate.itemPanel( "Tweaks", 1, 140 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "On shot aa", "On shot aa" )
    ultimate.ui.CheckBox( p, "Yaw randomisation", "Yaw randomisation" )
    ultimate.ui.CheckBox( p, "Freestanding", "Freestanding" )
    ultimate.ui.CheckBox( p, "Micromovement", "Micromovement" )
    ultimate.ui.CheckBox( p, "Anti BruteForce", "Anti-BruteForce" )

    local p = ultimate.itemPanel( "Custom angles", 1, 500 ):GetItemPanel()

    ultimate.ui.Slider( p, "Custom real","Custom real", -180, 180, 0 )
    ultimate.ui.Slider( p, "Custom fake","Custom fake", -180, 180, 0 )
    ultimate.ui.Slider( p, "Fake switch","Fake switch", -180, 180, 0 )
    ultimate.ui.Slider( p, "Switch time","Switch time", 0, 10, 1 )
    ultimate.ui.Slider( p, "Custom pitch","Custom pitch", -360, 360, 0 )    
    ultimate.ui.Slider( p, "Spin speed","Spin speed", -50, 50, 0 )
    ultimate.ui.Slider( p, "Min Lby Delta","LBY min delta", 0, 360, 0 )
    ultimate.ui.Slider( p, "Break Lby Delta","LBY break delta", 0, 360, 0 )
    ultimate.ui.Slider( p, "Sin delta","Sin delta", -360, 360, 0 )
    ultimate.ui.Slider( p, "Sin add","Sin add", -180, 180, 0 )
    ultimate.ui.Slider( p, "Jitter delta","Jitter delta", -180, 180, 0 )
    ultimate.ui.Slider( p, "Low delta value","Low delta value", -180, 180, 0 )


    local p = ultimate.itemPanel( "Fake lag",2,120 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Fake lag", "Fake lag", false, false, false, ultimate.spfuncs[22] )
    ultimate.ui.CheckBox( p, "Fake duck", "Fake duck", false, true )
    ultimate.ui.CheckBox( p, "Mohammad exploit", "Air lag duck" )
    ultimate.ui.CheckBox( p, "Jesus exploit", "Jesus lag" )

    local p = ultimate.itemPanel( "Visualisation", 2,125 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Fake angle chams", "Anti aim chams", false, false, false, ultimate.spfuncs[36], false, function( p ) ultimate.ui.ColorPicker( "Real chams", p ) end ) 
    ultimate.ui.CheckBox( p, "Angle arrows", "Angle arrows" )
    ultimate.ui.CheckBox( p, "Hitbox", "Hitbox",false,false,true )
    ultimate.ui.CheckBox( p, "Indicators", "Indicators" )

    local p = ultimate.itemPanel( "Animation breaker", 2, 230 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Taunt spam", "Taunt spam" )
    ultimate.ui.ComboBox( p, "Taunt", "Taunt", ultimate.actCommands )
    ultimate.ui.CheckBox( p, "Handjob", "Handjob" )
    ultimate.ui.ComboBox( p, "Handjob mode", "Handjob mode", {"Up","Parkinson","Ultra cum"} )
    ultimate.ui.CheckBox( p, "Taunt 2", "Taunt 2" )
    ultimate.ui.ComboBox( p, "Taunt 2.1", "Taunt 2.1", ultimate.act2Commands )

    local p = ultimate.itemPanel( "Tickbase", 2, 265 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Enable shift", "Tickbase shift", false, true, false, false, function(b) ded.EnableTickbaseShifting(b) end )

    ultimate.ui.ComboBox( p, "Fakelag comp", "Fakelag comp", {"Disable","Compensate"} )
    ultimate.ui.CheckBox( p, "Warp on peek", "Warp on peek" )
    ultimate.ui.CheckBox( p, "Double tap", "Double tap" )
    //ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Passive recharge", "Passive recharge" )
    ultimate.ui.CheckBox( p, "Dodge projectiles", "Dodge projectiles" )
    //ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Wait for charge", "Wait for charge", false, false, false, false, function(b) ded.WaitForCharge(b) end ) 
    ultimate.ui.CheckBox( p, "Auto recharge", "Auto recharge", false, true ) 
    
    ultimate.ui.Slider( p, "Shift ticks", "Shift ticks", 1, 99, 0, function( val ) ded.SetMinShift(val) end )
    ultimate.ui.Slider( p, "Charge ticks", "Charge ticks", 1, 99, 0, function( val ) ded.SetMaxShift(val) end )

    local p = ultimate.itemPanel( "Sequence", 2, 175 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Sequence manip", "Sequence manip", false, true )
    ultimate.ui.Slider( p, "Out Sequence", "OutSequence", 1, 128, 0 )
    ultimate.ui.CheckBox( p, "Randomise", "Sequence min random" )
    ultimate.ui.Slider( p, "Min sequence", "Sequence min", 1, 128, 0 )
    ultimate.ui.CheckBox( p, "Animation freezer", "Animation freezer", false, true )

    local p = ultimate.itemPanel( "Player adjustments", 3, 160 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Interpolation", "Disable interpolation", false, false, false, false, function( bval ) ded.SetInterpolation( bval ) end )
    ultimate.ui.CheckBox( p, "Sequence interpolation", "Disable Sequence interpolation", false, false, false, false, function( bval ) ded.SetSequenceInterpolation( bval ) end )
    ultimate.ui.CheckBox( p, "Invalidate activity", "Invalidate activity" )
    ultimate.ui.CheckBox( p, "Fix bones", "Bone fix", false, false, false, false, function( bval ) ded.EnableBoneFix( bval ) end )
    ultimate.ui.CheckBox( p, "Fix animations", "Update Client Anim fix", false, false, false, false, function( bval ) ded.EnableAnimFix( bval ) end )
    ultimate.ui.CheckBox( p, "Extrapolation", "Extrapolation" )
    --ultimate.ui.CheckBox( p, "Lag fix" , "Lag fix", false, false, false, ultimate.spfuncs[254] )

    local p = ultimate.itemPanel( "Resolver", 3, 120 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Resolver", "Resolver" )
    ultimate.ui.CheckBox( p, "Pitch resolver", "Pitch resolver" )
    ultimate.ui.CheckBox( p, "Taunt resolver", "Taunt resolver" )
    --ultimate.ui.CheckBox( p, "Memory bullets", "Memory bullets" )    
    --ultimate.ui.Slider( p, "Resolver max misses", "Resolver max misses", 0, 10, 0 )
    --ultimate.ui.Slider( p, "add delta", "add delta", -180, 180, 0 )
    --ultimate.ui.Slider( p, "add pitch", "add pitch", -90, 90, 0 )

    local p = ultimate.itemPanel( "Position adjustment", 3, 215 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Adjust tickcount", "Adjust tickcount" )
    ultimate.ui.CheckBox( p, "Backtrack", "Backtrack" )
    ultimate.ui.ComboBox( p, "Backtrack mode", "Backtrack mode", { "Last ticks", "Closest", "Scan" } ) // , "Backshoot"
    ultimate.ui.Slider( p, "Sampling interval", "Sampling interval", 0, 200, 0 )
    ultimate.ui.Slider( p, "Backtrack time", "Backtrack time", 0, 1000, 0 )
    ultimate.ui.CheckBox( p, "Always backtrack", "Always backtrack" )

    local p = ultimate.itemPanel( "Misc", 3, 120 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Auto detonator", "Auto detonator" )
    ultimate.ui.Slider( p, "Detonation distance", "AutoD distance", 16, 128, 0 )
    

    ultimate.ui.CheckBox( p, "Gun switch", "Gun switch" )
   
end

ultimate.spfuncs[2] = function()
    ultimate.ui.SettingsPan:SetSize(250,100)
        
    ultimate.ui.SettingsPan:SetSize( 300, 350 )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Rapid fire", "Rapid fire", "Allows to quickly fire semi-automatic weapons." )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Bullet time", "Bullet time", "Aim will not work until weapon can fire." )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Wait for simulation", "Wait for simulation" )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Alt Rapid fire", "Alt Rapid fire" )
end

ultimate.spfuncs[4] = function()
    ultimate.ui.SettingsPan:SetSize( 250, 85 )

    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Smooth amount", "Smoothing", 0, 1, 2 )
end

ultimate.spfuncs[5] = function()
    ultimate.ui.SettingsPan:SetSize( 250, 68 )

    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Dynamic fov", "Fov dynamic" )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Aimbot FOV", "Aimbot FOV", 0, 180, 0 )
end

ultimate.spfuncs[11] = function()
    ultimate.ui.SettingsPan:SetSize(250,200)
    
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Team color", "Box team color" )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Gradient", "Box gradient" )
    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Style", "Box style", { "Default", "Corner", "Hex", "Poly", "3D" })


end

ultimate.spfuncs[12] = function()
    ultimate.ui.SettingsPan:SetSize(250,48)
    
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Health bar", "Health bar" )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Gradient", "Health bar gradient" )
end

ultimate.spfuncs[666] = function()
    ultimate.ui.SettingsPan:SetSize(250,48)
    
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Armor bar", "Armor bar" )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Gradient", "Armor bar gradient" )
end

ultimate.spfuncs[254] = function()
    ultimate.ui.SettingsPan:SetSize(250,200)
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Backshoot", "Backshoot" )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Fakelag comp new", "Fakelag comp new" )

end

ultimate.spfuncs[14] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)
    
    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Visible material", "Visible mat", ultimate.chamsMaterials)
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Weapon chams", "Visible chams w" )

    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Invisible material", "inVisible mat", ultimate.chamsMaterials)
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "inVisible chams", "inVisible chams" )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Weapon chams", "inVisible chams w" )

    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Fullbright", "Supress lighting" )
end

ultimate.spfuncs[229] = function()
    ultimate.ui.SettingsPan:SetSize(250,360)
    
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Brightness","Color Modify Brightness", 0, 3, 4 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Contrast","Color Modify Contrast", 0, 5, 4 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Saturation","Color Modify Saturation", 0, 5, 4 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Add red","Color Modify Add Red", 0, 10, 4 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Add green","Color Modify Add Green", 0, 10, 4 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Add blue","Color Modify Add Blue", 0, 10, 4 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Mul red","Color Modify Mul Red", 0, 255, 4 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Mul green","Color Modify Mul Green", 0, 255, 4 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Mul blue","Color Modify Mul Blue", 0, 255, 4 )
end

ultimate.spfuncs[15] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)

    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Material", "Self mat", ultimate.chamsMaterials)
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Weapon chams", "Self chams w" )

    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Fullbright", "Supress self lighting" )
end

ultimate.spfuncs[16] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)

    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Material", "Backtrack material", ultimate.chamsMaterials)

    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Fullbright", "Backtrack fullbright" )
end

ultimate.spfuncs[17] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)

    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Material", "Entity material", ultimate.chamsMaterials)

    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Fullbright", "Entity fullbright" )
end

ultimate.spfuncs[18] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)

    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Die time","Tracers die time",1,10,0 )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Bullet tracers muzzle", "Bullet tracers muzzle" )
    
end

ultimate.spfuncs[19] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)

    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Material", "Viewmodel chams type", ultimate.chamsMaterials)
    
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Fullbright", "Fullbright viewmodel" )
end

ultimate.spfuncs[20] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)

    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Smoothing", "Third person smoothing" )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Collision", "Third person collision" )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Distance","Third person distance",50,220,0 )
end

ultimate.spfuncs[21] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)

    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Freecam speed","Free camera speed",5,100,0 )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Ghetto mode", "Ghetto free cam" )
end

ultimate.spfuncs[31] = function()
    ultimate.ui.SettingsPan:SetSize(250,48)

    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Style", "Ent box style", { "Default", "Corner", "3D" })
end


ultimate.spfuncs[35] = function( p )
    local mdl = vgui.Create( "DModelPanel", p )
    mdl:SetPos(85,125)
    mdl:SetSize(85,125)
    mdl:SetModel( "models/props_vehicles/truck001a.mdl" ) 

    mdl:SetCamPos(Vector(0,0,148))

    function mdl:LayoutEntity( Entity ) return end 
    
    for i = 1,4 do
        local poses = ultimate.esppansposes

        ultimate.esppans[i].panel = vgui.Create( "UPaintedPanel", p )
        ultimate.esppans[i].panel:SetPos(poses[i].x,poses[i].y)
        ultimate.esppans[i].panel:SetSize(85,125)
        ultimate.esppans[i].panel:Receiver( "SwagCock$", ultimate.DoDrop )
        ultimate.esppans[i].panel.pos = i
    end

    for i = 1, #ultimate.espelements do
        local cfgstr = ultimate.espelements[i]
        local panel = ultimate.esppans[ultimate.cfg.vars[cfgstr]].panel

        local b = vgui.Create("UESPPButton")
        b:SetText( cfgstr )
		b:SetSize( 36, 24 )
		b:Dock( TOP )
        b:Droppable( "SwagCock$" ) 

        b:SetParent( panel )
    end
end

ultimate.spfuncs[33] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)

    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Show ammo", "Show ammo" )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Print name", "Weapon printname" )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Show reloading", "Show reloading" )
    
end

ultimate.spfuncs[34] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)


end

function ultimate.tabs.Visuals()

    local p = ultimate.itemPanel("Player",1,440):GetItemPanel()

    ultimate.ui.CheckBox( p, "Box", "Box esp", false, false, true, ultimate.spfuncs[11] )

    ultimate.ui.CheckBox( p, "Name", "Name", false, false, false, false, false, function(p) local lbl, drop = ultimate.ui.ComboBox( p, "", "Name pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    ultimate.ui.CheckBox( p, "Mark", "Mark", false, false, false, false, false, function(p) local lbl, drop = ultimate.ui.ComboBox( p, "", "Mark pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    ultimate.ui.CheckBox( p, "Usergroup", "Usergroup", false, false, false, false, false, function(p) local lbl, drop = ultimate.ui.ComboBox( p, "", "Usergroup pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    ultimate.ui.CheckBox( p, "Health", "Health", false, false, true, ultimate.spfuncs[12], false, function(p) local lbl, drop = ultimate.ui.ComboBox( p, "", "Health pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(3,0,0,0) ultimate.ui.ColorPicker( "Health bar gradient", p ) end )
    ultimate.ui.CheckBox( p, "Armor", "Armor", false, false, true, ultimate.spfuncs[666], false, function(p) local lbl, drop = ultimate.ui.ComboBox( p, "", "Armor pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(3,0,0,0) ultimate.ui.ColorPicker( "Armor bar gradient", p ) end )
    ultimate.ui.CheckBox( p, "Weapon", "Weapon", false, false, false, ultimate.spfuncs[33], false, function(p) local lbl, drop = ultimate.ui.ComboBox( p, "", "Weapon pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(3,0,0,0) end )
    ultimate.ui.CheckBox( p, "Team", "Team", false, false, false, false, false, function(p) local lbl, drop = ultimate.ui.ComboBox( p, "", "Team pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    ultimate.ui.CheckBox( p, "Money", "DarkRP Money", false, false, false, false, false, function(p) local lbl, drop = ultimate.ui.ComboBox( p, "", "Money pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    ultimate.ui.CheckBox( p, "Lag compensation", "Break LC", false, false, false, false, false, function(p) local lbl, drop = ultimate.ui.ComboBox( p, "", "Break LC pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    ultimate.ui.CheckBox( p, "Packets ( Fake lag )", "Simtime updated", false, false, false, false, false, function(p) local lbl, drop = ultimate.ui.ComboBox( p, "", "Simtime pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    ultimate.ui.CheckBox( p, "Show records", "Show records" )
    ultimate.ui.CheckBox( p, "Skeleton", "Skeleton" )
    ultimate.ui.CheckBox( p, "Sight lines", "Sight lines" )
    ultimate.ui.CheckBox( p, "Player Hat", "Player Hat","Detect Screengrab" )
    ultimate.ui.CheckBox( p, "OOF Arrows", "OOF Arrows", false, false, false, false, false, function(p)
        local lbl, drop = ultimate.ui.ComboBox( p, "", "OOF Style", {"Arrow","UkroSwastika"} ) 
        lbl:Remove() 
        drop:Dock(RIGHT) 
        drop:DockMargin(0,0,0,0) 
    end )
    // ultimate.ui.CheckBox( p, "OOF Arrows", "OOF Arrows", false, false, false, ultimate.spfuncs[34], false, function(p) local lbl, drop = ultimate.ui.ComboBox( p, "", "OOF Style", {"Arrow","UkroSwastika"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )

    ultimate.ui.Slider( p, "Max distance","ESP Distance", 0, 20000,0 )

    ultimate.ui.Label( p, "Add player key", function( p ) ultimate.ui.Binder( "Player add", p ) end )

    local p = ultimate.itemPanel("Entity",1,135):GetItemPanel()

    ultimate.ui.CheckBox( p, "Box", "Ent box", false, false, false, ultimate.spfuncs[31] )
    ultimate.ui.CheckBox( p, "Class", "Ent class" )
    ultimate.ui.Slider( p, "Max distance","Ent ESP Distance",0, 20000,0 )
    ultimate.ui.Label( p, "Add entity key", function( p ) ultimate.ui.Binder( "Ent add", p ) end )

    local p = ultimate.itemPanel( "Misc", 1, 190 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Hide name", "Hide name" )
    ultimate.ui.TextEntry( "Custom name", "Custom name", p, 999 )
    ultimate.ui.CheckBox( p, "Disable sensivity adjustment", "Disable sensivity adjustment" )
    ultimate.ui.CheckBox( p, "Screengrab image", "Screengrab image" )
    ultimate.ui.ComboBox( p, "ESP Font", "ESP Font", { "Outlined", "Shadow" } )
    
    local p = ultimate.itemPanel("Colored models",2,150):GetItemPanel()

    ultimate.ui.CheckBox( p, "Player chams", "Visible chams", false, false, true, ultimate.spfuncs[14], false, function(p) ultimate.ui.ColorPicker( "inVisible chams", p ) end )
    ultimate.ui.CheckBox( p, "Self chams", "Self chams", false, false, true, ultimate.spfuncs[15] )
    ultimate.ui.CheckBox( p, "Backtrack chams", "Backtrack chams", false, false, true, ultimate.spfuncs[16] )
    ultimate.ui.CheckBox( p, "Entity chams", "Entity chams", false, false, true, ultimate.spfuncs[17], false )
    ultimate.ui.CheckBox( p, "Viewmodel chams", "Viewmodel chams", false, false, true, ultimate.spfuncs[19], false )

    local p = ultimate.itemPanel("Material customisation",2,150):GetItemPanel()

    ultimate.ui.Slider( p, "Min illumination", "Fresnel minimum illum", 0, 1, 1, function( v )
        local v1, v2, v3, v4 = ultimate.chamMats.vis[3], ultimate.chamMats.vis[4], ultimate.chamMats.invis[3], ultimate.chamMats.invis[3]

        v1:SetVector( "$selfIllumFresnelMinMaxExp", Vector( v, ultimate.cfg.vars["Fresnel maximum illum"], ultimate.cfg.vars["Fresnel exponent"] ) )
        v2:SetVector( "$selfIllumFresnelMinMaxExp", Vector( v, ultimate.cfg.vars["Fresnel maximum illum"], ultimate.cfg.vars["Fresnel exponent"] ) )
        v3:SetVector( "$selfIllumFresnelMinMaxExp", Vector( v, ultimate.cfg.vars["Fresnel maximum illum"], ultimate.cfg.vars["Fresnel exponent"] ) )
        v4:SetVector( "$selfIllumFresnelMinMaxExp", Vector( v, ultimate.cfg.vars["Fresnel maximum illum"], ultimate.cfg.vars["Fresnel exponent"] ) )
    end )
    
    ultimate.ui.Slider( p, "Max illumination", "Fresnel maximum illum", 0, 1, 1, function( v )
        local v1, v2, v3, v4 = ultimate.chamMats.vis[3], ultimate.chamMats.vis[4], ultimate.chamMats.invis[3], ultimate.chamMats.invis[3]

        v1:SetVector( "$selfIllumFresnelMinMaxExp", Vector( ultimate.cfg.vars["Fresnel minimum illum"], v, ultimate.cfg.vars["Fresnel exponent"] ) )
        v2:SetVector( "$selfIllumFresnelMinMaxExp", Vector( ultimate.cfg.vars["Fresnel minimum illum"], v, ultimate.cfg.vars["Fresnel exponent"] ) )
        v3:SetVector( "$selfIllumFresnelMinMaxExp", Vector( ultimate.cfg.vars["Fresnel minimum illum"], v, ultimate.cfg.vars["Fresnel exponent"] ) )
        v4:SetVector( "$selfIllumFresnelMinMaxExp", Vector( ultimate.cfg.vars["Fresnel minimum illum"], v, ultimate.cfg.vars["Fresnel exponent"] ) )
    end )
 
    ultimate.ui.Slider( p, "Fresnel exponent", "Fresnel exponent", 0, 1, 1, function( v )
        local v1, v2, v3, v4 = ultimate.chamMats.vis[3], ultimate.chamMats.vis[4], ultimate.chamMats.invis[3], ultimate.chamMats.invis[3]

        v1:SetVector( "$selfIllumFresnelMinMaxExp", Vector( ultimate.cfg.vars["Fresnel minimum illum"], ultimate.cfg.vars["Fresnel maximum illum"], v ) )
        v2:SetVector( "$selfIllumFresnelMinMaxExp", Vector( ultimate.cfg.vars["Fresnel minimum illum"], ultimate.cfg.vars["Fresnel maximum illum"], v ) )
        v3:SetVector( "$selfIllumFresnelMinMaxExp", Vector( ultimate.cfg.vars["Fresnel minimum illum"], ultimate.cfg.vars["Fresnel maximum illum"], v ) )
        v4:SetVector( "$selfIllumFresnelMinMaxExp", Vector( ultimate.cfg.vars["Fresnel minimum illum"], ultimate.cfg.vars["Fresnel maximum illum"], v ) )
    end )

    local p = ultimate.itemPanel("Outlines",2,115):GetItemPanel()

    ultimate.ui.CheckBox( p, "Player outline", "Player outline", false, false, true )
    ultimate.ui.CheckBox( p, "Entity outline", "Entity outline", false, false, true )
    ultimate.ui.ComboBox( p, "Style", "Outline style", { "Default", "Subtractive", "Additive" } )

    local p = ultimate.itemPanel( "Indicators", 2, 160 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Hitmarker", "Hitmarker", false, false, true )
    ultimate.ui.CheckBox( p, "Hitnumbers", "Hitnumbers", false, false, true, false, false, function(p) ultimate.ui.ColorPicker( "Hitnumbers krit", p ) end )
    //ultimate.ui.CheckBox( p, "Hit particles", "Hit particles", false, false, true, ultimate.spfuncs[31] )
    ultimate.ui.CheckBox( p, "On screen logs", "On screen logs", false, false, true, false, false, function(p) ultimate.ui.ColorPicker( "Miss lagcomp", p ) ultimate.ui.ColorPicker( "Miss spread", p ) ultimate.ui.ColorPicker( "Miss fail", p ) end )
    ultimate.ui.CheckBox( p, "WaterMark", "WaterMark")
    ultimate.ui.CheckBox( p, "Spectator list", "Spectator list" )
    ultimate.ui.CheckBox( p, "Tickbase", "Tickbase indicator" )

    local p = ultimate.itemPanel("World",3,400):GetItemPanel()

    ultimate.ui.TextEntry( "Skybox texture", "Custom sky", p, 420 )
    ultimate.ui.CheckBox( p, "Sky color", "Sky color", false, false, true )
    ultimate.ui.CheckBox( p, "Wall color", "Wall color", false, false, true )

    ultimate.ui.CheckBox( p, "Fullbright", "Fullbright", false, true )
    ultimate.ui.ComboBox( p, "Mode", "Fullbright mode", { "Default", "Corvus extreme" } )
    ultimate.ui.CheckBox( p, "Disable shadows", "Disable shadows" )

    ultimate.ui.CheckBox( p, "Fog changer", "FogChanger", false, false, true )
    ultimate.ui.Slider( p, "Fog start","FogStart", 1, 4200, 0 )
    ultimate.ui.Slider( p, "Fog end","FogEnd", 1, 9000, 0 )

    ultimate.ui.CheckBox( p, "Color modify", "Color Modify", false, false, false, ultimate.spfuncs[229] )

    ultimate.ui.CheckBox( p, "Bullet tracers", "Bullet tracers", false, false, true, ultimate.spfuncs[18] )
    ultimate.ui.TextEntry( "Material", "Bullet tracers material", p, 420 )


    local p = ultimate.itemPanel("View",3,215):GetItemPanel()

    ultimate.ui.CheckBox( p, "Override view", "Override view" )

    ultimate.ui.CheckBox( p, "Third person", "Third person", false, true, false, ultimate.spfuncs[20] )
    ultimate.ui.CheckBox( p, "Free camera", "Free camera", false, true, false, ultimate.spfuncs[21] )

    ultimate.ui.Slider( p, "Fov override","Fov override",75,160,0 )
    ultimate.ui.Slider( p, "Viewmodel fov","Viewmodel fov",50,180,0 )
    ultimate.ui.Slider( p, "Aspect ratio","Aspect ratio",0,2,3,function(val) RunConsoleCommand("r_aspectratio",val) end )


    local p = ultimate.itemPanel("model changer",3,100):GetItemPanel()

    ultimate.ui.CheckBox( p, "ModelChanger player", "Modelchanger" )
    ultimate.ui.ComboBox( p, "ModelChanger model", "Modelchanger model", {"astolfo","protogen","walter","rusk", "niko", "george droyd", "wooman", "mark", "furry", "boykisser", "adidas combine"} )
    //ultimate.ui.CheckBox( p, "ModelChanger me", "Player_modelchanger") 
    //ultimate.ui.ComboBox( p, "ModelChanger model", "Player_modelchanger_agent", {"charple","male_03","Gman","zombie"} )   
    

   



    





    

    





    
    /*





    ultimate.checkbox("Kill sound","Killsound",p:GetItemPanel())
    

    local p = ultimate.itemPanel("World",2,123)

    

    local p = ultimate.itemPanel("Effects",2,142)


    
    

    local p = ultimate.itemPanel("View",3,275)




    // ultimate.ESPPP:Show()
*/
end

ultimate.spfuncs[25] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)

    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Strafe mode", "Strafe mode", {"Legit","Rage","Multidir"})
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Ground strafer", "Ground strafer" )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Sin ( snake ) strafe", "Z Hop", false, true )
end

ultimate.spfuncs[26] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)

    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Predict ticks", "CStrafe ticks", 16, 128, 0 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Angle step", "CStrafe angle step", 1, 10, 0 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Angle max step", "CStrafe angle max step", 5, 50, 0 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Ground diff", "CStrafe ground diff", 1, 65, 0 )
end

ultimate.spfuncs[27] = function( p )
    ultimate.ui.TextEntry( "Name", "Name Convar", p, 250 )
    ultimate.ui.Button( "Change name", function() ded.NetSetConVar("name",ultimate.cfg.vars["Name Convar"]) end, p )
    ultimate.ui.CheckBox( p, "Name stealer", "Name stealer" )

    ultimate.ui.TextEntry( "Disconnect reason", "Disconnect reason", p, 250 )
    ultimate.ui.Button( "Disconnect", function() ded.NetDisconnect(ultimate.cfg.vars["Disconnect reason"]) end, p )
end 

function ultimate.CustomCvarVal( net )
    local m = net == 1 and "Net Convar mode" or "Cvar mode"
    local n = net == 1 and "Net Convar int" or "Cvar int"
    local s = net == 1 and "Net Convar str" or "Cvar str"

    local mode = ultimate.cfg.vars[m] 
    local num = ultimate.cfg.vars[n]
    local set = mode == 2 and math.Round( num ) or num

    if mode == 1 then set = ultimate.cfg.vars[s] end

    return set
end

ultimate.spfuncs[28] = function( p )
    ultimate.ui.TextEntry( "Cvar name", "Net Convar", p, 250 )
    ultimate.ui.Slider( p, "Cvar int", "Net Convar int", 1, 100, 2 )
    ultimate.ui.TextEntry( "Cvar str", "Net Convar str", p, 250 )

    ultimate.ui.ComboBox( p, "Set mode", "Net Convar mode", {"String","Int","Float"})

    ultimate.ui.Button( "Send new val", function() ded.NetSetConVar( ultimate.cfg.vars["Net Convar"] ,ultimate.CustomCvarVal( 1 ) ) end, p )
end 

ultimate.FCVAR = {
    str = {
        "Archive", "Archive XBOX", "Cheat", "Client can execute", "Client DLL", "Demo", "Dont record",
        "Game DLL", "Lua client", "Lua server", "Never as string", "None", "Notify", "Not connected",
        "Printable only", "Protected", "Replicated", "Server cannot query", "Server can execute",
        "Sponly", "Unlogged", "Unregistered", "Userinfo"
    },
    int = {
        128, 16777216, 16384, 1073741824, 8, 65536, 131072, 4, 262144, 524288, 4096, 0, 256, 4194304,
        1024, 32, 8192, 536870912, 268435456, 64, 2048, 1, 512
    }
}

ultimate.spfuncs[29] = function( p )
    ultimate.ui.TextEntry( "Enter cvar name", "Cvar name", p, 500 )
    ultimate.ui.Slider( p, "Custom number", "Cvar int", 1, 1000, 2 )
    ultimate.ui.TextEntry( "Custom string", "Cvar str", p, 500 )

    ultimate.ui.ComboBox( p, "Cvar mode", "Cvar mode", {"String","Int","Float"})
    
    ultimate.ui.Button( "Change cvar", function()
        local s = ultimate.CustomCvarVal( 0 )
        local n = ultimate.cfg.vars["Cvar name"]
        
        local flag = GetConVar(n):GetFlags()

        ded.ConVarSetFlags( n, 0 )

        RunConsoleCommand( n, s )

        ded.ConVarSetFlags( n, flag )
    end, p )

    ultimate.ui.ComboBox( p, "Cvar flag", "Cvar flag", ultimate.FCVAR.str)

    ultimate.ui.Button( "Change flag", function()
        ded.ConVarSetFlags( ultimate.cfg.vars["Cvar name"], ultimate.FCVAR.int[ ultimate.cfg.vars["Cvar flag"] ] )
        print( ultimate.cfg.vars["Cvar name"], ultimate.FCVAR.int[ ultimate.cfg.vars["Cvar flag"] ] )
    end, p )

end 

function ultimate.tabs.Misc()

    local function func( p )
        ultimate.ui.MTButton( p, "Cvar", ultimate.spfuncs[29] )
        ultimate.ui.MTButton( p, "Net cvar", ultimate.spfuncs[28] )
        ultimate.ui.MTButton( p, "Net", ultimate.spfuncs[27] )
    end

    local p = ultimate.itemPanel("Movement",1,205):GetItemPanel()

    ultimate.ui.CheckBox( p, "Bunny hop", "Bhop" )
    ultimate.ui.CheckBox( p, "Air strafer", "Air strafer", false, false, false, ultimate.spfuncs[25] )
    ultimate.ui.CheckBox( p, "Circle strafe", "Circle strafe", false, true, false, ultimate.spfuncs[26] )
    ultimate.ui.CheckBox( p, "Keep sprint", "Sprint" )
    ultimate.ui.CheckBox( p, "Fast stop", "Fast stop" )
    ultimate.ui.CheckBox( p, "Auto peak", "Auto peak", false, true )
    ultimate.ui.CheckBox( p, "Auto teleport back", "Auto peak tp" )
    ultimate.ui.CheckBox( p, "Water walk", "Water jump" )

    local p = ultimate.itemPanel("Key spam",1,165):GetItemPanel()

    ultimate.ui.CheckBox( p, "Use spam", "Use spam" )
    ultimate.ui.CheckBox( p, "Flashlight spam", "Flashlight spam" )
    ultimate.ui.CheckBox( p, "Auto GTA", "Auto GTA" )
    ultimate.ui.CheckBox( p, "Camera spam", "Camera spam" )
    ultimate.ui.CheckBox( p, "Vape spam", "Vape spam" )
    ultimate.ui.CheckBox( p, "Retry on handcuff", "Retry on handcuff" )

    local p = ultimate.itemPanel( "Sounds", 2, 200 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Hitsound", "Hitsound" )
    ultimate.ui.TextEntry( "Sound path", "Hitsound str", p, 420 )
    ultimate.ui.CheckBox( p, "Killsound", "Killsound" )
    ultimate.ui.CheckBox( p, "Killstreak", "Killstreak" )
    ultimate.ui.TextEntry( "Sound path", "Killsound str", p, 420 )

    local p = ultimate.itemPanel("Chat",2,282):GetItemPanel()

    ultimate.ui.CheckBox( p, "Spammer", "Chat spammer" )
    ultimate.ui.ComboBox( p, "Mode", "Chat mode", { "хвх деды", "кадилак", "cute femboy", "хвх", "pm", "ad cheat", "pm cheat", "hvh ad", "pm hvh" })
    ultimate.ui.ComboBox( p, "Group", "Chat group", { "Default", "OOC", "Advert", "PM", "ULX" })
    ultimate.ui.Slider( p, "Delay", "Chat delay", 0,20,0 )
    
    ultimate.ui.CheckBox( p, "Killsay", "Killsay" )
    ultimate.ui.ComboBox( p, "Mode", "Killsay mode", { "хвх деды", "кадилак", "cute femboy", "хвх", "pm", "ad cheat", "pm cheat", "hvh ad", "pm hvh" })
    ultimate.ui.ComboBox( p, "Group", "Killsay group", { "Default", "OOC", "Advert", "PM", "ULX" })

    ultimate.itemPanelB( "Net / Cvar", 3, 310, func )

    local p = ultimate.itemPanel("Memes",3,150):GetItemPanel()

    ultimate.ui.CheckBox( p, "Follow Player", "Ghost follower" )
    ultimate.ui.TextEntry( "Steam ID", "GFID", p, 500 )
    ultimate.ui.CheckBox( p, "Auto Затяг ( Vape )", "Auto Vape" )
    ultimate.ui.CheckBox( p, "Fast lockpick", "Fast lockpick" )

   /*
        ultimate.checkbox("Safe hop","Safe hop",p:GetItemPanel())
        ultimate.checkbox("Edge jump","Edge jump",p:GetItemPanel())
        ultimate.checkbox("Air duck","Air duck",p:GetItemPanel())
    */
end

/*
function ultimate.updateMenuColor( col )
    local r, g, b = col.r, col.g, col.b 

    for i = 1,255 do 
        ultimate.Colors[i] = Color( i + r, i + g, i + b, 255 )
    end
end
*/



function ultimate.tabs.Config()
    local p = ultimate.itemPanel("Settings",1,270):GetItemPanel()

    ultimate.ui.ComboBox( p, "Choice", "Selected config", ultimate.cfgTable)

    ultimate.ui.Button( "Load", function() ultimate.LoadConfig() end, p )
    ultimate.ui.Button( "Save", function() ultimate.SaveConfig() end, p )
    ultimate.ui.Button( "Delete", function() ultimate.DeleteConfig() end, p )

    ultimate.ui.TextEntry( "Name", "Config name", p, 64 )
    ultimate.ui.Button( "Create", function() ultimate.CreateConfig() end, p )

    ultimate.ui.Label( p, "Menu color", function( p ) ultimate.ui.ColorPicker( "Menu color", p, ultimate.updateMenuColor ) end )
end

function ultimate.tabs.Players()
    local playerlist = player.GetAll()

    -- Добавляем всех trackedPlayers, которые уже на сервере, в priorityList
    for _, pEntity in ipairs(playerlist) do
        local sid = pEntity:SteamID()
        if ultimate.trackedPlayers[sid] then
            ultimate.cfg.priorityList[sid] = true
        end
    end

    for i = 1, #playerlist do
        local pEntity = playerlist[i]
        local pButton = vgui.Create("Panel", ultimate.scrollpanel)
        pButton:SetTall(25)
        pButton:Dock(TOP)

        function pButton:Paint(w, h)
            if not IsValid(pEntity) then self:Remove() return end
            local steamId = pEntity:SteamID()
            
            -- Проверяем, есть ли игрок в базе данных или приоритетном списке
            local isInDatabase = ultimate.trackedPlayers and ultimate.trackedPlayers[steamId]
            local isPriority = ultimate.cfg.priorityList and ultimate.cfg.priorityList[steamId]
            local isFriend = ultimate.cfg.friends and ultimate.cfg.friends[steamId]
            
            -- Фон для приоритетных игроков или из базы данных
            if isInDatabase or isPriority then
                surface.SetDrawColor(50, 0, 0, 100) -- темно-красный фон
                surface.DrawRect(0, 0, w, h)
            end
            
            surface.SetFont("DermaSmall")
            
            -- Определяем цвет ника
            local nameColor = Color(255, 255, 255) -- белый по умолчанию
            if isInDatabase or isPriority then
                nameColor = Color(255, 50, 50) -- ярко-красный для приоритетных игроков
            elseif isFriend then
                nameColor = Color(0, 255, 0) -- зеленый для друзей
            end
            
            -- Рисуем индикатор слева для игроков из базы
            local nameStartX = 10
            if isInDatabase then
                surface.SetTextColor(255, 200, 0)
                surface.SetTextPos(2, 5)
                surface.DrawText("⚠") -- предупреждающий знак
                nameStartX = 15
            end
            
            -- Рисуем ник
            surface.SetTextColor(nameColor.r, nameColor.g, nameColor.b)
            surface.SetTextPos(nameStartX, 5)
            surface.DrawText(pEntity:Name())
            
            -- Добавляем индикаторы справа от ника
            local nameWidth = surface.GetTextSize(pEntity:Name())
            local indicatorX = nameStartX + nameWidth + 5
            
            -- Индикатор базы данных
            if isInDatabase then
                surface.SetTextColor(255, 0, 0)
                surface.SetTextPos(indicatorX, 5)
                surface.DrawText("[Cheat]")
                indicatorX = indicatorX + surface.GetTextSize("[Cheat]") + 3
            end
            
            -- Индикатор приоритета
            if isPriority and not isInDatabase then
                surface.SetTextColor(255, 100, 0)
                surface.SetTextPos(indicatorX, 5)
                surface.DrawText("[Piority]")
                indicatorX = indicatorX + surface.GetTextSize("[Piority]") + 3
            end
            
            -- Индикатор друга
            if isFriend then
                surface.SetTextColor(0, 255, 0)
                surface.SetTextPos(indicatorX, 5)
                surface.DrawText("[Friend]")
            end
            
            -- Команда/группа (по центру)
            local teamIndex, teamName, teamColor = ultimate.GetTeam(pEntity)
            local textWidth, textHeight = surface.GetTextSize(teamName)
            surface.SetTextColor(teamColor)
            surface.SetTextPos(w / 2 - textWidth / 2, 5)
            surface.DrawText(teamName)
            
            -- Пользовательская группа (справа)
            local userGroup = ultimate.GetUserGroup(pEntity)
            local textWidth, textHeight = surface.GetTextSize(userGroup)
            surface.SetTextColor(255, 255, 255)
            surface.SetTextPos(w - textWidth - 5, 5)
            surface.DrawText(userGroup)
            
            -- Разделительная линия
            surface.SetDrawColor(45, 45, 45)
            surface.DrawRect(0, h - 1, w, 1)
        end

        function pButton:OnMousePressed(mouseCode)
            if not IsValid(pEntity) then self:Remove() return end

            local steamId = pEntity:SteamID()

            if mouseCode == MOUSE_LEFT then
                -- ЛКМ - управление друзьями
                ultimate.cfg.friends[steamId] = not ultimate.cfg.friends[steamId]
            elseif mouseCode == MOUSE_RIGHT then
                -- ПКМ - управление приоритетным списком
                ultimate.cfg.priorityList[steamId] = not ultimate.cfg.priorityList[steamId]
            end
        end
    end
end


function ultimate.tabs.Entities()
    local entitylist = ents.GetAll()
    local classes = {}

    for i = 1, #entitylist do
        local pEntity = entitylist[ i ]

        local class = pEntity:GetClass()
        
        if class == "player" then continue end

        if not classes[class] then
            classes[class] = true
        else
            continue
        end

        local pButton = vgui.Create( "Panel", ultimate.scrollpanel )
        pButton:SetTall( 25 )
        pButton:Dock( TOP )

        function pButton:Paint( w, h )
            if not IsValid(pEntity) then self:Remove() return end

            local class = pEntity:GetClass()

            surface.SetFont( "DermaSmall" )

            if ( ultimate.cfg.ents[ class ] ) then
                surface.SetTextColor( 0, 255, 0 )
            else
                surface.SetTextColor( 255, 255, 255 )
            end

            surface.SetTextPos( 10, 5 )
            surface.DrawText( class )

            surface.SetDrawColor( 45, 45, 45 )
            surface.DrawRect( 0, h - 1, w, 1 )
        end

        function pButton:OnMousePressed( mouseCode )
            if not IsValid(pEntity) then self:Remove() return end

            if ( mouseCode == MOUSE_LEFT ) then
                local class = pEntity:GetClass()

                if not ultimate.cfg.ents[ class ] then
                    ultimate.cfg.ents[ class ] = true
                else
                    ultimate.cfg.ents[ class ] = nil
                end
            end
        end
    end
end

function ultimate.tabs.resolver()

local p = ultimate.itemPanel("resolver",1,185):GetItemPanel()


end

ultimate.ttable = {}

ultimate.ttable["Aimbot"]   = ultimate.tabs.Aimbot
ultimate.ttable["Rage"]     = ultimate.tabs.Rage
ultimate.ttable["Visuals"]  = ultimate.tabs.Visuals
ultimate.ttable["Misc"]     = ultimate.tabs.Misc
ultimate.ttable["Config"] = ultimate.tabs.Config
ultimate.ttable["Players"]  = ultimate.tabs.Players
ultimate.ttable["Entities"]  = ultimate.tabs.Entities
--ultimate.ttable["resolver"]  = ultimate.tabs.resolver

function ultimate.initTab(tab)
    if ultimate.scrollpanel != nil then ultimate.scrollpanel:Remove() end

    ultimate.scrollpanel = vgui.Create("UScroll",ultimate.frame)

    ultimate.pty = { 5, 5, 5 }
    // ultimate.ESPPP:Hide()
    ultimate.ttable[tostring(tab)]()
end

function ultimate.tabButton(tab,par) 
    surface.SetFont("DermaSmall")
    local w, h = surface.GetTextSize(tab)

    local fw = w + 35

    local tx, ty = fw/2 - w/2, 25/2-h/2 - 1

    local b = par:Add("DButton")
    b:Dock(LEFT)
    b:DockMargin(2,0,2,1)
    b:SetWide(fw)
    b:SetText("")
    
    function b:DoClick()
        ultimate.activetab = tab
        ultimate.initTab(tab)
    end

    function b:Paint(width,height)
        if ultimate.activetab == tab or self:OnDepressed() then
            surface.SetDrawColor(ultimate.Colors[54])
            surface.SetTextColor(245,245,245,255)
        elseif self:IsHovered() then
            surface.SetDrawColor(ultimate.Colors[40])
            surface.SetTextColor(225,225,225,255)
        else
            surface.SetDrawColor(ultimate.Colors[30])
            surface.SetTextColor(200,200,200,255)
        end
        
        surface.DrawRect(0,0,width,height)

        surface.SetFont("DermaSmall")
        surface.SetTextPos(tx,ty)
        surface.DrawText(tab)
    end
end

ultimate.tabButton( "Aimbot",        ultimate.frame:GetTopPanel() ) 
ultimate.tabButton( "Rage",          ultimate.frame:GetTopPanel() ) 
ultimate.tabButton( "Visuals",       ultimate.frame:GetTopPanel() ) 
ultimate.tabButton( "Misc",          ultimate.frame:GetTopPanel() ) 
ultimate.tabButton( "Config",        ultimate.frame:GetTopPanel() ) 
ultimate.tabButton( "Players",       ultimate.frame:GetTopPanel() ) 
ultimate.tabButton( "Entities",       ultimate.frame:GetTopPanel() ) 
--ultimate.tabButton( "resolver",       ultimate.frame:GetTopPanel() ) 
                    
ultimate.ttable["Aimbot"]()

// Input 

function ultimate.IsKeyDown( key )
    if key >= 107 then
        return input.IsMouseDown( key )
    end

    return input.IsKeyDown( key )
end

/*
    Create Move start
*/

// cm stuff

ultimate.target             = false  
ultimate.aimingrn           = false 

ultimate.targetVector       = Vector()
ultimate.predictedVector    = Vector()
ultimate.backtrackVector    = Vector()
ultimate.nullVec            = Vector() * -1

ultimate.SilentAngle        = pLocalPlayer:EyeAngles()

ultimate.SkipCommand        = false
ultimate.SendPacket         = true

ultimate.traceStruct        = { mask = MASK_SHOT, filter = pLocalPlayer }
ultimate.badSweps           = { ["gmod_camera"] = true, ["manhack_welder"] = true, ["weapon_medkit"] = true, ["gmod_tool"] = true, ["weapon_physgun"] = true, ["weapon_physcannon"] = true, ["weapon_bugbait"] = true, }
ultimate.badSeqs            = { [ACT_VM_RELOAD] = true, [ACT_VM_RELOAD_SILENCED] = true, [ACT_VM_RELOAD_DEPLOYED] = true, [ACT_VM_RELOAD_IDLE] = true, [ACT_VM_RELOAD_EMPTY] = true, [ACT_VM_RELOADEMPTY] = true, [ACT_VM_RELOAD_M203] = true, [ACT_VM_RELOAD_INSERT] = true, [ACT_VM_RELOAD_INSERT_PULL] = true, [ACT_VM_RELOAD_END] = true, [ACT_VM_RELOAD_END_EMPTY] = true, [ACT_VM_RELOAD_INSERT_EMPTY] = true, [ACT_VM_RELOAD2] = true }
ultimate.cones              = {}
ultimate.parsedbones        = {}

ultimate.swbNormal          = bit.bor(CONTENTS_SOLID, CONTENTS_OPAQUE, CONTENTS_MOVEABLE, CONTENTS_DEBRIS, CONTENTS_MONSTER, CONTENTS_HITBOX, 402653442, CONTENTS_WATER)
ultimate.swbWall            = bit.bor(CONTENTS_TESTFOGVOLUME, CONTENTS_EMPTY, CONTENTS_MONSTER, CONTENTS_HITBOX)
ultimate.swbPen             = {[MAT_SAND] = 0.5, [MAT_DIRT] = 0.8, [MAT_METAL] = 1.1, [MAT_TILE] = 0.9, [MAT_WOOD] = 1.2}
ultimate.swbShit            = { ["swb_knife"] = true, ["swb_knife_m"] = true }

ultimate.m9kPenetration     = { ["SniperPenetratedRound"] = 20, ["pistol"] = 9, ["357"] = 12, ["smg1"] = 14, ["ar2"] = 16, ["buckshot"] = 5, ["slam"] = 5, ["AirboatGun"] = 17, }
ultimate.m9kMaxRicochet     = { ["SniperPenetratedRound"] = 10, ["pistol"] = 2, ["357"] = 5, ["smg1"] = 4, ["ar2"] = 5, ["buckshot"] = 0, ["slam"] = 0, ["AirboatGun"] = 9, }
ultimate.m9kCanRicochet     = { ["SniperPenetratedRound"] = true, ["pistol"] = true, ["buckshot"] = true, ["slam"] = true }
ultimate.m9kPenMaterial     = { [MAT_GLASS] = true, [MAT_PLASTIC] = true, [MAT_WOOD] = true, [MAT_FLESH] = true, [MAT_ALIENFLESH] = true }

ultimate.activeWeapon       = false 
ultimate.activeWeaponClass  = false 
ultimate.moveType           = pLocalPlayer:GetMoveType() 

ultimate.backtracktick      = 0

function ultimate.AutoWall( dir, plyTarget )
	if not ultimate.activeWeapon or ultimate.swbShit[ ultimate.activeWeaponClass ] then return false end 

	local eyePos = pLocalPlayer:EyePos()
	
	local function SWBAutowall()

        ultimate.traceStruct.start = eyePos
        ultimate.traceStruct.endpos = eyePos + dir * ultimate.activeWeapon.PenetrativeRange
        ultimate.traceStruct.filter = pLocalPlayer
        ultimate.traceStruct.mask = ultimate.swbNormal

		local tr = TraceLine( ultimate.traceStruct )
		
		if tr.Hit and !tr.HitSky then
			local dot = -dir:Dot(tr.HitNormal)
			
			if ultimate.activeWeapon.CanPenetrate and dot > 0.26 then

                ultimate.traceStruct.start = tr.HitPos
                ultimate.traceStruct.endpos = tr.HitPos + dir * ultimate.activeWeapon.PenStr * ( ultimate.swbPen[tr.MatType] or 1 ) * ultimate.activeWeapon.PenMod
                ultimate.traceStruct.filter = pLocalPlayer
                ultimate.traceStruct.mask = ultimate.swbWall

				tr = TraceLine( ultimate.traceStruct )

                ultimate.traceStruct.start = tr.HitPos
                ultimate.traceStruct.endpos = tr.HitPos + dir * 0.1
                ultimate.traceStruct.filter = pLocalPlayer
                ultimate.traceStruct.mask = ultimate.swbNormal

				tr = TraceLine( ultimate.traceStruct) 
				
				if tr.Hit then return false end

                ultimate.traceStruct.start = tr.HitPos
                ultimate.traceStruct.endpos = tr.HitPos + dir * 32768
                ultimate.traceStruct.filter = pLocalPlayer
                ultimate.traceStruct.mask = MASK_SHOT

				tr = TraceLine( ultimate.traceStruct )
				
                if ultimate.cfg.vars["Ignores-Head unhitable"] then
                    return tr.Entity == plyTarget and tr.HitGroup == 1
                else
                    return tr.Entity == plyTarget
                end
			end
		end
		
		return false
	end
	
	local function M9KAutowall()
        local penetrate_cvar = GetConVar( "M9KDisablePenetration" )
        if IsValid(penetrate_cvar) then
            if ( penetrate_cvar:GetBool() ) then
                return false 
            end
        end

		if !ultimate.activeWeapon.Penetration then
			return false
		end

		local function BulletPenetrate( tr, bounceNum, damage )
			if damage < 1 then
				return false
			end
			
			local maxPenetration    = 14
            local maxRicochet       = 0
            local isRicochet        = false

            if ultimate.m9kPenetration[ ultimate.activeWeapon.Primary.Ammo ] then
                maxPenetration = ultimate.m9kPenetration[ ultimate.activeWeapon.Primary.Ammo ]
            end
			
            if ultimate.m9kMaxRicochet[ ultimate.activeWeapon.Primary.Ammo ] then
                maxRicochet = ultimate.m9kMaxRicochet[ ultimate.activeWeapon.Primary.Ammo ]
            end

            if ultimate.m9kCanRicochet[ ultimate.activeWeapon.Primary.Ammo ] then
                isRicochet = ultimate.m9kMaxRicochet[ ultimate.activeWeapon.Primary.Ammo ]
            end

			if tr.MatType == MAT_METAL and isRicochet and ultimate.activeWeapon.Primary.Ammo != "SniperPenetratedRound" then
				return false
			end

			if bounceNum > maxRicochet then
				return false
			end

			local penetrationDir = tr.Normal * maxPenetration

			if ultimate.m9kPenMaterial[ tr.MatType ] then
				penetrationDir = tr.Normal * ( maxPenetration * 2 ) 
			end

			if tr.Fraction <= 0 then
				return false
			end

			ultimate.traceStruct.endpos    = tr.HitPos
			ultimate.traceStruct.start     = tr.HitPos + penetrationDir
			ultimate.traceStruct.mask      = MASK_SHOT
			ultimate.traceStruct.filter    = pLocalPlayer

			local trace = TraceLine( ultimate.traceStruct )

			if trace.StartSolid or trace.Fraction >= 1 then
				return false
			end

			ultimate.traceStruct.endpos = trace.HitPos + tr.Normal * 32768
			ultimate.traceStruct.start  = trace.HitPos
			ultimate.traceStruct.mask   = MASK_SHOT
			ultimate.traceStruct.filter = pLocalPlayer

			local penTrace = TraceLine( ultimate.traceStruct )

            if ultimate.cfg.vars["Ignores-Head unhitable"] then
                return penTrace.Entity == plyTarget and penTrace.HitGroup == 1
            else
                return penTrace.Entity == plyTarget
            end

			local damageMulti = 0.5
			if ultimate.activeWeapon.Primary.Ammo == "SniperPenetratedRound" then
				damageMulti = 1
			elseif tr.MatType == MAT_CONCRETE or tr.MatType == MAT_METAL then
				damageMulti = 0.3
			elseif tr.MatType == MAT_WOOD or tr.MatType == MAT_PLASTIC or tr.MatType == MAT_GLASS then
				damageMulti = 0.8
			elseif tr.MatType == MAT_FLESH or tr.MatType == MAT_ALIENFLESH then
				damageMulti = 0.9
			end
			
			if penTrace.MatType == MAT_GLASS then
				bounceNum = bounceNum - 1
			end

			return BulletPenetrate( penTrace, bounceNum + 1, damage * damageMulti )
		end

        ultimate.traceStruct.start = eyePos
        ultimate.traceStruct.endpos = eyePos + dir * 32768
        ultimate.traceStruct.filter = pLocalPlayer
        ultimate.traceStruct.mask = MASK_SHOT

		local trace = TraceLine( ultimate.traceStruct )

		return BulletPenetrate( trace, 0, ultimate.activeWeapon.Primary.Damage )
	end
	
    if string.StartsWith( ultimate.activeWeaponClass, "m9k_" ) or string.StartsWith( ultimate.activeWeaponClass, "bender_" ) then
		return M9KAutowall()
	elseif string.StartsWith( ultimate.activeWeaponClass, "swb_" ) then
		return SWBAutowall()
	end
	
	return false
end

function ultimate.VisibleCheck( who, where, predticks, awalldir )
    local start = pLocalPlayer:EyePos()

    if predticks then start = start + ( pLocalPlayer:GetVelocity() * flTickInterval ) * predticks end

    ultimate.traceStruct.start = start
	ultimate.traceStruct.endpos = where
	ultimate.traceStruct.mask = MASK_SHOT
    ultimate.traceStruct.filter = pLocalPlayer

    local tr = TraceLine( ultimate.traceStruct )

    local canhit = tr.Entity == who or tr.Fraction == 1

    if !canhit and awalldir and ultimate.cfg.vars["Wallz"] then 
        return ultimate.AutoWall( awalldir, who )
    end

    if ultimate.cfg.vars["Ignores-Head unhitable"] and tr.HitGroup != 1 then return false end

    return canhit
end

ultimate.flServerTime = 0
function ultimate.CanShoot( cmd )
	if not ultimate.activeWeapon then return false end
	local seq = ultimate.activeWeapon:GetSequence()

    if ultimate.cfg.binds["Aim on key"] != 0 and not ultimate.IsKeyDown( ultimate.cfg.binds["Aim on key"] ) then
        return false
    end

	if ultimate.badSweps[ ultimate.activeWeaponClass ] then
		return false
	end

    if ultimate.moveType == MOVETYPE_NOCLIP then
        return false
    end

    if ultimate.cfg.vars["Auto fire"] and cmd:KeyDown(IN_ATTACK) then
        return false
    end

	if ultimate.cfg.vars["Bullet time"] and ultimate.activeWeapon:GetNextPrimaryFire() >= ultimate.flServerTime then
		return false
	end

    // print(ded.GetRandomSeed( cmd ))
    if ultimate.cfg.vars["Wait for seed"] and ded.GetRandomSeed( cmd ) != 134 then
        return false 
    end

	return ultimate.activeWeapon:Clip1() != 0 and !ultimate.badSeqs[ seq ] 
end 

function ultimate.Spread( cmd, ang, spread )
	if not ultimate.activeWeapon or not ultimate.cones[ ultimate.activeWeaponClass ] then return ang end

	local dir = ded.PredictSpread( cmd, ang, spread )

	local newangle = ang + dir:Angle()
	newangle:Normalize()

	return newangle
end

/*
    Nospread 
*/

ultimate.CustomSpread = {}

function ultimate.CustomSpread.swb( cmd, ang )
    /*
    local vel = pLocalPlayer:GetVelocity():Length()
    local dir = ang:Forward()
    
    if !pLocalPlayer.LastView then
        pLocalPlayer.LastView = dir
        pLocalPlayer.ViewAff = 0
    else
        pLocalPlayer.ViewAff = Lerp( 0.25, pLocalPlayer.ViewAff, ( dir - pLocalPlayer.LastView ):Length() * 0.5 )
    end
    
    if ultimate.activeWeapon.dt and ultimate.activeWeapon.meSpread and ultimate.activeWeapon.dt.State == SWB_AIMING then
        ultimate.activeWeapon.BaseCone = ultimate.activeWeapon.meSpread
        
        if ultimate.activeWeapon.Owner.Expertise then
            ultimate.activeWeapon.BaseCone = ultimate.activeWeapon.BaseCone * ( 1 - ultimate.activeWeapon.Owner.Expertise["steadyme"].val * 0.0015 )
        end
    else
        ultimate.activeWeapon.BaseCone = ultimate.activeWeapon.HipSpread
        
        if ultimate.activeWeapon.Owner.Expertise then
            ultimate.activeWeapon.BaseCone = ultimate.activeWeapon.BaseCone * ( 1 - ultimate.activeWeapon.Owner.Expertise["wepprof"].val * 0.0015 )
        end
    end
    
    if pLocalPlayer:Crouching() then
        ultimate.activeWeapon.BaseCone = ultimate.activeWeapon.BaseCone * ( ultimate.activeWeapon.dt.State == SWB_AIMING and 0.9 or 0.75 )
    end
    
    ultimate.activeWeapon.CurCone = math.Clamp( ultimate.activeWeapon.BaseCone + ultimate.activeWeapon.AddSpread + ( vel / 10000 * ultimate.activeWeapon.VelocitySensitivity ) * ( ultimate.activeWeapon.dt.State == SWB_AIMING and ultimate.activeWeapon.meMobilitySpreadMod or 1 ) + pLocalPlayer.ViewAff, 0, 0.09 + ultimate.activeWeapon.MaxSpreadInc )
    
    if CurTime() > ultimate.activeWeapon.SpreadWait then
        ultimate.activeWeapon.AddSpread = math.Clamp( ultimate.activeWeapon.AddSpread - 0.005 * ultimate.activeWeapon.AddSpreadSpeed, 0, ultimate.activeWeapon.MaxSpreadInc )
        ultimate.activeWeapon.AddSpreadSpeed = math.Clamp( ultimate.activeWeapon.AddSpreadSpeed + 0.05, 0, 1 )
    end
    */

    local cone = ultimate.activeWeapon.CurCone
    if !cone then return ang end

    if pLocalPlayer:Crouching() then
        cone = cone * 0.85
    end

    math.randomseed( cmd:CommandNumber() )
    return ang - Angle( math.Rand(-cone, cone), math.Rand(-cone, cone), 0 ) * 25
end

function ultimate.CustomSpread.cw( cmd, ang )
    local cone = ultimate.activeWeapon.CurCone
    if !cone then return ang end

    math.randomseed( cmd:CommandNumber() )
    return ang - Angle( math.Rand(-cone, cone), math.Rand(-cone, cone), 0 ) * 25
end

function ultimate.CustomSpread.fas2( cmd, ang )
    math.randomseed( CurTime() )

    local dir = Angle( math.Rand( -ultimate.activeWeapon.CurCone, ultimate.activeWeapon.CurCone ), math.Rand( -ultimate.activeWeapon.CurCone, ultimate.activeWeapon.CurCone ), 0 ) * 25
    local dir2 = dir 
            
    if ultimate.activeWeapon.ClumpSpread and ultimate.activeWeapon.ClumpSpread > 0 then
        dir2 = dir + Vector( math.Rand(-1, 1), math.Rand(-1, 1), math.Rand(-1, 1)) * ultimate.activeWeapon.ClumpSpread
    end

    return ang - dir2
end

function ultimate.CustomSpread.tfa( cmd, ang )

    
    return ang
end

function ultimate.CustomSpread.mg( cmd, ang )
    /*
    local pWeapon = ultimate.activeWeapon

    local flCone = pWeapon:GetCone()

    math.randomseed( pWeapon.Cone.Seed + pWeapon:Clip1() + pWeapon:Ammo1() )

    local flSpread = math.Rand( -flCone, flCone ) * 1000

    if ( flSpread < -flCone ) then
        flSpread = -flCone
    elseif ( flSpread > flCone ) then
        flSpread = flCone
    end

    flSpread = flSpread * 0.1

    local vSpread = Vector( 1, -flSpread, flSpread )
    local newAngle = ang + vSpread:Angle()
    newAngle:Normalize()

    return newAngle
    */
end

/*
local function Zc(self, bd)
    local cd = self:GetCone()
    Xc(self.Cone.Seed + self:Clip1() + self:Ammo1())
    local dd = Wc(-cd, cd) * 1000
    if (dd < -cd) then
        dd = -cd
    elseif (dd > cd) then
        dd = cd
    end
    dd = dd * 0.1
    Yc.x = dd
    Yc.y = -dd
    local ed = self.Bullet
    self:FireBullets(
        {
            Attacker = bd,
            Src = bd:EyePos(),
            Dir = (bd:EyeAngles() + bd:GetViewPunchAngles()):Forward(),
            Spread = Yc,
            Num = ed.NumBullets,
            Distance = (ed.Range * 100) / 2.54,
            Tracer = ed.Tracer and 1 or 0,
            Callback = function(fd, gd, hd)
            end
        }
    )
end
*/

ultimate.SpreadComps = {}

ultimate.SpreadComps["swb"]     = ultimate.CustomSpread.swb
ultimate.SpreadComps["cw"]      = ultimate.CustomSpread.cw
ultimate.SpreadComps["fas2"]    = ultimate.CustomSpread.fas2
ultimate.SpreadComps["tfa"]     = ultimate.CustomSpread.tfa
ultimate.SpreadComps["mg"]     = ultimate.CustomSpread.mg








function ultimate.NoSpread(cmd, ang)
    if not ultimate.activeWeapon or ultimate.swbShit[ ultimate.activeWeaponClass ] then return ang end
    local base = string.Split( ultimate.activeWeaponClass, "_" )[ 1 ]

    if ultimate.SpreadComps[ base ] then
        ang = ultimate.SpreadComps[ base ]( cmd, ang )
    elseif ultimate.cones[ ultimate.activeWeaponClass ] then
        local spread = ultimate.cones[ ultimate.activeWeaponClass ]
        return ultimate.Spread( cmd, ang, spread ) 
    end

    return ang
end

function ultimate.NoRecoil( ang )  
	if ultimate.activeWeaponClass == "weapon_pistol" or string.StartsWith( ultimate.activeWeaponClass,"m9k_" ) or string.StartsWith( ultimate.activeWeaponClass,"bb_" ) or string.StartsWith( ultimate.activeWeaponClass,"unclen8_" ) then
		return ang
	else
	    ang = ang - pLocalPlayer:GetViewPunchAngles()
    end

	return ang
end

/*
ultimate.ui.ComboBox( p, "Hitscan mode", { "Damage", "Safety", "Scale" }, "Hitscan mode" )

*/

function ultimate.ParseBones( ply, bone )
    local mdl = ply:GetModel()

    if ultimate.parsedbones[ mdl ] and ultimate.parsedbones[ mdl ][ bone ] then 
        return ultimate.parsedbones[ mdl ][ bone ]
    end

    if not ultimate.parsedbones[ mdl ] then
        ultimate.parsedbones[ mdl ] = {}
    end
        
    local set = ply:GetHitboxSet()
    local bonecount = ply:GetBoneCount()

    for i = 0, bonecount - 1 do 
		local group = ply:GetHitBoxHitGroup( i, set )

        if group == nil then continue end

		if bone == group then
			ultimate.parsedbones[ mdl ][ bone ] = i

            return i
        end
	end

    for i = 0, bonecount - 1 do 
        local group = ply:GetHitBoxHitGroup( i, set )

        if group == nil then continue end

        if bone > 1 and group == 0 then
            ultimate.parsedbones[ mdl ][ bone ] = i

            return i
        end
    end

    return 0
end

function ultimate.MultipointGroupCheck( group )
    if group == 1 and not ultimate.cfg.vars["Multipoint groups-Head"] then return false end
    if group == 2 and not ultimate.cfg.vars["Multipoint groups-Chest"] then return false end
    if group == 3 and not ultimate.cfg.vars["Multipoint groups-Stomach"] then return false end
    if group == 4 or group == 5 and not ultimate.cfg.vars["Multipoint groups-Arms"] then return false end
    if group == 6 or group == 7 and not ultimate.cfg.vars["Multipoint groups-Legs"] then return false end
    if group == 0 and not ultimate.cfg.vars["Multipoint groups-Generic"] then return false end

    return true 
end

function ultimate.GetBones( ply )
    local scale = ultimate.cfg.vars["Multipoint scale"]
    local pos = ply:LocalToWorld( ply:OBBCenter() )
    local set = ply:GetHitboxSet()

    if ultimate.cfg.vars["Hitscan"] then
        local set = ply:GetHitboxSet()
        local bonecount = ply:GetBoneCount()

        pos = {}

        for i = 0, bonecount - 1 do 
            local group = ply:GetHitBoxHitGroup( i, set )

            if group == nil then continue end

            if group == 1 and not ultimate.cfg.vars["Hitscan groups-Head"] then continue end
            if group == 2 and not ultimate.cfg.vars["Hitscan groups-Chest"] then continue end
            if group == 3 and not ultimate.cfg.vars["Hitscan groups-Stomach"] then continue end
            if group == 4 or group == 5 and not ultimate.cfg.vars["Hitscan groups-Arms"] then continue end
            if group == 6 or group == 7 and not ultimate.cfg.vars["Hitscan groups-Legs"] then continue end
            if group == 0 and not ultimate.cfg.vars["Hitscan groups-Generic"] then continue end

            pos[ #pos + 1 ] = { bone = i, hitgroup = group }
        end

        if not pos or not istable( pos ) then return end

        local valid = {}

        for i = 1, #pos do
            local bone = pos[ i ].bone
            local hitboxbone = ply:GetHitBoxBone( bone, set )

            if hitboxbone == nil then 
                continue 
            end 

            local mins, maxs = ply:GetHitBoxBounds( bone, set )

            if not mins or not maxs then 
                continue
            end 

            local bonepos, ang = ply:GetBonePosition( hitboxbone )
            
            if ultimate.cfg.vars["Multipoint"] and ultimate.MultipointGroupCheck( pos[ i ].hitgroup ) then
                local points = {
                    ( ( mins + maxs ) * 0.5 ),
                    Vector( mins.x, mins.y, mins.z ),
                    Vector( mins.x, maxs.y, mins.z ),
                    Vector( maxs.x, maxs.y, mins.z ),
                    Vector( maxs.x, mins.y, mins.z ),
                    Vector( maxs.x, maxs.y, maxs.z ),
                    Vector( mins.x, maxs.y, maxs.z ),
                    Vector( mins.x, mins.y, maxs.z ),
                    Vector( maxs.x, mins.y, maxs.z )
                }

                for i = 1, #points do
                    points[ i ]:Rotate( ang )
                    points[ i ] = points[ i ] + bonepos

                    if i == 1 then continue end 

                    points[ i ] = ( ( points[ i ] - points[1] ) * scale ) + points[ 1 ]
                    valid[ #valid + 1 ] = points[ i ]
                end
            end 

            mins:Rotate( ang )
            maxs:Rotate( ang )

            valid[ #valid + 1 ] = bonepos + ( ( mins + maxs ) * 0.5 )
        end

        return valid
    else
        local bone = ultimate.ParseBones( ply, ultimate.cfg.vars["Hitbox selection"] ) 

        local hitboxbone = ply:GetHitBoxBone( bone, set )

        if hitboxbone == nil then 
            return { pos }  
        end 

        local mins, maxs = ply:GetHitBoxBounds( bone, set )

        if not mins or not maxs then 
            return { pos } 
        end 

        local bonepos, ang = ply:GetBonePosition( hitboxbone )  

        if ultimate.cfg.vars["Multipoint"] then
            local points = {
                ( ( mins + maxs ) * 0.5 ),
                Vector( mins.x, mins.y, mins.z ),
                Vector( mins.x, maxs.y, mins.z ),
                Vector( maxs.x, maxs.y, mins.z ),
                Vector( maxs.x, mins.y, mins.z ),
                Vector( maxs.x, maxs.y, maxs.z ),
                Vector( mins.x, maxs.y, maxs.z ),
                Vector( mins.x, mins.y, maxs.z ),
                Vector( maxs.x, mins.y, maxs.z )
            }

            for i = 1, #points do
                points[ i ]:Rotate( ang )
                points[ i ] = points[ i ] + bonepos

                if i == 1 then continue end 

                points[ i ] = ( ( points[ i ] - points[1] ) * scale ) + points[ 1 ]
            end

            return points
        else 
            mins:Rotate( ang )
            maxs:Rotate( ang )

            pos = bonepos + ( ( mins + maxs ) * 0.5 )
        end
    end

    return { pos }
end

function ultimate.GetSortedPlayers( mode, selfpred, plypred, vischeck )
    local players   = player.GetAll()   
    local eyepos    = pLocalPlayer:EyePos()       
    local valid     = {}   

	if selfpred then
		eyepos = eyepos + (pLocalPlayer:GetVelocity() * flTickInterval) * selfpred
	end

    local iTeamLocal = ultimate.GetTeam( pLocalPlayer )

    for i = 1, #players do
        local v = players[i]

        if v == pLocalPlayer then 
            continue 
        end 

        if not v:Alive() or v:IsDormant() then 
            continue 
        end

        if ultimate.cfg.vars["Ignores-Bots"] and v:IsBot() then continue end 
        if ultimate.cfg.vars["Ignores-Friends"] and ultimate.cfg.friends[v:SteamID()] then continue end 
        if ultimate.cfg.vars["Ignores-Steam friends"] and v:GetFriendStatus() == "friend" then continue end 
        if ultimate.cfg.vars["Ignores-Admins"] and v:IsAdmin() then continue end 
        if ultimate.cfg.vars["Ignores-Frozen"] and v:IsFlagSet( FL_FROZEN ) then continue end 
        if ultimate.cfg.vars["Ignores-Nodraw"] and v:IsEffectActive( EF_NODRAW ) then continue end 
        if ultimate.cfg.vars["Ignores-God time"] and v:GetColor().a < 255 then continue end 
        if ultimate.cfg.vars["Ignores-Driver"] and v:InVehicle() then continue end 
        if ultimate.cfg.vars["Target-Priority-Only"] and not ultimate.cfg.priorityList[v:SteamID()] then continue end

        local iTeamEnemy = ultimate.GetTeam( v )

        if st == TEAM_SPECTATOR or ultimate.cfg.vars["Ignores-Teammates"] and iTeamLocal == iTeamEnemy then 
            continue 
        end 

        if ultimate.cfg.vars["Ignores-Nocliping"] and v:GetMoveType() == MOVETYPE_NOCLIP then 
            continue 
        end 

        if vischeck then
			local bone = ultimate.GetBones( v )[1]
			local dir = pLocalPlayer:GetShootPos() - bone
			dir:Normalize()

			if !ultimate.VisibleCheck( v, bone, selfpred, dir ) then
				continue
			end
		end

        local pos = v:GetPos()
        if plypred then 
            pos = pos + (v:GetVelocity() * flTickInterval) * plypred
        end

        valid[#valid+1] = { v, pos }
    end

    if mode == 1 then
        table.sort(valid, function( a, b )
            return ( a[2] - eyepos ):LengthSqr() < ( b[2] - eyepos ):LengthSqr()       
        end)
    elseif mode == 2 then
        table.sort(valid, function( a, b )
            local aScr, bScr = a[2]:ToScreen(), b[2]:ToScreen()

            local aDist
            do
                local dx = ( screenWidth * 0.5 ) - aScr.x
                local dy = ( screenHeight * 0.5 ) - aScr.y
                aDist = dx * dx + dy * dy
            end
    
            local bDist
            do
                local dx = ( screenWidth * 0.5 ) - bScr.x
                local dy = ( screenHeight * 0.5 ) - bScr.y
                bDist = dx * dx + dy * dy
            end
    
            return aDist < bDist
        end)
    end

    if #valid == 0 then return end

    return valid
end

function ultimate.IsTickHittable( ply, cmd, tick )
    if ded.GetLatency(0) > 1 then return false end

    local serverArriveTick = ultimate.flServerTime + ded.GetLatency(0) + ded.GetLatency(1)
    local diff = serverArriveTick - ultimate.btrecords[ ply ][ tick ].simulationtime

    if diff > ultimate.cfg.vars["Backtrack time"] / 1000 then return false end

    return true
end

function ultimate.FindBacktrack( cmd, ply )
    local ticks = #ultimate.btrecords[ ply ]
    local canhit = {}

    for i = 1, ticks do
        if ultimate.IsTickHittable( ply, cmd, i ) then
            canhit[ #canhit + 1 ] = i
        end
    end

    return canhit
end

function ultimate.FindFirstHittableTicks( ply, cmd )
    local tickcount = #ultimate.btrecords[ ply ]

    if !tickcount then return 1 end

    for i = 1, tickcount do
        if ultimate.IsTickHittable( ply, cmd, i ) then
            return i
        end
    end
end

do
    local lastdist, lasttick = 1337, 1

    function ultimate.FindClosestHittableTicks( ply, cmd )
        local mypos = pLocalPlayer:EyePos()
        local records = ultimate.btrecords[ ply ]
        local firstticks = ultimate.FindFirstHittableTicks( ply, cmd )
        local tickcount = #records

        if !tickcount or !firstticks then return 1 end

        lastdist = math.huge
    
        for i = 1, tickcount - firstticks do
            local mt = i + firstticks

            if ( records[ mt ].aimpos ):DistToSqr( mypos ) < lastdist then
                lastdist = ( records[ mt ].aimpos ):DistToSqr( mypos )
                lasttick = mt
            end
        end

        return lasttick
    end
end

function ultimate.SelectTarget( cmd )
    local plys = ultimate.GetSortedPlayers( ultimate.cfg.vars["Target selection"] )
    ultimate.target     = false


    if !plys then return end 

    local maxplys       = ultimate.cfg.vars["Max targets"]
    local curplys       = #plys

    if maxplys != 0 and curplys > maxplys then
        curplys = maxplys
    end

    local vEyePos = pLocalPlayer:EyePos()

    local aimAng
    for i = 1, curplys do
		local ply = plys[i][1]

        -- distance check 
        local iMaxDistance = ultimate.cfg.vars[ "Max distance" ]
        local iDistance = vEyePos:DistToSqr( ply:EyePos() )

        if ( iMaxDistance ~= 0 and iDistance > ( iMaxDistance * iMaxDistance ) ) then
            continue 
        end
        






        if not ultimate.cfg.vars["Always backtrack"] then
            local bones = ultimate.GetBones( ply )

            for o = 1, #bones do
                local bone = bones[o]
                aimAng = ( bone - pLocalPlayer:EyePos() ):Angle()

                if ultimate.VisibleCheck( ply, bone, nil, aimAng:Forward() ) then 
                    ultimate.target = ply
                    return ply, bone, aimAng, false, 0
                end
            end

        elseif ultimate.cfg.vars["Extrapolation"] and ultimate.predicted[ ply ] then
            if not ultimate.predicted[ ply ].pos then return end

            aimAng = ( ultimate.predicted[ ply ].pos - pLocalPlayer:EyePos() ):Angle()

            ultimate.traceStruct.start = pLocalPlayer:EyePos()
            ultimate.traceStruct.endpos = ultimate.predicted[ ply ].pos
            ultimate.traceStruct.filter = pLocalPlayer
            ultimate.traceStruct.mask = MASK_SHOT

            local tr = TraceLine( ultimate.traceStruct )

            if !tr.Hit or tr.Entity == ply then
                ultimate.target = ply
                return ply, ultimate.predicted[ ply ].pos, aimAng, false, 0
            end
        end

        if ultimate.cfg.vars["Backtrack"] then
            local ticks = ultimate.FindBacktrack( cmd, ply )

            if ultimate.btrecords[ ply ] and not ply.break_lc then 
                local ts = 0 
                
                if ultimate.cfg.vars["Backtrack mode"] == 3 then
                    for p = 1, #ticks do
                        if not ultimate.btrecords[ ply ][ p ] then continue end

                        aimAng = ( ultimate.btrecords[ ply ][ p ].aimpos - pLocalPlayer:EyePos() ):Angle()

                        ultimate.traceStruct.start = pLocalPlayer:EyePos()
                        ultimate.traceStruct.endpos = ultimate.btrecords[ ply ][ p ].aimpos
                        ultimate.traceStruct.filter = pLocalPlayer
                        ultimate.traceStruct.mask = MASK_SHOT

                        local tr = TraceLine( ultimate.traceStruct )

                        if !tr.Hit or tr.Entity == ply then
                            ultimate.target = ply
                            ultimate.backtracktick = p

                            return ply, ultimate.btrecords[ ply ][ p ].aimpos, aimAng, true, p
                        end
                    end
                end

                if ultimate.cfg.vars["Backtrack mode"] == 3 then return end

                if ultimate.cfg.vars["Backtrack mode"] == 1 then
                    ts = ultimate.FindFirstHittableTicks( ply, cmd )
                elseif ultimate.cfg.vars["Backtrack mode"] == 2 then
                    ts = ultimate.FindClosestHittableTicks( ply, cmd )
                end

                if not ultimate.btrecords[ ply ][ ts ] then return end

                aimAng = ( ultimate.btrecords[ ply ][ ts ].aimpos - pLocalPlayer:EyePos() ):Angle()

                ultimate.traceStruct.start = pLocalPlayer:EyePos()
                ultimate.traceStruct.endpos = ultimate.btrecords[ ply ][ ts ].aimpos
                ultimate.traceStruct.filter = pLocalPlayer
                ultimate.traceStruct.mask = MASK_SHOT

                local tr = TraceLine( ultimate.traceStruct )

                if !tr.Hit or tr.Entity == ply then
                    ultimate.target = ply
                    ultimate.backtracktick = ts

                    return ply, ultimate.btrecords[ ply ][ ts ].aimpos, aimAng, true, ts
                end
            end
        end
	end
end

function ultimate.IsMovementKeysDown( cmd )

    if cmd:KeyDown( IN_MOVERIGHT ) then
        return true 
    end 
    
    if cmd:KeyDown( IN_MOVELEFT ) then
        return true 
    end 

    if cmd:KeyDown( IN_FORWARD ) then
        return true 
    end 

    if cmd:KeyDown( IN_BACK ) then
        return true 
    end 

    return false
end

function ultimate.MovementFix( cmd, wish_yaw )

	local pitch = math.NormalizeAngle( cmd:GetViewAngles().x )
	local inverted = -1
	
	if ( pitch > 89 || pitch < -89 ) then
		inverted = 1
	end

	local ang_diff = math.rad( math.NormalizeAngle( ( cmd:GetViewAngles().y - wish_yaw ) * inverted ) )

	local forwardmove = cmd:GetForwardMove()
	local sidemove = cmd:GetSideMove()

	local new_forwardmove = forwardmove * -math.cos( ang_diff ) * inverted + sidemove * math.sin( ang_diff )
	local new_sidemove = forwardmove * math.sin( ang_diff ) * inverted + sidemove * math.cos( ang_diff )

	cmd:SetForwardMove( new_forwardmove )
	cmd:SetSideMove( new_sidemove )
end

function ultimate.DoSilentAngleUpdate( UserCmd )
    local pWeapon = pLocalPlayer:GetActiveWeapon()

    if ( IsValid( pWeapon ) ) then
        if ( pWeapon.FreezeMovement and pWeapon:FreezeMovement() ) then 
            return 
        end

        local bIsInUse = UserCmd:KeyDown( IN_USE ) or pLocalPlayer:KeyDown(IN_USE)

        if ( pWeapon:GetClass() == "weapon_physgun" and IsValid( pWeapon:GetInternalVariable( "m_hGrabbedEntity" ) ) and bIsInUse ) then 
            return 
        end
    end

    local mYaw = GetConVar( "m_yaw" ):GetFloat()
    local mPitch = GetConVar( "m_pitch" ):GetFloat()

    local silentAngle = ultimate.SilentAngle

    silentAngle.x = math.Clamp( silentAngle.x + UserCmd:GetMouseY() * mPitch, -89, 89 )
    silentAngle.y = silentAngle.y + UserCmd:GetMouseX() * -mYaw
    silentAngle.r = 0
    
    silentAngle:Normalize()

    return silentAngle
end





















// Knife bot ( Etot zaichik knifer )

ultimate.knifes = {}

ultimate.knifes[1] = {
    str = "csgo_",

    canbackstab = true,

    leftdmg = 25,
    leftdmgb = 90,
    leftdist = 64*64,

    rightdmg = 65,
    rightdmgb = 180,
    rightdist = 48*48,
}

ultimate.knifes[2] = {
    str = "swb_",

    canbackstab = false,

    leftdmg = 10,
    leftdmgb = 10,
    leftdist = 50*50,

    rightdmg = 40,
    rightdmgb = 40,
    rightdist = 50*50,
}

ultimate.knifes[3] = {
    str = "weapon_crowba",

    canbackstab = false,

    leftdmg = 10,
    leftdmgb = 10,
    leftdist = 75*75,

    rightdmg = 10,
    rightdmgb = 10,
    rightdist = 75*75,
}

ultimate.knifes[4] = {
    str = "knife_",

    canbackstab = true,

    leftdmg = 25,
    leftdmgb = 90,
    leftdist = 64*64,

    rightdmg = 65,
    rightdmgb = 180,
    rightdist = 48*48,
}

ultimate.knifes[5] = {
    str = "umb_",

    canbackstab = false,

    leftdmg = 1000,
    leftdmgb = 1000,
    leftdist = 300*300,

    rightdmg = 1000,
    rightdmgb = 1000,
    rightdist = 300*300,
}

ultimate.knifes[6] = {
    str = "weapon_fists",

    canbackstab = false,

    leftdmg = 8,
    leftdmgb = 12,
    leftdist = 50*50,

    rightdmg = 8,
    rightdmgb = 12,
    rightdist = 50*50,
}
function ultimate:EntityFaceBack( ent )
    local angle = pLocalPlayer:GetAngles().y - ent:GetAngles().y

    if angle < -180 then angle = 360 + angle end

    if angle <= 90 and angle >= -90 then return true end

    return false
end

function ultimate.CanStab( ent, pos, health )
    local mypos = pLocalPlayer:GetShootPos()
    local tbl = ultimate.knifes[1]
    local wc = pLocalPlayer:GetActiveWeapon():GetClass()
    local canuse = false 

    for i = 1, #ultimate.knifes do
        if string.StartsWith(wc,ultimate.knifes[i].str) then
            canuse = true 
            tbl = ultimate.knifes[i]
            break
        end
    end 

    if not canuse then return false, false end

    if ultimate.canBacktrack( ent ) and ultimate.btrecords[ent][ultimate.backtracktick] then
        pos = ultimate.btrecords[ ent ][ ultimate.backtracktick ].aimpos
    end

    local backstab = tbl.canbackstab and ultimate:EntityFaceBack( ent ) or false
    local dist = mypos:DistToSqr( pos )
    local mode = ultimate.cfg.vars["Knifebot mode"]
    
    if mode == 1 then // Damage mode - tries to inflict biggest possible damage
        if backstab and dist < tbl.rightdist then
            return true, true
        elseif dist < tbl.leftdist and ( ( backstab and health - tbl.leftdmgb <= 0 ) or ( health - tbl.leftdmg <= 0 ) ) then
            return true, false
        elseif dist < tbl.rightdist or  ( dist < tbl.rightdist and health - tbl.leftdmg > 0 )  then 
            return true, true
        end
    elseif mode == 2 then // Fast - tries to hit fast as possible
        if dist < tbl.rightdist then
            return true, true
        elseif dist < tbl.leftdist then
            return true, false
        end
    elseif mode == 3 then // Fatal - deals only fatal damage
        if dist < tbl.leftdist and ( ( backstab and health - tbl.leftdmgb <= 0 ) or ( health - tbl.leftdmg <= 0 ) ) then
            return true, false
        elseif dist < tbl.rightdist and ( ( backstab and health - tbl.rightdmgb <= 0 ) or ( health - tbl.rightdmg <= 0 ) ) then
            return true, true
        end
    end

    return false, false
end

function GetServerTime(cmd)
    if cmd == "get" then
        return os.date("%c", os.time()) -- Возвращаю текущую дату и время в удобочитаемом формате
    else
        return "Invalid command"
    end
end

function GetServerTime()
    return CurTime()   
end

ultimate.grabbingEnt = false 

function ultimate.DrawPhysgunBeamFunc( ply, wep, e, tar, bone, hitpos )
    if ply != me then return end 

    ultimate.grabbingEnt = IsValid( tar ) and tar or false
end

function ultimate.LagCompensation(cmd)
    local ply = ultimate.SelectTarget(cmd)
    local ping = ply:Ping()

    local compensationAmount = ping * 0.001 


    local serverTime = GetServerTime()
    local compensatedTime = serverTime - compensationAmount
end


// Crossbow prediction 

function ultimate.CrossbowPred( cmd )
    if not ultimate.CanShoot( cmd ) then return end

    local plys = ultimate.GetSortedPlayers( ultimate.cfg.vars["Target selection"] )

    if !plys then return end

    for i = 1, #plys do
        local ply = plys[i][1]

        local eyePos        = pLocalPlayer:EyePos()

        local plyPos        = ply:GetPos()
        local plyCenter     = ply:OBBCenter()

        local aimPos        = plyPos + plyCenter
        local aimAngle      = ( aimPos - eyePos ):Angle()
        local aimVector     = aimAngle:Forward()

        local velStart      = aimVector * 3500

        local distance      = eyePos:Distance( aimPos )
        local travelTime    = distance / 3500

        // Movement simulation 
        local predTime      = ( ded.GetLatency( 0 ) + ded.GetLatency( 1 ) ) + travelTime

        if predTime > ultimate.cfg.vars["Simulation limit"] then continue end

        ded.StartSimulation( ply:EntIndex() )

        for i = 1, ultimate.TIME_TO_TICKS( predTime ) do
            ded.SimulateTick()
        end

        local data          = ded.GetSimulationData()

        aimPos              = data.m_vecAbsOrigin + plyCenter
        distance            = eyePos:Distance( aimPos )
        travelTime          = distance / 3500

        ded.FinishSimulation()

        // Gravity simulation
        local gravity       = GetConVar("sv_gravity"):GetFloat() * 0.05
        gravity             = ( gravity * flTickInterval ) * ultimate.TIME_TO_TICKS( travelTime )

        aimPos.z            = aimPos.z + gravity

        // Aimbot 

        local finalVec = Vector( aimPos.x, aimPos.y, aimPos.z )
        local finalAng = ( finalVec - eyePos ):Angle()
        finalAng:Normalize()

        debugoverlay.Line( plyPos + plyCenter, finalVec, 0.1, color_white, true )

        cmd:SetViewAngles( finalAng )
    end
end

// Propkill aimbot

ultimate.grabbingEnt = false 


ultimate.predictedPoint = {}
function ultimate.PropAim( cmd )
    if not ultimate.grabbingEnt or not IsValid( ultimate.grabbingEnt ) or not cmd:KeyDown( IN_ATTACK ) then return end

    local plys = ultimate.GetSortedPlayers( ultimate.cfg.vars["Target selection"] )
    ultimate.target = false
    ultimate.targetVector = false

    if !plys then return end

    for i = 1, #plys do
        local ply           = plys[i][1]

        local eyePos        = pLocalPlayer:EyePos() 

        local plyPos        = ply:GetPos()
        local plyVel        = ply:GetVelocity()
        local plyCenter     = ply:OBBCenter()
        local plySpeed      = plyVel:Length()
        //local plyPred       = plyPos + plyVel * flTickInterval

        local propPos       = ultimate.grabbingEnt:GetPos()
        local propVel       = ultimate.grabbingEnt:GetVelocity()
        local propSpeed     = propVel:Length()

        local distance      = plyPos:Distance( propPos )
        local plydist       = plyPos:Distance( eyePos )

        if plydist >= 4096 then continue end

        local travelTime    = distance / propSpeed
        //local predTime      = ( ded.GetLatency( 0 ) + ded.GetLatency( 1 ) ) + travelTime

        if travelTime > ultimate.cfg.vars["Simulation limit"] then continue end // predTime

        // Prediction

        ded.StartSimulation( ply:EntIndex() )

        for i = 1, ultimate.TIME_TO_TICKS( travelTime ) do // predTime
            ded.SimulateTick()
        end

        local data          = ded.GetSimulationData()
        local aimPos        = data.m_vecAbsOrigin + plyCenter

        distance            = aimPos:Distance( propPos )
        travelTime          = distance / propSpeed

        ded.FinishSimulation()

        // Mouse wheel shit

        local deltaDistance = plydist - distance
        local scrollDelta = -deltaDistance

        // Aim

        local aimAng        = ( aimPos - pLocalPlayer:EyePos() ):Angle()
        aimAng:Normalize()

        cmd:SetMouseWheel( scrollDelta ) 
        cmd:SetViewAngles( aimAng )

        /* Method 1
        local scrollDelta = 0

        if distance == 0 then
            scrollDelta = 0
        elseif propSpeed > plySpeed then
            scrollDelta = - ( distance / propSpeed )
        else
            scrollDelta = distance / plySpeed
        end
        */


        /*



        
        local predticks = ultimate.TIME_TO_TICKS( ded.GetLatency(0) + ded.GetLatency(1) ) + 1

        ded.StartSimulation( ply:EntIndex() )

        for i = 1, predticks do
            ded.SimulateTick()
        end

        local data = ded.GetSimulationData()

        pos = data.m_vecAbsOrigin + ply:OBBCenter()

        ded.FinishSimulation()

        local dist = pos:DistToSqr( pLocalPlayer:EyePos() )

        local clr = dist < 16777216 and Color( 0, 255, 0 ) or Color( 255, 0, 0 )

        debugoverlay.Line( pos, ultimate.grabbingEnt:GetPos(), 0.1, clr, true )
        debugoverlay.Box( pos - ply:OBBCenter(), ply:OBBMins(), ply:OBBMaxs(), 0.1, Color( 255, 15, 15, 32 ) )

        if dist >= 16777216 then continue end

        local aimAng = ( pos - pLocalPlayer:EyePos() ):Angle()
        local ppd = ultimate.grabbingEnt:GetPos():DistToSqr( pos )

        local cd = ultimate.cfg.vars["PA thrower dist"]
        if ppd < ( cd * cd ) and ultimate.cfg.vars["PA thrower"] then
            cmd:RemoveKey( IN_ATTACK )
        end

        local bmd = math.sqrt( dist - ppd )

        if ( dist - ppd ) < 0 then bmd = 0 end 

        local scrollDelta = math.ceil( bmd > 0 and -ppd or ppd )

        if scrollDelta > 5000 then
            scrollDelta = 5000
        elseif scrollDelta < -5000 then
            scrollDelta = -5000
        end

        print( "SDelta", scrollDelta, "BMD", bmd, "PPD", ppd )

        cmd:SetMouseWheel( scrollDelta )
        cmd:SetViewAngles( aimAng )
        */
    end
end

function ultimate.Aim(cmd)
    ultimate.AntiAim(cmd)

    if ultimate.SendPacket then
        ultimate.fakeAngles.angle = cmd:GetViewAngles()
        ultimate.fakeAngles.movex = pLocalPlayer:GetPoseParameter("move_x")
        ultimate.fakeAngles.movey = pLocalPlayer:GetPoseParameter("move_y")

        local layers = {}

        for i = 0, 13 do
            if pLocalPlayer:IsValidLayer(i) then
                layers[i] = {
                    cycle = pLocalPlayer:GetLayerCycle(i),
                    sequence = pLocalPlayer:GetLayerSequence(i),
                    weight = pLocalPlayer:GetLayerWeight(i)
                }
            end
        end

        ultimate.fakeAngles.origin = pLocalPlayer:GetNetworkOrigin()
        ultimate.fakeAngles.seq = pLocalPlayer:GetSequence()
        ultimate.fakeAngles.cycle = pLocalPlayer:GetCycle()
    else
        ultimate.realAngle = cmd:GetViewAngles()
    end

    local ply, bone, aimang, backtracking, bttick = ultimate.SelectTarget(cmd)

    ultimate.targetVector = bone 

    if not aimang then return end

    aimang:Normalize()  

    if not ultimate.cfg.vars["Enable aimbot"] or not ply then return end

    local targetTime = ded.GetSimulationTime( ply:EntIndex() )
    local timeOffset = ded.GetServerTime(cmd) - targetTime

    local serverArriveTick = ded.GetServerTime(cmd) + ded.GetLatency(0) + ded.GetLatency(1)
    local diff = serverArriveTick - targetTime


    if diff > 1 and ultimate.cfg.vars["Adjust tickcount"] then return end

    local oldangs = Angle(aimang)

    if ultimate.cfg.vars["Always backtrack"] and not backtracking then return end

    if ultimate.cfg.vars["Fov limit"] then
        local fov = ultimate.cfg.vars["Aimbot FOV"]

		local view = ultimate.cfg.vars["Silent aim"] and ultimate.SilentAngle or cmd:GetViewAngles()
		local ang = aimang - view

		ang:Normalize()

		ang = math.sqrt(ang.x * ang.x + ang.y * ang.y)

        if ang > fov then
            ultimate.targetVector = false
		    return 
        end
    end

    if not ultimate.CanShoot(cmd) then return end

    if ( ultimate.cfg.vars["Wait for simulation"] and ( ply:GetVelocity():Length() ~= 0 and not ply.simtime_updated ) ) then
        return 
    end

    if not ultimate.cfg.vars["Aimbot smoothing"] and ultimate.SkipCommand then return end

    ultimate.aimingrn = true


    // Knife bot 
    local altfire = false
    local canstab, rightstab = ultimate.CanStab( ply, bone, ply:Health() )

    if ultimate.cfg.vars["Knifebot"] and canstab then
        altfire = rightstab
    elseif ultimate.cfg.vars["Knifebot"] and not canstab then
        return 
    end

    local oldAimAng = aimang
    local finalAngle = aimang

    if ultimate.cfg.vars["Norecoil"] then
        finalAngle = ultimate.NoRecoil(finalAngle)
    end

    if ultimate.cfg.vars["Force seed"] then
        //ded.ForceSeed( cmd )
    end

    if ultimate.cfg.vars["Nospread"] then
        finalAngle = ultimate.NoSpread(cmd,finalAngle)
    end

    if ultimate.cfg.vars["On shot aa"] then
        finalAngle.p = -finalAngle.p - 180
        finalAngle.y = finalAngle.y + 180
    end
    
    if ultimate.cfg.vars["Facestab"] then
        local angles = ply:EyeAngles()

        finalAngle.y = angles.y
        finalAngle.p = angles.p

        altfire = true
    end

    if ultimate.cfg.vars["Aimbot smoothing"] then
        local va = cmd:GetViewAngles()
        va.r = 0

        local rat = ultimate.cfg.vars["Smoothing"] * 100
        local ret = LerpAngle( FrameTime()*rat, va, finalAngle )
        
        finalAngle = ret
    end

    if ultimate.cfg.vars["Projectile aimbot"] then
        local predTime = math.ceil( ( pLocalPlayer:EyePos() ):DistToSqr( ply:GetPos() ) / 3600 )

        //print( predTime )

        //if predTime > 15 then return end

        ded.StartSimulation( ply:EntIndex() )

        for tick = 1, predTime do
            ded.SimulateTick()
        end

        local data = ded.GetSimulationData()
        local vec = data.m_vecAbsOrigin

        ded.FinishSimulation()

        local g = predTime * 0.111

        print( vec.z, g )

        vec.z = vec.z + g 

        finalAngle = ( vec - pLocalPlayer:EyePos() ):Angle()
        finalAngle:Normalize()  
    end

    if ultimate.cfg.vars["Facestab"] then
        cmd:SetViewAngles( finalAngle )
        ded.SetContextVector( cmd, oldAimAng:Forward(), true )
    elseif ultimate.cfg.vars["pSilent"] then
        ded.SetContextVector( cmd, finalAngle:Forward(), true )
    else
        cmd:SetViewAngles( finalAngle )
    end

    if backtracking then
        targetTime = ultimate.btrecords[ply][bttick].simulationtime
        timeOffset = ultimate.flServerTime - targetTime

        serverArriveTick = ultimate.flServerTime + ded.GetLatency(0) + ded.GetLatency(1)
        diff = serverArriveTick - ultimate.btrecords[ply][bttick].simulationtime

        if diff < 0.2 then
            ded.NetSetConVar("cl_interpolate","0")
            ded.NetSetConVar("cl_interp","0")
            local tick = ultimate.TIME_TO_TICKS(targetTime)
            ded.SetCommandTick(cmd, tick)
        else
            ded.NetSetConVar("cl_interpolate","1")
            ded.NetSetConVar("cl_interp",tostring(ultimate.flServerTime - targetTime))
            local tick = ultimate.TIME_TO_TICKS(ultimate.flServerTime)
            ded.SetCommandTick(cmd, tick - 1)
        end
    elseif ( ultimate.cfg.vars["Adjust tickcount"] and ply.simtime_updated ) then
        local flSimulationTime = ded.GetSimulationTime( ply:EntIndex() )
        local iTickCount = ultimate.TIME_TO_TICKS( flSimulationTime )

        ded.NetSetConVar( "cl_interpolate", "0" )
        ded.NetSetConVar( "cl_interp", "0" )

        ded.SetCommandTick( cmd, iTickCount )
    end

    if ultimate.cfg.vars["Auto fire"] then
        if string.StartsWith( ultimate.activeWeaponClass, "m9k_" ) then
            cmd:RemoveKey( IN_SPEED )
        end

        ultimate.SendPacket = true
        pLocalPlayer.simtime_updated = true
        ded.UpdateClientAnimation( pLocalPlayer:EntIndex() )

        if ultimate.cfg.vars["Resolver"] then 
            ply.aimshots = (ply.aimshots or 0) + 1
        end

        local isAutomatic = true

        if ultimate.activeWeapon.Primary then
            isAutomatic = ultimate.activeWeapon.Primary.Automatic
        else
            if class == "weapon_pistol" then
                isAutomatic = false
            end
        end


        if altfire or ( ultimate.cfg.vars["Alt Rapid fire"] and cmd:CommandNumber() % 2 == 0 ) then
            cmd:AddKey(IN_ATTACK2)
        else
            if isAutomatic or ( ultimate.cfg.vars["Rapid fire"] and cmd:CommandNumber() % 2 == 0 ) then
                cmd:AddKey(IN_ATTACK)
            end
        end

        ultimate.SkipCommand = true 
    end
    return true
end


function ultimate.autoReload(cmd)
    if !ultimate.cfg.vars["Auto reload"] then return end

	local wep = pLocalPlayer:GetActiveWeapon()

	if IsValid(wep) then
		if wep.Primary then
			if wep:Clip1() == 0 and wep:GetMaxClip1() > 0 and pLocalPlayer:GetAmmoCount(wep:GetPrimaryAmmoType()) > 0 then
				cmd:AddKey(IN_RELOAD)
			end
		end
	end
end

// adaptive Cstrafe

ultimate.last_ground_pos = 0
ultimate.cstrafe_dir = 0

function ultimate.PredictVelocity( velocity, viewangles, dir, maxspeed, accel )

	local forward = viewangles:Forward()
	local right = viewangles:Right()
	
	local fmove = 0
	local smove = ( dir == 1 ) && -10000 || 10000
	
	forward.z = 0
	right.z = 0
	
	forward:Normalize()
	right:Normalize()

	local wishdir = Vector( forward.x*fmove + right.x*smove, forward.y*fmove + right.y*smove, 0 )
	local wishspeed = wishdir:Length()
	
	wishdir:Normalize()
	
	if ( wishspeed != 0 && wishspeed > maxspeed ) then
		wishspeed = maxspeed
	end
	
	local wishspd = wishspeed
	
	if ( wishspd > 30 ) then
		wishspd = 30
	end
	
	local currentspeed = velocity:Dot( wishdir )
	local addspeed = wishspd - currentspeed
	
	if ( addspeed <= 0 ) then
		return velocity
	end
	
	local accelspeed = accel * wishspeed * flTickInterval
	
	if ( accelspeed > addspeed ) then
		accelspeed = addspeed
	end
	
	return velocity + ( wishdir * accelspeed )

end
    
function ultimate.PredictMovement( viewangles, dir, angle )

	local pm

	local sv_airaccelerate = GetConVarNumber( "sv_airaccelerate" )
	local sv_gravity = GetConVarNumber( "sv_gravity" )
	local maxspeed = pLocalPlayer:GetMaxSpeed()
	local jump_power = pLocalPlayer:GetJumpPower()

	local origin = pLocalPlayer:GetNetworkOrigin()
	local velocity = pLocalPlayer:GetAbsVelocity()
	
	local mins = pLocalPlayer:OBBMins()
	local maxs = pLocalPlayer:OBBMaxs()

    local pticks = math.Round(ultimate.cfg.vars["CStrafe ticks"])
	
	local on_ground = pLocalPlayer:IsFlagSet( FL_ONGROUND )
	
	for i = 1, pticks do

		viewangles.y = math.NormalizeAngle( math.deg( math.atan2( velocity.y, velocity.x ) ) + angle )

		velocity.z = velocity.z - ( sv_gravity * flTickInterval * 0.5 )

		if ( on_ground ) then
		
			velocity.z = jump_power
			velocity.z = velocity.z - ( sv_gravity * flTickInterval * 0.5 )
			
		end

		velocity = ultimate.PredictVelocity( velocity, viewangles, dir, maxspeed, sv_airaccelerate )
		
		local endpos = origin + ( velocity * flTickInterval )

		pm = TraceHull( {
			start = origin,
			endpos = endpos,
			filter = pLocalPlayer,
			maxs = maxs,
			mins = mins,
			mask = MASK_PLAYERSOLID
		} )
		
		if ( ( pm.Fraction != 1 && pm.HitNormal.z <= 0.9 ) || pm.AllSolid || pm.StartSolid ) then
			return false
		end
		
		if ( pm.Fraction != 1 ) then
		
			local time_left = flTickInterval

			for j = 1, 2 do
			
				time_left = time_left - ( time_left * pm.Fraction )

				local dot = velocity:Dot( pm.HitNormal )
				
				velocity = velocity - ( pm.HitNormal * dot )

				dot = velocity:Dot( pm.HitNormal )

				if ( dot < 0 ) then
					velocity = velocity - ( pm.HitNormal * dot )
				end

				endpos = pm.HitPos + ( velocity * time_left )

				pm = TraceHull( {
					start = pm.HitPos,
					endpos = endpos,
					filter = pLocalPlayer,
					maxs = maxs,
					mins = mins,
					mask = MASK_PLAYERSOLID
				} )

				if ( pm.Fraction == 1 || pm.AllSolid || pm.StartSolid ) then
					break
				end
			
			end
			
		end
		
		origin = pm.HitPos
		
		if ( ( ultimate.last_ground_pos - origin.z ) > math.Round(ultimate.cfg.vars["CStrafe ground diff"]) ) then
			return false
		end
		
		pm = TraceHull( {
			start =  Vector( origin.x, origin.y, origin.z + 2 ),
			endpos = Vector( origin.x, origin.y, origin.z - 1 ),
			filter = pLocalPlayer,
			maxs = Vector( maxs.x, maxs.y, maxs.z * 0.5 ),
			mins = mins,
			mask = MASK_PLAYERSOLID
		} )
		
		on_ground = ( ( pm.Fraction < 1 || pm.AllSolid || pm.StartSolid ) && pm.HitNormal.z >= 0.7 )
		
		velocity.z = velocity.z - ( sv_gravity * flTickInterval * 0.5 )
		
		if ( on_ground ) then
			velocity.z = 0
		end


	end

	return true

end

function ultimate.CircleStrafe( cmd )

	local angle = 0
	
	while ( ultimate.cstrafe_dir < 2 ) do
	
		angle = 0
		local path_found = false
		local step = ( ultimate.cstrafe_dir == 1 ) && math.Round(ultimate.cfg.vars["CStrafe angle step"]) || -math.Round(ultimate.cfg.vars["CStrafe angle step"])
		
		while ( true ) do
		
			if ( ultimate.cstrafe_dir == 1 ) then
			
				if ( angle > math.Round(ultimate.cfg.vars["CStrafe angle max step"]) ) then
					break
				end
			
			else
			
				if ( angle < -math.Round(ultimate.cfg.vars["CStrafe angle max step"]) ) then
					break
				end
			
			end

			if ( ultimate.PredictMovement( cmd:GetViewAngles(), ultimate.cstrafe_dir, angle ) ) then
			
				path_found = true
				break
			
			end

			angle = angle + step
		
		end
		
		if ( path_found ) then
			break
		end
		
		ultimate.cstrafe_dir = ultimate.cstrafe_dir + 1
	
	end
	
	if ( ultimate.cstrafe_dir < 2 ) then
	
		local velocity = pLocalPlayer:GetAbsVelocity()
		local viewangles = cmd:GetViewAngles()
		
		viewangles.y = math.NormalizeAngle( math.deg( math.atan2( velocity.y, velocity.x ) ) + angle )
		
		cmd:SetViewAngles( viewangles )
		cmd:SetSideMove( ( ultimate.cstrafe_dir == 1 ) && -10000 || 10000 )
	
	else
	
		ultimate.cstrafe_dir = 0
	
	end

end

do
    local ztick = 0
    local prev_yaw = 0
    local old_yaw = 0.0

    function ultimate.AutoStrafe( cmd )
        ztick = ztick + 1

        if ( ultimate.IsKeyDown(ultimate.cfg.binds["Circle strafe"]) and ultimate.cfg.vars["Circle strafe"] ) then
        
            ultimate.CircleStrafe( cmd )
    
        elseif ( ultimate.IsKeyDown(ultimate.cfg.binds["Z Hop"]) and ultimate.cfg.vars["Z Hop"] ) then
            local handler = ztick / 3.14
            
            cmd:SetSideMove( 5000 * math.sin(handler) )
        elseif ultimate.cfg.vars["Air strafer"] and ultimate.cfg.vars["Strafe mode"] == 3 then
    
            local get_velocity_degree = function(velocity)
                local tmp = math.deg(math.atan(30.0 / velocity))
                    
                if (tmp > 90.0) then
                    return 90.0
                elseif (tmp < 0.0) then
                    return 0.0
                else
                    return tmp
                end
            end
    
            local M_RADPI = 57.295779513082
            local side_speed = 10000
            local velocity = pLocalPlayer:GetVelocity()
            velocity.z = 0.0
    
            local forwardmove = cmd:GetForwardMove()
            local sidemove = cmd:GetSideMove()
    
            if (!forwardmove || !sidemove) then
                return
            end
    
            if(velocity:Length2D() <= 15.0 && !(forwardmove != 0 || sidemove != 0)) then
                return
            end
    
            local flip = cmd:TickCount() % 2 == 0
    
            local turn_direction_modifier = flip && 1.0 || -1.0
            local viewangles = Angle(ultimate.SilentAngle.x, ultimate.SilentAngle.y, ultimate.SilentAngle.z)
    
            if (forwardmove || sidemove) then
                cmd:SetForwardMove(0)
                cmd:SetSideMove(0)
    
                local turn_angle = math.atan2(-sidemove, forwardmove)
                viewangles.y = viewangles.y + (turn_angle * M_RADPI)
            elseif (forwardmove) then
                cmd:SetForwardMove(0)
            end
    
            local strafe_angle = math.deg(math.atan(15 / velocity:Length2D()))
    
            if (strafe_angle > 90) then
                strafe_angle = 90
            elseif (strafe_angle < 0) then
                strafe_angle = 0
            end
    
            local temp = Vector(0, viewangles.y - old_yaw, 0)
            temp.y = math.NormalizeAngle(temp.y)
    
            local yaw_delta = temp.y
            old_yaw = viewangles.y
    
            local abs_yaw_delta = math.abs(yaw_delta)
    
            if (abs_yaw_delta <= strafe_angle || abs_yaw_delta >= 30) then
                local velocity_angles = velocity:Angle()
    
                temp = Vector(0, viewangles.y - velocity_angles.y, 0)
                temp.y = math.NormalizeAngle(temp.y)
    
                local velocityangle_yawdelta = temp.y
                local velocity_degree = get_velocity_degree(velocity:Length2D() * 128)
    
                if (velocityangle_yawdelta <= velocity_degree || velocity:Length2D() <= 15) then
                    if (-velocity_degree <= velocityangle_yawdelta || velocity:Length2D() <= 15) then
                        viewangles.y = viewangles.y + (strafe_angle * turn_direction_modifier)
                        cmd:SetSideMove(side_speed * turn_direction_modifier)
                    else
                        viewangles.y = velocity_angles.y - velocity_degree
                        cmd:SetSideMove(side_speed)
                    end
                else
                    viewangles.y = velocity_angles.y + velocity_degree
                    cmd:SetSideMove(-side_speed)
                end
            elseif (yaw_delta > 0) then
                cmd:SetSideMove(-side_speed)
            elseif (yaw_delta < 0) then
                cmd:SetSideMove(side_speed)
            end
    
            local move = Vector(cmd:GetForwardMove(), cmd:GetSideMove(), 0)
            local speed = move:Length()
    
            local angles_move = move:Angle()
    
            local normalized_x = math.modf(ultimate.SilentAngle.x + 180, 360) - 180
            local normalized_y = math.modf(ultimate.SilentAngle.y + 180, 360) - 180
    
            local yaw = math.rad(normalized_y - viewangles.y + angles_move.y)
    
            if (normalized_x >= 90 || normalized_x <= -90 || ultimate.SilentAngle.x >= 90 && ultimate.SilentAngle.x <= 200 || ultimate.SilentAngle.x <= -90 && ultimate.SilentAngle.x <= 200) then
                cmd:SetForwardMove(-math.cos(yaw) * speed)
            else
                cmd:SetForwardMove(math.cos(yaw) * speed)
            end
    
            cmd:SetSideMove(math.sin(yaw) * speed)

        elseif ultimate.cfg.vars["Air strafer"] and ultimate.cfg.vars["Strafe mode"] == 2 then
            cmd:SetForwardMove(0)

            if pLocalPlayer:IsFlagSet( FL_ONGROUND ) then
                cmd:SetForwardMove(10000)
            else
                cmd:SetForwardMove(5850 / pLocalPlayer:GetVelocity():Length2D())
                cmd:SetSideMove((cmd:CommandNumber() % 2 == 0) && -400 || 400)
            end

            /*

local ang_diff = math.NormalizeAngle( ultimate.SilentAngle.y - prev_yaw )
            
            if ( math.abs( ang_diff ) > 0 ) then
            
                if ( ang_diff > 0 ) then
                    cmd:SetSideMove( -10000 )
                else
                    cmd:SetSideMove( 10000 )
                end
            
            else
            
                local vel = pLocalPlayer:GetAbsVelocity()
                local vel_yaw = math.NormalizeAngle( math.deg( math.atan2( vel.y, vel.x ) ) )
                local vel_yaw_diff = math.NormalizeAngle( ultimate.SilentAngle.y - vel_yaw )
                
                if ( vel_yaw_diff > 0 ) then
                    cmd:SetSideMove( -10000 )
                else
                    cmd:SetSideMove( 10000 )
                end
    
                local viewangles = cmd:GetViewAngles() //ultimate.SilentAngle //Angle( ultimate.SilentAngle.x, ultimate.SilentAngle.y, 0 )
                viewangles.y = vel_yaw
                cmd:SetViewAngles( viewangles )
                
            end
    
            prev_yaw = ultimate.SilentAngle.y
            */
            
            
        end
    end
end

/*
    Anti aim

*/

ultimate.aatarget = nil

function ultimate.PredictedPos(ply)
    return ply:GetPos() + ply:GetVelocity() * flTickInterval
end

function ultimate.PredictedEyePos()
    return pLocalPlayer:EyePos() + pLocalPlayer:GetVelocity() * flTickInterval
end

function ultimate.GetBaseYaw()
    if not IsValid( ultimate.aatarget ) or ultimate.cfg.vars["Yaw base"] != 2 then
        return ultimate.SilentAngle.y
    end

    return math.NormalizeAngle( (ultimate.PredictedPos(ultimate.aatarget) - ultimate.PredictedEyePos()):Angle().y )
end

function ultimate.Freestand(cmd)
	if !IsValid(ultimate.aatarget) then return false end

	local headpos = pLocalPlayer:GetBonePosition(pLocalPlayer:LookupBone("ValveBiped.Bip01_Head1"))
	if !headpos then return end

	local selfpos = pLocalPlayer:GetPos()
	local headoffset = Vector(selfpos.x, selfpos.y, headpos.z):Distance(headpos) + 5

	local found = true

	local pos = ultimate.aatarget:WorldToLocal(selfpos)
	local bearing = math.deg(-math.atan2(pos.y, pos.x)) + 180 + 90
	local left, right = bearing - 180 - 90, bearing - 180 + 90

	local function CheckYaw(yaw)
		yaw = math.rad(yaw)
		local x, y = math.sin(yaw), math.cos(yaw)

		local headoffsetvec = Vector(x, y, 0) * headoffset
		headoffsetvec.z = headpos.z - selfpos.z

		local tr = TraceLine({
			start = ultimate.aatarget:EyePos() + ultimate.aatarget:GetVelocity() * flTickInterval * 4,
			endpos = selfpos + headoffsetvec,
			filter = ultimate.aatarget
		})

		return tr.Fraction < 1 and tr.Entity != pLocalPlayer
	end

	local function Normalize(ang) return 360 - ang + 90 end

	local leftcheck, rightcheck = CheckYaw(left), CheckYaw(right)

	left, right = Normalize(left), Normalize(right)

	do
		local headlocal = pLocalPlayer:WorldToLocal(headpos)
		if headlocal.x > 0 then
			left, right = right, left
		end
	end

	if leftcheck and rightcheck then
		return false
	elseif leftcheck then
		return true, left , right
	elseif rightcheck then
		return true, right, left
	end

	return false
end

ultimate.realAngle = pLocalPlayer:EyeAngles()
ultimate.inverted = false
ultimate.oldYaw = 0
ultimate.SwaySide = 1

local baseyaw = 0

ultimate.CalcYaw = {
    // Backward
    [1] = function( cmd ) 
        return baseyaw - 178 
    end, 
    // Fake forward
    [2] = function( cmd )
        return ultimate.SendPacket and baseyaw or baseyaw + 178 
    end, 
    // Legit Delta
    [3] = function( cmd )     
        return ultimate.SendPacket and baseyaw or baseyaw + ( ultimate.inverted and 43 or - 43 )
    end,
    // Sideways 
    [4] = function( cmd )     
        local delta = ultimate.inverted and 89 or -89
        return baseyaw - ( ultimate.SendPacket and delta or -delta ) 
    end,
    // Half Sideways
    [5] = function( cmd )     
        local delta = ultimate.inverted and 89 or -89
        return baseyaw - ( ultimate.SendPacket and delta or 178 ) 
    end,
    // Fake Spin
    [6] = function( cmd )     
        local add = math.NormalizeAngle( CurTime() * ultimate.cfg.vars["Spin speed"] * 10 )
        return ultimate.SendPacket and ( ultimate.inverted and ( baseyaw - 178 ) or add ) or ( ultimate.inverted and add or ( baseyaw - 178 ) )
    end,
    // LBY Spin
    [7] = function( cmd )     
        return ded.GetCurrentLowerBodyYaw( pLocalPlayer:EntIndex() ) + ( ultimate.SendPacket and 180 or 0)
    end,
    // LBY Breaker
    [8] = function( cmd )   
        local yaw = baseyaw - 178

        if pLocalPlayer:GetVelocity():Length2D() > 1 then
            yaw = ded.GetCurrentLowerBodyYaw( pLocalPlayer:EntIndex() ) + ( ultimate.SendPacket and 180 or 0)
        elseif not ultimate.SendPacket then
            local side = ultimate.inverted and -1 or 1
            local lbyTarget = ded.GetTargetLowerBodyYaw( pLocalPlayer:EntIndex() )

            if math.abs( math.NormalizeAngle( lbyTarget - ultimate.oldYaw ) ) < ultimate.cfg.vars["LBY min delta"] then
                yaw = math.NormalizeAngle( ultimate.oldYaw + ultimate.cfg.vars["LBY break delta"] * side)
            else
                yaw = math.NormalizeAngle( ded.GetCurrentLowerBodyYaw( pLocalPlayer:EntIndex() ) - 44 * side )
            end
        end
        
        return yaw
    end,
    // Sin Sway
    [9] = function( cmd )     
        local add = ultimate.cfg.vars["Sin add"]
        local sin = math.sin( CurTime() ) * ultimate.cfg.vars["Sin delta"]
        return ultimate.SendPacket and baseyaw + sin + add or baseyaw - sin - add
    end,
    // Pendulum Sway
    [10] = function( cmd )
        local ct = CurTime()
        local delta = ultimate.cfg.vars["Sin delta"]
        local ct1 = ( ct % 0.9 )
        local ct2 = ( ct % 2 )

        local x1 = ct2 * math.sin(ct1)
        local y1 = ct2 * -1 * math.cos(ct1)
    
        local x2 = x1 + ct1 * math.sin(ct2)
        local y2 = y1 - ct1 * math.cos(ct2)

        local sin = ultimate.SendPacket and x2 * delta or y2 * delta
        return baseyaw + sin
    end,
    // Lag Sway
    [11] = function( cmd )     
        local swaySpeed = (ultimate.fakeLagTicks + 1) / 12 * math.pi
        local swayAmount = math.sin(CurTime() * swaySpeed) * 45
    
        return ( baseyaw - 180 ) + 55 * ultimate.SwaySide + swayAmount * ultimate.SwaySide * -1
    end,
    // Fake Jitter
    [12] = function( cmd )     
        local delta = ultimate.cfg.vars["Jitter delta"]
        
        local a = ultimate.SendPacket and baseyaw - 178 or baseyaw - 178 + math.random( -delta, delta )
        local b = ultimate.SendPacket and baseyaw - 178 + math.random( -delta, delta ) or baseyaw - 178

        return ultimate.inverted and a or b
    end,
    // Kappa Jitter 
    [13] = function( cmd )    
        local delta = ultimate.cfg.vars["Jitter delta"]

        local a = ultimate.SendPacket and baseyaw - 178 or baseyaw + ( delta * ultimate.SwaySide )
        local b = ultimate.SendPacket and baseyaw + ( delta * ultimate.SwaySide ) or baseyaw - 178

        return ultimate.inverted and a or b
    end,
    // Abu Jitter 
    [14] = function( cmd )   
        local ctjit = math.sin( CurTime() * 30 ) * 25

        return ctjit + ( ultimate.SendPacket and baseyaw - 160 * ultimate.SwaySide or baseyaw - 160 * -ultimate.SwaySide )
    end,
    // Satanic spinner 
    [15] = function( cmd ) 
        local side = ultimate.inverted and 1 or -1
        local satanicvalue = math.sin( CurTime() * 666 ) * 666

        return math.NormalizeAngle( ultimate.SendPacket and satanicvalue * side or satanicvalue * -side )
    end,
    // Custom aa
    [16] = function( cmd )   
        return ultimate.SendPacket and baseyaw + ultimate.cfg.vars["Custom real"] or baseyaw + ultimate.cfg.vars["Custom fake"]
    end,
    // Hand block 
    [17] = function(cmd)
        local target_angle = baseyaw - 90  -- Левый бок относительно текущего взгляда
        return target_angle
    end,

    // Low Delta
    [18] = function( cmd )
        local delta = ultimate.cfg.vars["Low delta value"] or 28  // Можно настроить в конфиге
        local dynamic_delta = math.sin(CurTime() * 2) * (delta / 2)  // Плавное изменение дельты
        
        if ultimate.SendPacket then
            return baseyaw - (ultimate.inverted and -delta or delta) + dynamic_delta
        else
            return baseyaw + (ultimate.inverted and -delta or delta) - dynamic_delta
        end
    end,

    // Desync
    [19] = function( cmd )        
            local send = ultimate.SendPacket
        local baseyaw = ultimate.GetBaseYaw()
        local inverter = ultimate.cfg.vars["Inverter"]

        -- динамический случайный оффсет для фейка
        local jitterRange = ultimate.cfg.vars["Jitter delta"] or 35
        local jitter = math.random(-jitterRange, jitterRange)

        -- real и fake
        local realYaw = baseyaw + (inverter and -ultimate.cfg.vars["Custom real"] or ultimate.cfg.vars["Custom real"])
        local fakeYaw = baseyaw + (inverter and ultimate.cfg.vars["Custom fake"] or -ultimate.cfg.vars["Custom fake"]) + jitter

        -- лево/право чередуется по времени
        local timeSwitch = (CurTime() * 3) % 2 > 1
        if timeSwitch then fakeYaw = fakeYaw + math.random(-20, 20) end

        -- применение
        return send and realYaw or fakeYaw
    end,
    [20] = function( cmd )
        
        local tankaarad = 87
        local a = ultimate.SendPacket and baseyaw - 178 or baseyaw + ( tankaarad * ultimate.SwaySide )
        local b = ultimate.SendPacket and baseyaw + ( tankaarad * ultimate.SwaySide ) or baseyaw - 178
    
        return ultimate.inverted and a or b

    end,
    // Fake switch
    [21] = function(cmd)
        -- Инициализация системы
        if not ultimate.BruteBreaker then
            ultimate.BruteBreaker = {
                last_angles = {},
                safe_zones = {},
                next_switch = 0,
                lby_timer = 0,
                chaos_level = 1.0
            }
            -- Генерация безопасных зон между углами брутфорса
            for i = 1, #ultimate.BruteBreaker.avoid_angles-1 do
                local mid = (ultimate.BruteBreaker.avoid_angles[i] + ultimate.BruteBreaker.avoid_angles[i+1])/2
                table.insert(ultimate.BruteBreaker.safe_zones, mid)
            end
        end
        local BB = ultimate.BruteBreaker

        -- Настройки из конфига
        local REAL_POWER = ultimate.cfg.vars["Custom fake"] or 35  -- Сила движения реальной модели
        local FAKE_POWER = ultimate.cfg.vars["Fake switch"] or 60  -- Сила фейка
        local AVOID_FORCE = ultimate.cfg.vars["Avoid force"] or 2.5 -- Сила уклонения от углов брутфорса

        -- Анализ состояния
        local current_time = CurTime()
        local vel = pLocalPlayer:GetVelocity():Length2D()
        local is_moving = vel > 15
        local lby = ded.GetCurrentLowerBodyYaw(pLocalPlayer:EntIndex())

        -- Система избегания углов брутфорса
        local function get_safest_angle(base)
            local best_angle = base
            local best_score = -math.huge
            
            -- Проверяем безопасные зоны + случайные смещения
            for _, angle in ipairs(BB.safe_zones) do
                local test_angle = angle + math.random(-15, 15)
                local score = 0
                
                -- Оценка расстояния до всех "опасных" углов
                for _, brute_angle in ipairs(BB.avoid_angles) do
                    local dist = math.abs(math.NormalizeAngle(test_angle - brute_angle))
                    score = score + math.min(dist, 30) * AVOID_FORCE
                end
                
                -- Бонус за непредсказуемость
                score = score + math.random(0, 20)
                
                if score > best_score then
                    best_score = score
                    best_angle = test_angle
                end
            end
            
            return best_angle
        end

        -- Рывковая система реального угла
        if current_time > BB.next_switch then
            BB.current_real_angle = get_safest_angle(baseyaw)
            BB.next_switch = current_time + math.Rand(0.35, 0.65)
            BB.chaos_level = 0.8 + math.random() * 0.7
            
            -- Случайный мега-рывок
            if math.random() < 0.2 then
                BB.current_real_angle = BB.current_real_angle * 1.7
            end
        end

        -- LBY Breaker система
        if current_time > BB.lby_timer then
            BB.lby_offset = math.random() > 0.5 and 110 or -110
            BB.lby_timer = current_time + math.Rand(1.3, 2.1)
        end

        -- Комбинированный реальный угол
        local real_angle = BB.current_real_angle * (is_moving and 0.8 or 1.2)
        if math.random() < 0.4 then
            real_angle = real_angle + lby * 0.3 * BB.chaos_level
        end

        -- Фейк-система с анти-резолв техниками
        local fake_angle = 0
        if is_moving then
            fake_angle = math.sin(current_time * 18) * FAKE_POWER * 0.7 +
                        math.cos(current_time * 7) * FAKE_POWER * 0.4 +
                        math.random(-5, 5)
        else
            fake_angle = math.sin(current_time * 12) * FAKE_POWER *
                        (ultimate.inverted and -1 or 1) *
                        BB.chaos_level
        end

        -- Финальный расчет
        return ultimate.SendPacket and (baseyaw + real_angle * REAL_POWER/35) or 
            (baseyaw + fake_angle)
    end,
    // Dolphin Mode
    [22] = function(cmd)
        local wave1 = math.sin(CurTime() * 2) * 60
        local wave2 = math.cos(CurTime() * 5) * 20
        local combined = wave1 * 0.7 + wave2 * 0.3
        
        return ultimate.SendPacket and (baseyaw - combined) or 
            (baseyaw + combined * (ultimate.inverted and -1 or 1))
    end,
    //Freeze Frame
    [23] = function(cmd)
        if not ultimate.last_freeze then
            ultimate.last_freeze = CurTime()
            ultimate.freeze_angle = baseyaw - 90
        end
        
        -- Меняем угол каждые 0.8 секунд
        if CurTime() - ultimate.last_freeze > 0.8 then
            ultimate.last_freeze = CurTime()
            ultimate.freeze_angle = baseyaw + math.random(-120, 120)
        end
        
        return ultimate.freeze_angle
    end,
    // Invisible Man
    [24] = function(cmd)
        local real_offset = ultimate.cfg.vars["Custom real"] or 15
        local fake_angle = math.sin(CurTime() * 3) * 60
        
        if ultimate.SendPacket then
            cmd:SetViewAngles(Angle(0, baseyaw + real_offset, 0))
            return real_offset
        else
            -- Специальный эффект "ломаной" модели
            cmd:SetViewAngles(Angle(0, baseyaw + 179.9, 0))
            return 179.9
        end
    end,
    // Matrix Glitch
    [25] = function(cmd)
        local glitch_factor = math.floor(CurTime() * 10) % 3
        local angles = {
            baseyaw - 90,
            baseyaw + 45,
            baseyaw + 179
        }
        
        return angles[glitch_factor + 1]
    end,

    // Unhittable
    [26] = function(cmd)
        local send = ultimate.SendPacket
        local baseyaw = ultimate.GetBaseYaw()
        local inverter = ultimate.cfg.vars["Inverter"]
        
        -- настройки углов
        local realAngle = ultimate.cfg.vars["Real Angle"] or 124
        local fakeAngle = ultimate.cfg.vars["Fake Angle"] or -47
        
        -- динамический джиттер
        local jitterRange = ultimate.cfg.vars["Jitter Range"] or 12 
        local jitter = math.random(-jitterRange, jitterRange)
        
        -- микро-движения
        local microTicks = (CurTime() * 100) % 360
        local microJitter = math.sin(microTicks * 0.1) * 15
        
        -- временные модификации
        local timeSwitch = (CurTime() * 3) % 2 > 1
        local timeMod = math.sin(CurTime() * 5) * 20
        
        -- рассчитываем real и fake
        local realYaw = baseyaw + (inverter and -realAngle or realAngle)
        local fakeYaw = baseyaw + (inverter and fakeAngle or -fakeAngle) + jitter + microJitter
        
        -- дополнительные модификации для fake
        if timeSwitch then 
            fakeYaw = fakeYaw + timeMod + math.random(-25, 25)
        end
        
        -- случайная инверсия каждые 0.3 секунды
        if math.floor(CurTime() * 3.33) % 2 == 0 then
            fakeYaw = fakeYaw + math.random(-35, 35)
        end
        
        -- адаптивный режим - анализ врагов
        if ultimate.cfg.vars["Adaptive Mode"] then
            local enemies = {}
            local myPos = me:GetPos()
            
            for _, ply in pairs(player.GetAll()) do
                if IsValid(ply) and ply ~= me and ply:Alive() then
                    local dist = myPos:Distance(ply:GetPos())
                    if dist < 1500 then
                        local angleToEnemy = (ply:GetPos() - myPos):Angle().yaw
                        table.insert(enemies, {angle = angleToEnemy, dist = dist})
                    end
                end
            end
            
            if #enemies > 0 then
                -- находим среднюю позицию врагов
                local avgAngle = 0
                for _, enemy in pairs(enemies) do
                    avgAngle = avgAngle + enemy.angle
                end
                avgAngle = avgAngle / #enemies
                
                -- корректируем fake относительно врагов
                fakeYaw = avgAngle + 180 + math.random(-40, 40)
            end
        end
        
        -- фактор скорости
        if ultimate.cfg.vars["Velocity Factor"] then
            local velocity = me:GetVelocity():Length()
            if velocity > 100 then
                local speedMod = math.min(velocity / 300, 1.5)
                fakeYaw = fakeYaw + (math.random(-30, 30) * speedMod)
            end
        end
        
        -- нормализация углов
        realYaw = math.NormalizeAngle(realYaw)
        fakeYaw = math.NormalizeAngle(fakeYaw)
        
        -- возвращаем соответствующий угол
        return send and realYaw or fakeYaw
    end,
    // Unhittable2
    [27] = function(cmd)
        local send = ultimate.SendPacket
        local baseyaw = ultimate.GetBaseYaw()
        local inverter = ultimate.cfg.vars["Inverter"]
        local me = LocalPlayer()
        if not IsValid(me) then return baseyaw end

        -- ══════════ ▼ CFG ══════════
        local realAngle = inverter and -155 or 110
        local fakeBase = inverter and 42 or -45
        local jitterRange = 26
        local microPower = 11
        local oscStrength = 25
        local velocityMod = 30
        local timeSeed = math.floor(CurTime() * 4) % 2 == 0 and 1 or -1
        -- ══════════════════════════

        -- ▼ Jitter (динамический, seeded)
        local jitter = math.random(-jitterRange, jitterRange) * timeSeed

        -- ▼ Micro jitter (синус/косинус шум)
        local time = CurTime()
        local micro = math.sin(time * 3) * microPower + math.cos(time * 6.8) * (microPower * 0.6)

        -- ▼ Fake Oscillation
        local osc = math.sin(time * 2.4) * oscStrength

        -- ▼ Adaptive Target Correction
        if ultimate.cfg.vars["Adaptive Mode"] then
            local myPos = me:GetPos()
            local enemies = {}
            for _, ply in ipairs(player.GetAll()) do
                if IsValid(ply) and ply:Alive() and ply ~= me then
                    local dist = myPos:Distance(ply:GetPos())
                    if dist < 1500 then
                        table.insert(enemies, (ply:GetPos() - myPos):Angle().yaw)
                    end
                end
            end
            if #enemies > 0 then
                local avg = 0
                for _, a in ipairs(enemies) do avg = avg + a end
                avg = avg / #enemies
                fakeBase = (avg - baseyaw + 180 + math.random(-35, 35))
            end
        end

        -- ▼ Velocity Compensation
        if ultimate.cfg.vars["Velocity Factor"] then
            local vel = me:GetVelocity():Length2D()
            if vel > 120 then
                fakeBase = fakeBase + math.sin(time * 10) * velocityMod
            end
        end

        -- ▼ Pitch Spoofing (для фейка)
        if ultimate.cfg.vars["AntiAim Pitch"] then
            cmd:SetViewAngles(Angle(89, cmd:GetViewAngles().y, 0)) -- имитируем pitch
        end

        -- ▼ LBY Breaker-like spin (фейк)
        if math.floor(time * 3.5) % 3 == 0 then
            fakeBase = fakeBase + math.random(-90, 90)
        end

        -- ▼ Flip Fake
        if math.floor(time * 2.25) % 2 == 0 then
            fakeBase = fakeBase * -1
        end

        -- ▼ Финальные углы
        local realYaw = math.NormalizeAngle(baseyaw + realAngle)
        local fakeYaw = math.NormalizeAngle(baseyaw + fakeBase + jitter + micro + osc)

        return send and realYaw or fakeYaw
    end


} 







do
    local pitch, yaw = 0, 0 

    local pitches = { 
        [1] = 89,
        [2] = -89,
        [3] = 0,
        [4] = -180,
        [5] = 180,
    }







 






    local mm_side = false
    local side = false
    local pitchflip = false

    local side = 1

    local function CalcPitch()
        local cfg = ultimate.cfg.vars["Pitch"]
        local x = 0

        if cfg <= 5 then return pitches[cfg] end

        if ultimate.SendPacket then
            pitchflip = not pitchflip
        end
        
        if cfg == 6 then
            x = pitchflip and 180 or -180
        elseif cfg == 7 then
            x = pitchflip and -180 or 271
        elseif cfg == 7 then
            x = ultimate.SendPacket and 89 or -180
        elseif cfg == 8 then
            x = math.random(-180,95) and math.random(177,180)
        elseif cfg == 9 then
            x = math.random(-180,-55) and math.random(180,55)
        elseif cfg == 10 then
            x = math.random(180,95) and math.random(-180,-95)
        elseif cfg == 11 then
            x = math.random(-180,-95) and math.random(166,179+2)
        elseif cfg == 12 then
            x = math.random(-180,-115) and math.random(177,179+2)
        elseif cfg == 13 then
            x = pitchflip and -180 or 271
        elseif cfg == 14 then    
            x = ultimate.cfg.vars["Custom pitch"]
        end

        return x
    end


    /*




        elseif cfg == 7 then
            
        elseif cfg == 8 then
            
        elseif cfg == 9 then
            local sin = math.sin( CurTime() ) * 89
            y = ultimate.SendPacket and baseyaw + sin or baseyaw - sin
        elseif cfg == 10 then
            local side = ded.GetPreviousTick() % 2 == 1

            y = ultimate.SendPacket and baseyaw - 180 or baseyaw + ( side and -89 or 89 )    
        elseif cfg == 11 then

        elseif cfg == 12 then
            y = baseyaw + ( ultimate.SendPacket && ultimate.cfg.vars["Custom fake"] || ultimate.cfg.vars["Custom real"] )
        end

"Backward", 
        "Fake forward", 
        "Sideways", 
        "Half sideways", 
        "Fake spin", 
        "LBY", 
        "Kappa", 
        "Sway",
        "VDiff",
        "القضيب الطويل",
        "Lisp",
        "Custom",

if ultimate.cfg.vars["Jitter"] == 2 and ultimate.SendPacket then
            local r = math.random(-45,45)
            local lbydiff = ded.GetTargetLBY(pLocalPlayer:EntIndex()) - ded.GetCurrentLBY(pLocalPlayer:EntIndex())

            if y + r > ded.GetTargetLBY(pLocalPlayer:EntIndex()) then
                y = y + math.random(-lbydiff,lbydiff)
            else
                y = y + r
            end
             
        elseif ultimate.cfg.vars["Jitter"] == 3 and ultimate.SendPacket then
            y = y + math.random(ded.GetCurrentLBY(pLocalPlayer:EntIndex()),ded.GetTargetLBY(pLocalPlayer:EntIndex()))
        end

        */
    
    local function micromovement(cmd)
        if !ultimate.cfg.vars["Micromovement"] then return end
        if !pLocalPlayer:Alive() then return end
        if !pLocalPlayer:IsFlagSet( FL_ONGROUND ) then return end
        if cmd:KeyDown(IN_BACK) or cmd:KeyDown(IN_FORWARD) or cmd:KeyDown(IN_MOVELEFT) or cmd:KeyDown(IN_MOVERIGHT) then return end

        cmd:SetSideMove(mm_side and -15.0 or 15.0)
        mm_side = !mm_side
    end

    local function aacheck(cmd)
        if !ultimate.cfg.vars["Anti aim"] then return false end
        if cmd:KeyDown(IN_ATTACK) then return false end
        if cmd:KeyDown(IN_USE) then return false end
        if ultimate.moveType == MOVETYPE_LADDER then return false end
        if ultimate.moveType == MOVETYPE_NOCLIP then return false end

        if ultimate.cfg.binds["Anti aim"] != 0 and not ultimate.IsKeyDown(ultimate.cfg.binds["Anti aim"]) then
            return false
        end

        return true 
    end

    function ultimate.AntiAim(cmd)
        local freestandsucc, freestandsafe, freestandunsafe 

        if ultimate.cfg.vars["Freestanding"] then
            freestandsucc, freestandsafe, freestandunsafe = ultimate.Freestand(cmd)
        end

        if ultimate.SendPacket then
            ultimate.SwaySide = ultimate.SwaySide * -1 
        end

        baseyaw = ultimate.GetBaseYaw()
        pitch = CalcPitch()
        yaw = ultimate.CalcYaw[ultimate.cfg.vars["Yaw"] ](cmd)

        if ultimate.cfg.vars["Yaw randomisation"] then
            yaw = yaw + math.random( -0.9, 0.9 ) 
        end 

        if freestandsucc then
            yaw = ultimate.SendPacket and freestandunsafe or freestandsafe
        end

        if aacheck(cmd) then
            local pyAngle = Angle(pitch,yaw,0)

            micromovement(cmd)

            cmd:SetViewAngles(pyAngle)
            ultimate.oldYaw = pyAngle.y
        end
    end
end

/*
    Fake lag  
*/
ultimate.fakeLagTicks = 0
ultimate.fakeLagfactor = 0
ultimate.chokedTicks = 0

ultimate.peeked = false 
ultimate.peeking = false 

function ultimate.FakeLagOnPeek()
    ultimate.fakeLagTicks = 21 - ultimate.chokedTicks - 1 

    if ultimate.chokedTicks >= 20 then
        ultimate.peeked = true
		ultimate.peeking = false
		ultimate.SendPacket = true
        pLocalPlayer.simtime_updated = true
        ded.UpdateClientAnimation( pLocalPlayer:EntIndex() )
		return
    end
end


if ultimate.cfg.vars["Lag fix"] then
    if ultimate.cfg.vars["Backshoot"] then
        local targetTime = ded.GetSimulationTime( ply:EntIndex() )
        local timeOffset = ded.GetServerTime(cmd) - targetTime

        -- Check if we can backtrack without cl_interp
        local serverArriveTick = ded.GetServerTime(cmd) + ded.GetLatency(0) + ded.GetLatency(1)
        local diff = serverArriveTick - ply.aimshots.sw_backshoot_data.simTime
        if diff < 0.2 then 
            local tick = ultimate.TIME_TO_TICKS(targetTime + ultimate.GetLerpTime())
            ded.SetCommandTick(cmd, tick)
        else
            ded.SetTargetInterp(ded.GetServerTime(cmd) - targetTime)

            local tick = ultimate.TIME_TO_TICKS(ded.GetServerTime(cmd))
            ded.SetCommandTick(cmd, tick - 1)
        end
    else
        local simTime = ded.GetSimulationTime(ply:EntIndex())
        local tick = ultimate.TIME_TO_TICKS(simTime + ultimate.GetLerpTime())
        ded.SetCommandTick(cmd, tick)
    end
end


function ultimate.WarpOnPeek()
	ded.StartShifting( true )

	ultimate.peeked = true
	ultimate.peeking = false
end

function ultimate.CheckPeeking()
	local plys

	for extr = 1, 8 do
        plys = ultimate.GetSortedPlayers( 1, extr, 1, true ) 
		if plys then break end
	end

	if plys and !ultimate.peeking and !ultimate.peeked then
		ultimate.peeking = true
		ultimate.peeked = false
	elseif !plys then
		ultimate.peeking = false
		ultimate.peeked = false
	end

	if ultimate.peeking and !ultimate.peeked then
		if !ded.GetIsShifting() and ded.GetCurrentCharge() >= ultimate.cfg.vars["Shift ticks"] and ultimate.cfg.vars["Warp on peek"] then
			ultimate.WarpOnPeek()
        elseif ultimate.cfg.vars["Freeze on peek"] then
            ded.SetOutSequenceNr( ded.GetOutSequenceNr() + ultimate.maxFreezeTicks - 1 ) 
		//elseif ultimate.cfg.vars["Fake lag options-On peek"] then
		//	ultimate.FakeLagOnPeek()
		end
	end
end




do
    
    local function shouldlag(cmd)
        if not ultimate.cfg.vars["Fake lag"] then return false end
        if not pLocalPlayer:Alive() then return false end
        if ultimate.cfg.vars["Fakelag comp"] == 1 and ded.GetCurrentCharge() > 0 then return false end
        if ultimate.cfg.vars["Fake lag options-Disable on ladder"] and ultimate.moveType == MOVETYPE_LADDER then return false end
        if ultimate.cfg.vars["Fake lag options-Disable in attack"] and cmd:KeyDown(IN_ATTACK) then return false end

        if ultimate.cfg.vars["Allah fly"] and not pLocalPlayer:IsFlagSet( FL_ONGROUND ) then
            return false
        end

        return true
    end

    function ultimate.FakeLag(cmd)
        local factor = math.Round(ultimate.cfg.vars["Lag limit"])

        if ultimate.cfg.vars["Fake lag options-Randomise"] then 
            factor =  math.random(ultimate.cfg.vars["Lag randomisation"],factor) 
        end

        local velocity = pLocalPlayer:GetVelocity():Length2D()
        local pertick = velocity * flTickInterval
        local adaptive_factor = math.Clamp(math.ceil(64 / pertick),1,factor)

        if ultimate.cfg.vars["Lag mode"] == 1 or ultimate.cfg.vars["Lag mode"] == 3 then
            ultimate.fakeLagfactor = factor
        elseif ultimate.cfg.vars["Lag mode"] == 2 then
            ultimate.fakeLagfactor = adaptive_factor
        end

        if ultimate.cfg.vars["Allah walk"] and pLocalPlayer:IsFlagSet( FL_ONGROUND ) and ultimate.IsKeyDown(ultimate.cfg.binds["allahwalk"]) then
            ultimate.fakeLagfactor = 21
        end

        //if ultimate.cfg.vars["Fakelag comp"] == 2 and ded.GetCurrentCharge() > 0 then 
        //    local nfactor = ultimate.fakeLagfactor - ded.GetMaxShiftTicks() - 1
        //    ultimate.fakeLagfactor = math.Clamp( nfactor, 0, 21 )
        //end

        if shouldlag(cmd) then
            ultimate.SendPacket = false

            if ultimate.fakeLagTicks <= 0 then
                ultimate.fakeLagTicks = ultimate.fakeLagfactor
                ultimate.SendPacket = true
                pLocalPlayer.simtime_updated = true
                ded.UpdateClientAnimation( pLocalPlayer:EntIndex() )
            else
                ultimate.fakeLagTicks = ultimate.fakeLagTicks - 1
            end

        else
            if ultimate.fakeLagfactor > 0 then ultimate.fakeLagfactor = 0 end
            ultimate.SendPacket = true
            pLocalPlayer.simtime_updated = true
            ded.UpdateClientAnimation( pLocalPlayer:EntIndex() )
        end
    end
end

function ultimate.ClampMovementSpeed(cmd, speed)
	local final_speed = speed;

	local squirt = math.sqrt((cmd:GetForwardMove() * cmd:GetForwardMove()) + (cmd:GetSideMove() * cmd:GetSideMove()));

	if (squirt > speed) then
		local squirt2 = math.sqrt((cmd:GetForwardMove() * cmd:GetForwardMove()) + (cmd:GetSideMove() * cmd:GetSideMove()));

		local cock1 = cmd:GetForwardMove() / squirt2;
		local cock2 = cmd:GetSideMove() / squirt2;

		local Velocity = pLocalPlayer:GetVelocity():Length2D();

		if (final_speed + 1.0 <= Velocity) then
			cmd:SetForwardMove(0)
			cmd:SetSideMove(0)
		else
			cmd:SetForwardMove(cock1 * final_speed)
			cmd:SetSideMove(cock2 * final_speed)
        end
    end
end

function ultimate.FastWalk( cmd )
    if not ultimate.cfg.vars["Ground strafer"] then return end 
    if math.abs(cmd:GetSideMove()) > 1 or math.abs(cmd:GetForwardMove()) < 1 then return end 
    if not pLocalPlayer:IsFlagSet( FL_ONGROUND ) then return end

    if ultimate.moveType == MOVETYPE_NOCLIP or ultimate.moveType == MOVETYPE_LADDER then return end

    local waterLevel = pLocalPlayer:WaterLevel()

    if waterLevel >= 2 then return end
    
	cmd:SetSideMove(cmd:CommandNumber() % 2 == 0 and -5250 or 5250)
end

function ultimate.validMoveType()
    return ultimate.moveType != MOVETYPE_LADDER and ultimate.moveType != MOVETYPE_NOCLIP and ultimate.moveType != MOVETYPE_OBSERVER 
end

function ultimate.isMoving(cmd)
    if not cmd then
        return false
    end

    return ultimate.hoppin or cmd:KeyDown(IN_MOVELEFT) or cmd:KeyDown(IN_MOVERIGHT) or cmd:KeyDown(IN_FORWARD) or cmd:KeyDown(IN_BACK) and not cmd:KeyDown(IN_JUMP)
end

function ultimate.Stop(cmd)
    if ultimate.validMoveType() and pLocalPlayer:IsFlagSet( FL_ONGROUND ) then

        local moving = ultimate.isMoving(cmd)

        if not moving then

            local vel = pLocalPlayer:GetVelocity()
            local dir = vel:Angle()
                
            dir.yaw = ultimate.SilentAngle.y - dir.yaw
                
            local newmove = dir:Forward() * vel:Length2D()
        
            cmd:SetForwardMove(0 - newmove.x)
            cmd:SetSideMove(0 - newmove.y)

        end

    end
end

// Slidewalk 

function ultimate.SlideWalk( cmd )
    local ticksToStop = ultimate.fakeLagfactor





end








// Auto peak 

ultimate.startedPeeking = false 
ultimate.needToMoveBack = false
ultimate.startPeekPosition = Vector(0,0,0)

function ultimate.MoveTo( cmd, pos )
    local ang = ( pos - pLocalPlayer:GetPos() ):Angle().y

    cmd:SetForwardMove(1000)
    cmd:SetSideMove(0)

    cmd:AddKey(IN_SPEED)

    ultimate.MovementFix( cmd, ang )
end

function ultimate.checkAutopeak( cmd )
    if ultimate.startedPeeking and cmd:KeyDown(IN_ATTACK) then 
        ultimate.needToMoveBack = true
    elseif !ultimate.startedPeeking and !cmd:KeyDown(IN_ATTACK) then
        ultimate.needToMoveBack = false
    end  
end

do
    local colorA = Color( 235, 75, 75 )
    local colorB = Color( 75, 235, 75 )

    local apmat = Material( "gui/npc.png" )

    local nullangle = Angle(0,0,0)

    function ultimate.drawAutopeak()
        local col = ultimate.needToMoveBack and colorA or colorB
    
        cam.Start3D2D( ultimate.startPeekPosition, nullangle, 0.5 )
            cam.IgnoreZ( true )

            surface.SetDrawColor( col )
            surface.SetMaterial( apmat )
            surface.DrawTexturedRect( -32, -32, 64, 64 )

            cam.IgnoreZ( false )
        cam.End3D2D()
    end
end

function ultimate.autopeakThink()
    if ultimate.IsKeyDown(ultimate.cfg.binds["Auto peak"]) then
        if not ultimate.startedPeeking then
            ultimate.startPeekPosition = pLocalPlayer:GetPos()     
        end

        ultimate.startedPeeking = true
    else
        ultimate.startedPeeking = false
    end
end








// Sequence Manipulation 

ultimate.freezedTicks = 0
ultimate.maxFreezeTicks = math.Round( 1 / flTickInterval ) 
function ultimate.AnimationFreezer()
    if not ultimate.IsKeyDown( ultimate.cfg.binds["Animation freezer"] ) then return end

    if ultimate.freezedTicks < ultimate.maxFreezeTicks then
        ded.SetOutSequenceNr( ded.GetOutSequenceNr() + ultimate.maxFreezeTicks - 1 ) 

        ultimate.freezedTicks = ultimate.freezedTicks + 1
    else
        ultimate.freezedTicks = 0
    end
end

ultimate.seqshit = false
function ultimate.SequenceShit(cmd)
    if not ultimate.cfg.vars["Sequence manip"] or not ultimate.IsKeyDown(ultimate.cfg.binds["Sequence manip"]) then
        
        if ultimate.seqshit then
            ultimate.seqshit = false 
        end

        return 
    end

    local amt = ultimate.cfg.vars["Sequence min random"] and math.random(ultimate.cfg.vars["Sequence min"],ultimate.cfg.vars["OutSequence"]) or ultimate.cfg.vars["OutSequence"] 

    ultimate.seqshit = true
    ultimate.SendPacket = true
    ded.SetOutSequenceNr(ded.GetOutSequenceNr() + amt)
end

// Handjob ( arm breaker )
 
function ultimate.PerformHandjob( cmd )
    local mode = ultimate.cfg.vars["Handjob mode"]
    local shouldjerk = true

    if mode == 2 then
        shouldjerk = (cmd:CommandNumber() % 12) >= 6
    elseif mode == 3 then
        shouldjerk = math.random(0, 1) == 0 
    end

    ded.SetTyping(cmd, shouldjerk)
end 

// create move hook 

ultimate.norf = {
    ["laserjetpack"] = true,
    ["weapon_physgun"] = true,
}

ultimate.vapecd = false
ultimate.tyaga = 0
ultimate.maxvape = ultimate.TIME_TO_TICKS(5)
ultimate.hoppin = false
local ic = false

ultimate.slams = {}

function ultimate.OnEntityCreated(ent)
    if ent:GetClass() == "npc_satchel" and ent:GetOwner() == pLocalPlayer then 
        ultimate.slams[ #ultimate.slams + 1 ] = ent
    end
end





local bWasOnGround = false 


function ultimate.CreateMove(cmd)
    ultimate.DoSilentAngleUpdate( cmd )

    ultimate.aimingrn = false

    //if ( ded.GetChokedPackets() > 14 ) then ded.SetChokedPackets( 14 ) end

    if cmd:CommandNumber() == 0 then 
        return 
    end

    ultimate.flServerTime = ded.GetServerTime( cmd )

    //if ded.GetIsShifting() then ultimate.shiftedTicks = ultimate.shiftedTicks + 1 end

    local w = pLocalPlayer:GetActiveWeapon()
    ultimate.activeWeapon       = IsValid( w ) and w or false
    ultimate.activeWeaponClass  = IsValid( w ) and w:GetClass() or false 
    ultimate.moveType           = pLocalPlayer:GetMoveType() 

    //if ultimate.cfg.vars["Passive recharge"] and ded.GetCurrentCharge() < ded.GetMaxShiftTicks() and not pLocalPlayer:Alive() then
    //    ded.SetReloadKeyPressed( true )
    //end


    if ultimate.cfg.vars["Silent aim"] then cmd:SetViewAngles(ultimate.SilentAngle) end

    //if ded.GetIsShifting() then
        //  ded.AdjustTickbase()
    //    print("shifting")
    //end

    if ultimate.cfg.vars["Flashlight spam"] and input.IsKeyDown( KEY_F ) then
        cmd:SetImpulse(100)
    end

    if ultimate.cfg.vars["Auto Vape"] then
        if cmd:KeyDown( IN_ATTACK ) then
            if ultimate.tyaga >= ultimate.maxvape then
                cmd:RemoveKey( IN_ATTACK )
                ultimate.tyaga = 0
            elseif ultimate.tyaga < ultimate.maxvape then
                ultimate.tyaga = ultimate.tyaga + 1 
            end
        else
            ultimate.tyaga = 0
        end
    end 


    if ultimate.vapecd then 
        ultimate.vapecd = false 
        cmd:RemoveKey( IN_ATTACK2 ) 
    elseif ultimate.cfg.vars["Vape spam"] and ultimate.activeWeapon and not ultimate.vapecd and string.StartsWith( ultimate.activeWeaponClass, "weapon_vape" ) then
        cmd:AddKey( IN_ATTACK2 )
        ultimate.vapecd = true
    end   

    if ultimate.cfg.vars["Handjob"] then
        ultimate.PerformHandjob( cmd )
    end 

    //if ultimate.cfg.vars["Fake latency"] then
    //    local amt = ultimate.cfg.vars["Max latency"]
    //    ded.SetInSequenceNr(ded.GetInSequenceNr() - amt)
    //end

    if ultimate.SkipCommand then 
        cmd:RemoveKey( IN_ATTACK ) 
    
        ultimate.SkipCommand = !ultimate.SkipCommand 
    end

    if ( pLocalPlayer:IsFlagSet( FL_ONGROUND ) ) then
		ultimate.last_ground_pos = pLocalPlayer:GetNetworkOrigin().z
	end

    if ultimate.cfg.vars["Animation freezer"] then ultimate.AnimationFreezer() end
    
	ultimate.SequenceShit(cmd)

    if not ultimate.seqshit then
        ultimate.FakeLag(cmd)

        if ultimate.cfg.vars["Allah walk"] and pLocalPlayer:IsFlagSet( FL_ONGROUND ) and ultimate.IsKeyDown(ultimate.cfg.binds["allahwalk"]) then
            
            if ultimate.fakeLagTicks != 20 then
                ultimate.ClampMovementSpeed(cmd, 0)
            else
                ultimate.ClampMovementSpeed(cmd, pLocalPlayer:GetWalkSpeed())
            end

            //if(ultimate.fakeLagTicks <= 20) then
            //    ultimate.ClampMovementSpeed(cmd, 0)
            //    ultimate.Stop(cmd)
                //pLocalPlayer:SetPoseParameter("move_x", 0)
	            //pLocalPlayer:SetPoseParameter("move_y", 0)
            //else
             //   ultimate.ClampMovementSpeed(cmd, pLocalPlayer:GetWalkSpeed())
            //end

            --print(ultimate.fakeLagTicks,pLocalPlayer:GetVelocity():Length2D())
        end
    end

    if ultimate.cfg.vars["Fake lag options-On peek"] or ultimate.cfg.vars["Warp on peek"] or ultimate.cfg.vars["Freeze on peek"] then
        ultimate.CheckPeeking()
    end
    
    // Movement
    
    ultimate.FastWalk( cmd )

    if ultimate.cfg.vars["Sprint"] then cmd:AddKey(IN_SPEED) end

    ultimate.hoppin = false

    if pLocalPlayer:GetMoveType() != MOVETYPE_NOCLIP and pLocalPlayer:GetMoveType() != MOVETYPE_LADDER and pLocalPlayer:GetMoveType() != MOVETYPE_OBSERVER then
        if ( cmd:KeyDown( IN_JUMP ) ) then
            local bIsOnGround = pLocalPlayer:IsFlagSet( FL_ONGROUND )

            if ( not bIsOnGround or bWasOnGround ) then
                cmd:RemoveKey( IN_JUMP )

                bWasOnGround = false 

                if ( not bWasOnGround ) then
                    ultimate.AutoStrafe( cmd )
                end
            else
                bWasOnGround = true
            end

            ultimate.hoppin = true
        end
    end
    
	if ultimate.cfg.vars["Fast stop"] then
        ultimate.Stop(cmd)
    end

    if ultimate.cfg.vars["Water jump"] and pLocalPlayer:WaterLevel() > 1 then
        cmd:AddKey( IN_JUMP )

    elseif ultimate.cfg.vars["Jesus lag"] and ultimate.SendPacket and pLocalPlayer:WaterLevel() == 1 then
        cmd:AddKey( IN_DUCK )
    end

    if ultimate.cfg.vars["Fake duck"] and ultimate.IsKeyDown(ultimate.cfg.binds["Fake duck"]) then
        if ultimate.fakeLagTicks > (ultimate.fakeLagfactor / 2) then
            cmd:AddKey(IN_DUCK)
        else
            cmd:RemoveKey(IN_DUCK)
        end
    end

    ultimate.targetVector = false

	ded.StartPrediction(cmd)
        local wish_yaw = ultimate.SilentAngle.y 

        if ( ultimate.IsKeyDown(ultimate.cfg.binds["Circle strafe"]) and ultimate.cfg.vars["Circle strafe"] ) then
            wish_yaw = cmd:GetViewAngles().y
        end

        if ultimate.cfg.vars["Crossbow prediction"] and ultimate.activeWeaponClass == "weapon_crossbow" then
            ultimate.CrossbowPred( cmd )
        elseif ultimate.cfg.vars["Prop aimbot"] then
            ultimate.PropAim(cmd)
        else
            if not ultimate.Aim(cmd) and cmd:KeyDown(IN_ATTACK) then
                local va = Angle( ultimate.SilentAngle.p, ultimate.SilentAngle.y, 0 )

                if ultimate.cfg.vars["Norecoil"] then
                    va = ultimate.NoRecoil(va)
                end

                if ultimate.cfg.vars["Nospread"] then
                    va = ultimate.NoSpread(cmd,va)
                end

                cmd:SetViewAngles( va )
                
            end
        end
        
        if ultimate.cfg.vars["Silent aim"] then
            ultimate.MovementFix( cmd, wish_yaw )
        end

    ded.FinishPrediction() 

    if ultimate.cfg.vars["Trigger bot"] and ultimate.IsKeyDown( ultimate.cfg.binds["Trigger bot"] ) then
        local tr = pLocalPlayer:GetEyeTrace().Entity 
        
        if tr and tr:IsPlayer() then
            cmd:AddKey( IN_ATTACK )
        end
    end

    if ultimate.cfg.vars["Double tap"] and ultimate.cfg.vars["Tickbase shift"] and cmd:KeyDown( IN_ATTACK ) then
        //ultimate.shiftedTicks = 0
        ded.StartShifting( true )
    end

    if ultimate.cfg.vars["Auto detonator"] and #ultimate.slams > 0 then
        local d = ultimate.cfg.vars["AutoD distance"]
        d = d * d 

        local plys = player.GetAll()

        for jjj = 1, #plys do
            if plys[ jjj ] == pLocalPlayer then continue end
            
            for k, v in pairs(ultimate.slams) do
                if not IsValid(v) then ultimate.slams[k] = nil continue end
    
                local pos = v:GetPos()
    
                if pos:DistToSqr( plys[ jjj ]:GetPos() + plys[ jjj ]:GetVelocity() * ( flTickInterval * 4 ) ) < d then
                    cmd:AddKey( IN_ATTACK2 )
                    break
                end
            end
        end
    end

    if ultimate.cfg.vars["Auto peak"] then
        local ppos = ultimate.startPeekPosition
        local pposd = pLocalPlayer:GetPos():DistToSqr(ppos)

        if ultimate.needToMoveBack and pposd < 1024 then //or ultimate.IsMovementKeysDown( cmd )
            ultimate.needToMoveBack = false
        end

        if ultimate.startedPeeking then
            //if not ultimate.IsMovementKeysDown( cmd ) then
            //    ultimate.needToMoveBack = true
            //end

            if ultimate.needToMoveBack then
                ultimate.MoveTo( cmd, ppos )

                if ultimate.cfg.vars["Auto peak tp"] and ultimate.cfg.vars["Tickbase shift"] then
                    //ultimate.shiftedTicks = 0
                    ded.StartShifting( true )
                end
            end
        end

        ultimate.checkAutopeak( cmd )
    end

    ultimate.autoReload(cmd)

    if ultimate.cfg.vars["Use spam"] then
        if cmd:KeyDown(IN_USE) then
            cmd:RemoveKey(IN_USE)
        else
            cmd:AddKey(IN_USE)
        end
    end

    if ultimate.cfg.vars["Auto GTA"] then
        local tr = pLocalPlayer:GetEyeTrace().Entity

        if IsValid( tr ) and tr:IsVehicle() then
            cmd:AddKey(IN_USE)
        end
    end

    if ultimate.cfg.vars["Ghost follower"] then
        local tar = player.GetBySteamID( ultimate.cfg.vars["GFID"] )

        if IsValid( tar ) then 
            local tang = ( tar:GetPos() - pLocalPlayer:EyePos() ):Angle()

            cmd:ClearMovement()
            cmd:ClearButtons()

            cmd:SetForwardMove( 10000 )
            cmd:SetSideMove(0)

            cmd:AddKey(IN_SPEED)

            cmd:SetViewAngles( tang )
            ultimate.MovementFix( cmd, tang.y )
        end
    end

    if ultimate.cfg.vars["Air lag duck"] and ultimate.SendPacket then
        local startPosUnducked = pLocalPlayer:GetPos()
        local isDucking = bit.band(pLocalPlayer:GetFlags(), FL_DUCKING) != 0
        if isDucking then
            startPosUnducked.z = startPosUnducked.z - (72 - 36)
        end

        ded.StartSimulation( pLocalPlayer:EntIndex() )

        local shouldduck = true 

        for i = 1, 4 do
            ded.SimulateTick()

            local simData = ded.GetSimulationData()

            local maxs = pLocalPlayer:OBBMaxs()
            maxs.z = 72 

            if isDucking then
                simData.m_vecAbsOrigin.z = simData.m_vecAbsOrigin.z - (72 - 36)
            end

            local trace = TraceHull({
                start = startPosUnducked,
                endpos = simData.m_vecAbsOrigin,
                mins = pLocalPlayer:OBBMins(),
                maxs = maxs,
                filter = pLocalPlayer,
                mask = MASK_PLAYERSOLID
            })

            if pLocalPlayer:IsOnGround() and trace.Hit then
                shouldduck = false 
                break
            end
        end

        ded.FinishSimulation()

        if shouldduck and !pLocalPlayer:IsFlagSet( FL_ONGROUND ) then 
            cmd:AddKey( IN_DUCK )   
        end
    end

    if ultimate.fcenabled then
        cmd:ClearMovement()
        cmd:ClearButtons()

        cmd:SetViewAngles(ultimate.fcangles)
    end

    /*if ultimate.cfg.vars["Dodge projectiles"] and ded.GetCurrentCharge() >= ded.GetMaxShiftTicks() and not ded.GetIsShifting() then
        local entitys = ents.GetAll()

        for i = 1, #entitys do
            local v = entitys[ i ]

            if v:GetClass() != "crossbow_bolt" then continue end 

            local mypos = pLocalPlayer:GetPos() + pLocalPlayer:GetVelocity() * flTickInterval 
            local entpos = v:GetPos() + ( v:GetAngles():Forward() * 3500 ) * flTickInterval

            if mypos:DistToSqr( entpos ) > 320 then
                cmd:ClearMovement()
                cmd:ClearButtons()

                cmd:AddKey( IN_SPEED )
                cmd:SetSideMove( 10000 )
                ded.StartShifting( true )
            end
        end
    end*/

    if ultimate.SendPacket then
        ultimate.chokedTicks = 0 
    else
        ultimate.chokedTicks = ultimate.chokedTicks + 1
    end

    if not ultimate.cfg.vars["Silent aim"] then ultimate.SilentAngle = cmd:GetViewAngles() end

    ded.SetBSendPacket( ultimate.SendPacket )

    if ultimate.cfg.vars["Lag mode"] == 3 and ultimate.SendPacket then
        ded.SetOutSequenceNr(ded.GetOutSequenceNr() + 8)
    end
end 
 
/* 
    Render Scene / Anti screengrab 
*/
ultimate.UnSafeFrame = false
ultimate.renderTarget = GetRenderTarget( "YaPidoras" .. os.time(), screenWidth, screenHeight )

do
    local oldsky, oldskycolor, oldwallcolor = ultimate.cfg.vars["Custom sky"], ultimate.cfg.vars["Sky color"], ultimate.cfg.vars["Wall color"]
    local oldskyclr, oldwallclr = ultimate.cfg.colors["Sky color"], ultimate.cfg.colors["Wall color"]

    local worldcollerp = string.ToColor( ultimate.cfg.colors["Wall color"] )
    local worldmats = Entity( 0 ):GetMaterials()

    local origsky = GetConVar("sv_skyname"):GetString()
    local tsides = {"lf", "ft", "rt", "bk", "dn", "up"}
    local skymat = {}

    for i = 1, 6 do 
        skymat[i] = Material("skybox/" .. origsky .. tsides[i]) 
    end

    local function setSkyboxTexture( skyname )
        for i = 1, 6 do
            local t = Material("skybox/" .. skyname .. tsides[i]):GetTexture("$basetexture")
            skymat[i]:SetTexture("$basetexture", t)
        end
    end

    local function setSkyColor( setcolor )
        local cfg = string.ToColor( ultimate.cfg.colors["Sky color"] )
        local vector = setcolor and Vector( cfg.r/255, cfg.g/255, cfg.b/255 ) or Vector( 1, 1, 1 )

        for i = 1, 6 do
            skymat[i]:SetVector( "$color", vector )
        end
    end

    local function setWallColor( setcolor )
        local cfg = string.ToColor( ultimate.cfg.colors["Wall color"] )
        worldcollerp = ultimate.ColorLerp( worldcollerp, cfg )
        local vector = setcolor and Vector( worldcollerp.r/255, worldcollerp.g/255, worldcollerp.b/255 ) or Vector( 1, 1, 1 )

        for i = 1, #worldmats do
            local value = worldmats[i]

            Material( value ):SetVector( "$color", vector )
            Material( value ):SetFloat( "$alpha", setcolor and (cfg.a / 255) or 255 )
        end
    end

    function ultimate.RenderScene()

        local newname, newcolor, newcolor2 = ultimate.cfg.vars["Custom sky"], ultimate.cfg.vars["Sky color"], ultimate.cfg.vars["Wall color"]
        local newskyclr, newwallclr = ultimate.cfg.colors["Sky color"],ultimate.cfg.colors["Wall color"]
        
        if newskyclr != oldskyclr or newcolor != oldskycolor then
            setSkyColor( newcolor )

            oldskyclr = newskyclr
            oldskycolor = newcolor
        end

        if newwallclr != tostring( worldcollerp ) or newcolor2 != oldwallcolor then
            setWallColor( newcolor2 )

            oldwallcolor = newcolor2
        end

        if newname != oldsky then
            setSkyboxTexture( newname )
            oldsky = newname
        end

        // Esp shit

        if ( !gui.IsConsoleVisible() && !gui.IsGameUIVisible() ) || ultimate.UnSafeFrame then
            local view = {
                x = 0,
                y = 0,
                w = screenWidth,
                h = screenHeight,
                dopostprocess = true,
                origin = vOrigin,
                angles = vAngle,
                fov = vFOV,
                drawhud = true,
                drawmonitors = true,
                drawviewmodel = true
            }
         
            render.RenderView( view )
            render.CopyTexture( nil, ultimate.renderTarget )
         
            cam.Start2D()
                hook.Run( "Ungrabbable2D" )
            cam.End2D()

            cam.Start3D()
                hook.Run( "Ungrabbable3D" )
            cam.End3D()
    
            render.SetRenderTarget( ultimate.renderTarget )
         
            return true
        end
    end

end

function ultimate.PreScreenGrab()
    if ultimate.UnSafeFrame then return end
	ultimate.UnSafeFrame = true
 
	render.Clear( 0, 0, 0, 255, true, true )
	render.RenderView( {
		origin = pLocalPlayer:EyePos(),
		angles = pLocalPlayer:EyeAngles(),
		x = 0,
		y = 0,
		w = screenWidth,
		h = screenHeight,
		dopostprocess = true,
		drawhud = true,
		drawmonitors = true,
		drawviewmodel = true
	} )
 
	ultimate.UnSafeFrame = false
end

ultimate.prikol = Material( "a/prikol" ):GetTexture( "$basetexture" ) //  Material( file.Read( "prikol.png", "DATA" ) )

function render.Capture( data )
    ultimate.PreScreenGrab()

    if ultimate.cfg.vars["Screengrab image"] then 
        cam.Start2D()
            render.DrawTextureToScreen( ultimate.prikol )
        cam.End2D()
    end

	return render.Capture( data )
end

function _G.render.Capture( data )
    ultimate.PreScreenGrab()

    if ultimate.cfg.vars["Screengrab image"] then 
        cam.Start2D()
            render.DrawTextureToScreen( ultimate.prikol )
        cam.End2D()
    end

	return render.Capture( data )
end


/*
    ESP, Chams
*/

function ultimate.IsValidPlayer(pl)
    if pl == pLocalPlayer then return false end
    if not IsValid(pl) then return false end
    if not pl:Alive() then return false end


    return true
end

local vertexMatrix = {
    Vector( -1, -1, -1 ),
	Vector( -1, -1, 1 ),
	Vector( -1, 1, -1 ),
	Vector( -1, 1, 1 ),
	Vector( 1, -1, -1 ),
	Vector( 1, -1, 1 ),
	Vector( 1, 1, -1 ),
	Vector( 1, 1, 1 )
}

function ultimate.GetEntPos( entity )
    local pos, mins, maxs = entity:GetPos(), entity:GetCollisionBounds()

	local size = ( maxs - mins ) * 0.5
	local boxCenter = pos + ( mins + maxs ) * 0.5

	local iMinX, iMinY = math.huge, math.huge
	local iMaxX, iMaxY = -math.huge, -math.huge

	for i = 1, 8 do
		local screenPos = ( boxCenter + vertexMatrix[ i ] * size ):ToScreen()

        iMinX, iMinY, iMaxX, iMaxY = math.min( iMinX, screenPos.x ), math.min( iMinY, screenPos.y ), math.max( iMaxX, screenPos.x ), math.max( iMaxY, screenPos.y )
	end

	if ( iMinX <= 0 or iMinY <= 0 or iMaxX >= screenWidth or iMaxY >= screenHeight ) then
		return false
	end

    return math.ceil( iMaxX ), math.ceil( iMaxY ), math.floor( iMinX ), math.floor( iMinY )
end

function ultimate.getTextX(v,tw,pos)
    if pos == 1 or pos == 2 then
        return tw/2
    elseif pos == 3 then
        return 0
    elseif pos == 4 then 
        local f = tw
        if ultimate.cfg.vars["Health bar"] and v.Health > 0 then
            if f == 0 then
                f = f + 8
            else 
                f = f + 5
            end
        end
        if ultimate.cfg.vars["Armor bar"] and v.Armor > 0 then
            if f == 0 then
                f = f + 8
            else 
                f = f + 5
            end
        end
        return f
    end
end

function ultimate.getTextY(max,min,th,pos,tbpos)
    if pos == 1 then
        return min-th-th*tbpos
    elseif pos == 2 then
        return max+th*tbpos
    elseif pos == 3 then
        return min+th*tbpos - 1
    elseif pos == 4 then
        return min+th*tbpos - 1
    end
end

function ultimate.SortByDistance( f, s )
    return f[1]:GetPos():DistToSqr( EyePos() ) > s[1]:GetPos():DistToSqr( EyePos() )
end

function ultimate.GenerateArrowPoss(x, y, scale, ang)
    local ang1 = Angle(0, ang, 0):Forward() * scale
    local ang2 = Angle(0, ang + 120, 0):Forward() * (scale - 1)
    local ang3 = Angle(0, ang - 120, 0):Forward() * (scale - 1)

    local p0 = {x = x, y = y}
    local poly = {
        {x = p0.x + ang1.x, y = p0.y + ang1.y},
        {x = p0.x + ang2.x, y = p0.y + ang2.y},
        {x = p0.x + ang3.x, y = p0.y + ang3.y},
    }
    return poly
end

function ultimate.DrawOutlinedPoly( poly )
    local last = nil
    for i = 1, #poly do
        local v = poly[ i ]
        if last then
            surface.DrawLine(last.x, last.y, v.x, v.y)
            last = v
        else
            last = v
        end
    end
    surface.DrawLine(last.x, last.y, poly[1].x, poly[1].y)
end

ultimate.Fonts = {
    [1] = "veranda",
    [2] = "veranda_s",
}


ultimate.BarPadding = 0

function ultimate.DrawBar(MaxX, MaxY, MinX, MinY, Pos, Current, Max, BarColor, BackColor, Gradient, GradientColor)
    if ultimate.BarPadding == 0 then
        ultimate.BarPadding = 6
    else
        ultimate.BarPadding = 11
    end

    local BarX, BarY = MinX-ultimate.BarPadding, MinY-1
    local BarW, BarH = math.floor( MaxX - MinX ), 4
    local FillW, FillH = math.ceil(Current / Max * BarW), BarH

    if Pos > 2 then
        BarW, BarH = 4, math.floor( MaxY - MinY ) + 2
        FillW, FillH = BarW, math.ceil(Current / Max * BarH)
    end

    FillW = math.min(FillW, BarW)
    FillH = math.min(FillH, BarH)

    surface.SetDrawColor(BackColor)
    surface.DrawRect(BarX, BarY, BarW, BarH)

    BarX, BarY = BarX + 1, BarY + 1

    if Pos > 2 then
        BarY = BarY + BarH - FillH
    end

    BarW, BarH = BarW - 2, BarH - 2
    FillW, FillH = FillW - 2, FillH - 2

    surface.SetDrawColor(BarColor)
    surface.DrawRect(BarX, BarY, FillW, FillH)

    if Gradient then
        surface.SetDrawColor(GradientColor)
        surface.SetMaterial(ultimate.Materials["Gradient"])
        surface.DrawTexturedRect(BarX, BarY, FillW, FillH)
    end
end

local cheaters = {}

cheaters.list = {}
cheaters.list_temp = {}
cheaters.fetch_link = "https://raw.githubusercontent.com/HEWWORLDPROJECT/Baze/refs/heads/main/baze.json"

function cheaters.fetch_on_success(body, length, headers, code)
    local tbl = util.JSONToTable(body)
    if tbl != nil then
        cheaters.list_temp = {}
        cheaters.list_temp = tbl
    end
end

function cheaters.fetch_on_failure(msg)
    print(msg)
end

function cheaters.update()
    http.Fetch(cheaters.fetch_link, cheaters.fetch_on_success, cheaters.fetch_on_failure, nil)
    cheaters.list = cheaters.list_temp
end

cheaters.update()

timer.Create("CheatersUpdate", 10, 0, function()
    cheaters.update()
end)

function ultimate.DrawESP()
    local d = ultimate.cfg.vars["ESP Distance"]
    local ed = ultimate.cfg.vars["Ent ESP Distance"]
    local pos = pLocalPlayer:GetPos()
    d = d * d
    ed = ed * ed

    surface.SetFont( ultimate.Fonts[ ultimate.cfg.vars["ESP Font"] ] )

    for i = 1, #ultimate.entityCache do
        local v = ultimate.entityCache[ i ]

        if not IsValid( v.entity ) then return end 

        if v.position:DistToSqr( pos ) > ed then continue end

        local MaxX, MaxY, MinX, MinY = ultimate.GetEntPos( v.entity )

        if ( not MaxX ) then
            continue 
        end

        local XLen, YLen = MaxX - MinX, MaxY - MinY

        surface.SetAlphaMultiplier( v.entity:IsDormant() and 0.35 or 1 )

        surface.SetTextColor( ultimate.Colors[255] )

        if ultimate.cfg.vars["Ent class"] then
            local tw, th = surface.GetTextSize( v.class )

            surface.SetTextPos( ( MaxX + (MinX - MaxX) / 2 ) - tw / 2 , MinY - th )
            surface.DrawText( v.class )
        end

        if ultimate.cfg.vars["Ent box"] then
            if ultimate.cfg.vars["Ent box style"] == 1 then
                surface.SetDrawColor(ultimate.Colors[0])
                surface.DrawOutlinedRect(MinX-1,MinY-1,XLen+2,YLen+2,3)
        
                surface.SetDrawColor( ultimate.Colors[255] )
                surface.DrawOutlinedRect(MinX,MinY,XLen,YLen,1)
            elseif ultimate.cfg.vars["Ent box style"] == 2 then
                local wlen, hlen = math.floor( XLen / 3 ), math.floor( YLen / 3 )
    
                surface.SetDrawColor(ultimate.Colors[0])
    
                // Left up
                surface.DrawRect( MinX - 1, MinY - 1, wlen, 3 )
                surface.DrawRect( MinX - 1, MinY - 1, 3, hlen )
    
                // Right up
                surface.DrawRect( MaxX - wlen + 2, MinY - 1, wlen, 3 )
                surface.DrawRect( MaxX - 1, MinY - 1, 3, hlen )
    
                // Left down
                surface.DrawRect( MinX - 1, MaxY - 2, wlen, 3 )
                surface.DrawRect( MinX - 1, MaxY - hlen, 3, hlen )
    
                // Right down
                surface.DrawRect( MaxX - wlen + 2, MaxY - 2, wlen, 3 )
                surface.DrawRect( MaxX - 1, MaxY - hlen, 3, hlen )
    
                surface.SetDrawColor( ultimate.Colors[255] )
    
                wlen = wlen - 2
                hlen = hlen - 2 
    
                // Left up
                surface.DrawRect( MinX, MinY, wlen, 1 )
                surface.DrawRect( MinX, MinY, 1, hlen )
    
                // Right up
                surface.DrawRect( MaxX - wlen + 1, MinY, wlen, 1 )
                surface.DrawRect( MaxX, MinY, 1, hlen )
    
                // Left down
                surface.DrawRect( MinX, MaxY - 1, wlen, 1 )
                surface.DrawRect( MinX, MaxY - hlen - 1, 1, hlen )
    
                // Right down
                surface.DrawRect( MaxX - wlen + 1, MaxY - 1, wlen, 1 )
                surface.DrawRect( MaxX, MaxY - hlen - 1, 1, hlen )
            elseif ultimate.cfg.vars["Ent box style"] == 3 then
                cam.Start3D()
                render.DrawWireframeBox( v.position, v.entity:GetAngles(), v.entity:OBBMins(), v.entity:OBBMaxs(), ultimate.Colors[255], true )
                cam.End3D()
            end
        end
    end

    local plys = player.GetAll()

    local color_box     = string.ToColor( ultimate.cfg.colors["Box esp"] )
    local color_box_g   = string.ToColor( ultimate.cfg.colors["Box gradient"] )

    local myEyePos = pLocalPlayer:EyePos()

    for i = 1, #plys do
        local v = ultimate.playerCache[ plys[i] ]

        if not v or not ultimate.IsValidPlayer(v.entity) then continue end
        
        local vp = v.GetPos
        local distance = vp:DistToSqr(pos)
		if distance > d then continue end

        surface.SetAlphaMultiplier( v.entity:IsDormant() and 0.35 or 1 )

        local MaxX, MaxY, MinX, MinY = ultimate.GetEntPos( v.entity )

        if ( not MaxX ) then
            continue 
        end

        local XLen, YLen = MaxX - MinX, MaxY - MinY

        local teamcolor = v.TeamColor

        if ultimate.cfg.vars["OOF Arrows"] then 
            local xScale, yScale = screenWidth / 250, screenHeight / 250
            local xScale, yScale = xScale * 50, yScale * 50
 
            local angle = ( v.entity:EyePos() - myEyePos ):Angle() 
            local addPos = Angle(0, (ultimate.SilentAngle.y - angle.y) - 90, 0):Forward()
            local pos = Vector(screenWidth / 2, screenHeight / 2, 0) + Vector(addPos.x * xScale, addPos.y * yScale, 0)

            if math.abs( math.NormalizeAngle(angle.y - ultimate.SilentAngle.y) ) >= 60 then
                local poly = ultimate.GenerateArrowPoss(pos.x, pos.y, 16, (ultimate.SilentAngle.y - angle.y) - 90)
                local poly1 = ultimate.GenerateArrowPoss(pos.x, pos.y, 17, (ultimate.SilentAngle.y - angle.y) - 90)
                local poly2 = ultimate.GenerateArrowPoss(pos.x, pos.y, 15, (ultimate.SilentAngle.y - angle.y) - 90)
                
                if ultimate.cfg.vars["OOF Style"] == 1 then
                    surface.SetDrawColor( ultimate.Colors[0] )
                    ultimate.DrawOutlinedPoly( poly1 )
                    ultimate.DrawOutlinedPoly( poly2 )

                    surface.SetDrawColor( teamcolor ) 
                    ultimate.DrawOutlinedPoly( poly )
                else
                    local ang2 = Angle(0, (ultimate.SilentAngle.y - angle.y) - 90 + 120, 0):Forward() * (scale - 1)
                    surface.SetDrawColor( teamcolor ) 
                    
                    surface.DrawLine( pos.x, pos.y, pos.x, pos.y + ang2.y )
                    //surface.DrawLine(last.x, last.y, v.x, v.y)
                    //surface.DrawLine(last.x, last.y, v.x, v.y)
                    //surface.DrawLine(last.x, last.y, v.x, v.y)
                end
                
            end
        end

        if ultimate.cfg.vars["Box esp"] then
            if ultimate.cfg.vars["Box style"] == 1 then
                surface.SetDrawColor(ultimate.Colors[0])
                surface.DrawOutlinedRect(MinX-1,MinY-1,XLen+2,YLen+2,3)
        
                surface.SetDrawColor( ultimate.cfg.vars["Box team color"] and teamcolor or color_box )
                surface.DrawOutlinedRect(MinX,MinY,XLen,YLen,1)
            elseif ultimate.cfg.vars["Box style"] == 2 then
                local wlen, hlen = math.floor( XLen / 3 ), math.floor( YLen / 3 )

                surface.SetDrawColor(ultimate.Colors[0])

                // Left up
                surface.DrawRect( MinX - 1, MinY - 1, wlen, 3 )
                surface.DrawRect( MinX - 1, MinY - 1, 3, hlen )

                // Right up
                surface.DrawRect( MaxX - wlen + 2, MinY - 1, wlen, 3 )
                surface.DrawRect( MaxX - 1, MinY - 1, 3, hlen )

                // Left down
                surface.DrawRect( MinX - 1, MaxY - 2, wlen, 3 )
                surface.DrawRect( MinX - 1, MaxY - hlen, 3, hlen )

                // Right down
                surface.DrawRect( MaxX - wlen + 2, MaxY - 2, wlen, 3 )
                surface.DrawRect( MaxX - 1, MaxY - hlen, 3, hlen )

                surface.SetDrawColor( ultimate.cfg.vars["Box team color"] and teamcolor or color_box )

                wlen = wlen - 2
                hlen = hlen - 2 

                // Left up
                surface.DrawRect( MinX, MinY, wlen, 1 )
                surface.DrawRect( MinX, MinY, 1, hlen )
 
                // Right up
                surface.DrawRect( MaxX - wlen + 1, MinY, wlen, 1 )
                surface.DrawRect( MaxX, MinY, 1, hlen )
 
                // Left down
                surface.DrawRect( MinX, MaxY - 1, wlen, 1 )
                surface.DrawRect( MinX, MaxY - hlen - 1, 1, hlen )
 
                // Right down
                surface.DrawRect( MaxX - wlen + 1, MaxY - 1, wlen, 1 )
                surface.DrawRect( MaxX, MaxY - hlen - 1, 1, hlen )
            elseif ultimate.cfg.vars["Box style"] == 3 then
                local wlen, hlen = math.floor( XLen / 3 ), math.floor( YLen / 3 )
                local xc = math.floor( XLen / 2 )

                surface.SetDrawColor(ultimate.Colors[0])

                // Left
                surface.DrawRect( MinX - 1, MinY - 1 + hlen, 3, hlen )

                surface.DrawLine( MinX - 1, MinY - 1 + hlen, MinX + xc, MinY - 1 )
                surface.DrawLine( MinX + 1, MinY - 1 + hlen, MinX + xc, MinY + 1 )

                surface.DrawLine( MinX - 1, MinY - 2 + hlen * 2, MinX + xc, MinY + 1 + YLen )
                surface.DrawLine( MinX + 1, MinY - 2 + hlen * 2, MinX + xc, MinY - 1 + YLen )

                // Right
                surface.DrawRect( MaxX - 1, MinY - 1 + hlen, 3, hlen )

                surface.DrawLine( MaxX - 1, MinY - 1 + hlen, MinX + xc, MinY + 1 )
                surface.DrawLine( MaxX + 1, MinY - 1 + hlen, MinX + xc, MinY - 1 )

                surface.DrawLine( MaxX - 1, MinY - 2 + hlen * 2, MinX + xc, MinY - 1 + YLen )
                surface.DrawLine( MaxX + 1, MinY - 2 + hlen * 2, MinX + xc, MinY + 1 + YLen )

                surface.SetDrawColor( ultimate.cfg.vars["Box team color"] and teamcolor or color_box )

                // Left
                surface.DrawRect( MinX, MinY + hlen - 1, 1, hlen )
                surface.DrawLine( MinX, MinY - 1 + hlen, MinX + xc, MinY )
                surface.DrawLine( MinX, MinY - 2 + hlen * 2, MinX + xc, MinY + YLen )

                // Right
                surface.DrawRect( MaxX, MinY + hlen - 1, 1, hlen )
                surface.DrawLine( MaxX, MinY - 1 + hlen, MinX + xc, MinY )
                surface.DrawLine( MaxX, MinY - 2 + hlen * 2, MinX + xc, MinY + YLen )
            elseif ultimate.cfg.vars["Box style"] == 4 then
                local wlen, hlen = math.floor( XLen / 3 ) + 3, math.floor( YLen / 3 ) + 3
                local x, y, xw, xh = MinX - 3, MinY - 3, MaxX + 3, MaxY + 3
                local polys = {}

                for i = 1, 3 do
                    polys = {
                        { x = x + wlen, y = y },
                        { x = xw - wlen, y = y },
                        { x = xw, y = y + hlen },
                        { x = xw, y = xh - hlen },
                        { x = xw - wlen, y = xh },
                        { x = x + wlen, y = xh },
                        { x = x, y = xh - hlen },
                        { x = x, y = y + hlen },
                    }
    
                    surface.SetDrawColor( i == 2 and teamcolor or ultimate.Colors[0] ) 
                    ultimate.DrawOutlinedPoly( polys )
                    
                    wlen, hlen = wlen - i, hlen - i

                    y, x = y + i, x + i
                    xw, xh = xw - i, xh - i
                end
            elseif ultimate.cfg.vars["Box style"] == 5 then
                cam.Start3D()
                render.DrawWireframeBox(v.entity:GetPos(), v.entity:GetAngles(), v.entity:OBBMins(), v.entity:OBBMaxs(), ultimate.cfg.vars["Box team color"] and teamcolor or color_box, true)
                cam.End3D()
            end
        end

        // Sight lines 

        if ultimate.cfg.vars["Sight lines"] then 
            local tr = v.entity:GetEyeTrace()
            local startpos, hitpos = tr.StartPos:ToScreen(), tr.HitPos:ToScreen()

            surface.SetDrawColor( teamcolor )
            surface.DrawLine( startpos.x, startpos.y, hitpos.x, hitpos.y )
        end

        // text 

        local ttbl = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 }
        local poses = { [1] = MaxX + (MinX - MaxX) / 2, [3] = MaxX+5, [4] = MinX-5 }
        poses[2] = poses[1]

        surface.SetTextColor( ultimate.Colors[255] )

if ultimate.cfg.vars["Name"] then 
    local name = v.Name
    local pos = ultimate.cfg.vars["Name pos"]
    local tw, th = surface.GetTextSize(name)

    -- Проверяем приоритетных игроков (красный цвет)
    if ultimate.cfg.priorityList and ultimate.cfg.priorityList[v.entity:SteamID()] then
        surface.SetTextColor(255, 0, 0, 255)
    -- Проверяем друзей (зелёный цвет)
    elseif ultimate.cfg.friends[v.entity:SteamID()] or v.entity:GetFriendStatus() == "friend" then
        surface.SetTextColor(0, 255, 0, 255)
    -- Проверяем игроков в базе данных (синий цвет)
    elseif ultimate.trackedPlayers and ultimate.trackedPlayers[steamId] then
        surface.SetTextColor(255, 0, 0, 255)
    -- Обычные игроки (белый цвет)
    else
        surface.SetTextColor(255, 255, 255, 255)
    end


    surface.SetTextPos(poses[pos]-ultimate.getTextX(v,tw,pos), ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
    surface.DrawText(name)

    ttbl[pos] = ttbl[pos] + 0.8
end

        surface.SetTextColor( ultimate.Colors[255] )

        if ultimate.cfg.vars["Usergroup"] then 
            local name = v.GetUserGroup
            local pos = ultimate.cfg.vars["Usergroup pos"]
            local tw, th = surface.GetTextSize(name)

            surface.SetTextPos(poses[pos]-ultimate.getTextX(v,tw,pos),ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface.DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if ultimate.cfg.vars["Mark"] then 
            local gay = cheaters.list[v.entity:SteamID()]
            
            if gay != nil then    
                local name = gay
                if name == "" then
                    name = "cheater"
                end

                local pos = ultimate.cfg.vars["Mark pos"]
                local tw, th = surface.GetTextSize(name)

                surface.SetTextColor(255, 0, 0, 255)
                surface.SetTextPos(poses[pos]-ultimate.getTextX(v,tw,pos), ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
                surface.DrawText(name)

                ttbl[pos] = ttbl[pos] + 0.8
            end
        end

        surface.SetTextColor( ultimate.Colors[255] )

        if ultimate.cfg.vars["Weapon"] then 
            local name = ultimate.cfg.vars["Show ammo"] and v.WeaponClass .. " (" .. v.WeaponAmmo .. ")" or v.WeaponClass
           
            if ultimate.cfg.vars["Show reloading"] then
                for i = 0, 13 do
                    if v.entity:IsValidLayer(i) then
                        if v.entity:GetSequenceActivityName(v.entity:GetLayerSequence(i)):find("RELOAD") then
                            name = "RELOADING"
                            break
                        end
                    end
                end
            end

            local pos = ultimate.cfg.vars["Weapon pos"]
            local tw, th = surface.GetTextSize(name)

            surface.SetTextPos(poses[pos]-ultimate.getTextX(v,tw,pos),ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface.DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if ultimate.cfg.vars["Team"] then 
            local name = v.TeamName
            local pos = ultimate.cfg.vars["Team pos"]
            local tw, th = surface.GetTextSize(name)

            surface.SetTextPos(poses[pos]-ultimate.getTextX(v,tw,pos),ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface.DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if ultimate.cfg.vars["DarkRP Money"] then 
            local name = v.MoneyVar
            local pos = ultimate.cfg.vars["Money pos"]
            local tw, th = surface.GetTextSize(name)

            surface.SetTextPos(poses[pos]-ultimate.getTextX(v,tw,pos),ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface.DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end
        
        ultimate.BarPadding = 0
        
        local health = v.Health
        local maxhealth = v.GetMaxHealth

        if health > 0 then
            if ultimate.cfg.vars["Health"] then 
                local pos = ultimate.cfg.vars["Health pos"]
                local tw, th = surface.GetTextSize(health)
    
                surface.SetTextPos(poses[pos]-ultimate.getTextX(v,tw,pos),ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
                surface.DrawText(health)
    
                ttbl[pos] = ttbl[pos] + 0.8
            end

            if ultimate.cfg.vars["Health bar"] then 
                ultimate.DrawBar( MaxX, MaxY, MinX, MinY, 4, health, maxhealth, string.ToColor( ultimate.cfg.colors["Health"] ), Color(0, 0, 0), ultimate.cfg.vars["Health bar gradient"], string.ToColor( ultimate.cfg.colors["Health bar gradient"] ) )
            end
        end

        local armor = v.Armor
        local maxarmor = v.GetMaxArmor

        if armor > 0 then
            if ultimate.cfg.vars["Armor"] then 
                local pos = ultimate.cfg.vars["Armor pos"]
                local tw, th = surface.GetTextSize(armor)
    
                surface.SetTextPos(poses[pos]-ultimate.getTextX(v,tw,pos),ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
                surface.DrawText(armor)
    
                ttbl[pos] = ttbl[pos] + 0.8
            end

            if ultimate.cfg.vars["Armor bar"] then 
                ultimate.DrawBar( MaxX, MaxY, MinX, MinY, 4, armor, maxarmor, string.ToColor( ultimate.cfg.colors["Armor"] ), Color(0, 0, 0), ultimate.cfg.vars["Armor bar gradient"], string.ToColor( ultimate.cfg.colors["Armor bar gradient"] ) )
            end
        end

        if ultimate.cfg.vars["Break LC"] and v.break_lc then
            local name = "Breaking LC"
            local pos = ultimate.cfg.vars["Break LC pos"]
            local tw, th = surface.GetTextSize(name)

            surface.SetTextPos(poses[pos]-ultimate.getTextX(tw,pos),ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface.DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if ultimate.cfg.vars["Simtime updated"] then
            local name = v.simtime_updated and "Updated" or "Same"
            local pos = ultimate.cfg.vars["Simtime pos"]
            local tw, th = surface.GetTextSize(name)

            surface.SetTextPos(poses[pos]-ultimate.getTextX(tw,pos),ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface.DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end
 
        if ultimate.cfg.vars["Skeleton"] then
            surface.SetDrawColor( string.ToColor( ultimate.cfg.colors["Skeleton"] ) )

		    for i = 0, v.entity:GetBoneCount() - 1 do
                if (!v.entity:BoneHasFlag(i, BONE_USED_BY_HITBOX)) then continue end

			    local ParentId = v.entity:GetBoneParent(i)

			    if (!ParentId) then continue end

                if (!v.entity:BoneHasFlag(ParentId, BONE_USED_BY_HITBOX)) then continue end

                local BoneMatrix = v.entity:GetBoneMatrix(i)
                local ParentMatrix = v.entity:GetBoneMatrix(ParentId)

                if (!BoneMatrix or !ParentMatrix) then continue end

			    local BonePos = BoneMatrix:GetTranslation()

			    if (BonePos == v.entity:GetPos()) then continue end
                
			    local ParentPos = ParentMatrix:GetTranslation()

			    if (!BonePos or !ParentPos) then continue end

			    local screen1, screen2 = BonePos:ToScreen(), ParentPos:ToScreen()

			    surface.DrawLine(screen1.x, screen1.y, screen2.x, screen2.y)
		    end
        end

-- Функция для отрисовки хитбоксов фейковой модели
function ultimate.DrawFakeModelHitboxes()
    if not ultimate.cfg.vars["Hitbox"] then return end
    if not IsValid(ultimate.fakeModel) then return end
    if not pLocalPlayer:Alive() then return end
    if ultimate.hideHitboxes then return end -- Добавлена проверка на скрытие
    
    -- Обновляем модель если она изменилась
    local mymodel = pLocalPlayer:GetModel()
    if ultimate.newModel != mymodel then
        ultimate.fakeModel = ultimate.CS_Model(mymodel)
        ultimate.newModel = mymodel
    end

    -- Применяем анимацию и позицию из анти-айма
    local tbl = {
        layers = ultimate.fakeAngles.layers,
        angles = ultimate.fakeAngles.angle,
        sequence = ultimate.fakeAngles.seq,
        cycle = ultimate.fakeAngles.cycle,
        origin = ultimate.fakeAngles.origin,
        movex = ultimate.fakeAngles.movex,
        movey = ultimate.fakeAngles.movey,
    }
    ultimate.CS_Model_update(pLocalPlayer, ultimate.fakeModel, tbl)

    -- Отрисовка хитбоксов
    if ultimate.fakeModel:GetHitBoxGroupCount() != nil then
        cam.Start3D(EyePos(), EyeAngles())
            for group = 0, ultimate.fakeModel:GetHitBoxGroupCount() - 1 do 
                for hitbox = 0, ultimate.fakeModel:GetHitBoxCount(group) - 1 do
                    local bone = ultimate.fakeModel:GetHitBoxBone(hitbox, group)
                    if not bone then continue end
                    
                    local pos, ang = ultimate.fakeModel:GetBonePosition(bone)
                    if not pos then continue end
                    
                    local mins, maxs = ultimate.fakeModel:GetHitBoxBounds(hitbox, group)
                    render.DrawWireframeBox(
                        pos, 
                        ang, 
                        mins, 
                        maxs, 
                        string.ToColor(ultimate.cfg.colors["Hitbox"]), 
                        true
                    )
                end
            end
        cam.End3D()
    end
end

-- Добавляем в хуки
hook.Add("PostDrawOpaqueRenderables", "ultimate_DrawFakeHitboxes", ultimate.DrawFakeModelHitboxes)

-- Хук для скрытия хитбоксов по END
hook.Add("Think", "Ultimate_HideHitboxesKey", function()
    if input.IsKeyDown(KEY_END) then
        if not ultimate.hideKeyPressed then
            ultimate.hideHitboxes = not ultimate.hideHitboxes -- Переключаем состояние
            ultimate.hideKeyPressed = true
        end
    else
        ultimate.hideKeyPressed = false
    end
end)

        if ultimate.cfg.vars["Show records"] and ultimate.canBacktrack(v) then
            local len = #ultimate.btrecords[ v ]

            for i = 1, len do
                local pos = ( ultimate.btrecords[v][i].aimpos ):ToScreen()
                surface.SetDrawColor( ultimate.backtracktick == i and ultimate.Colors["Red"] or ultimate.Colors[255] )
                surface.DrawRect(pos.x,pos.y,2,2)
            end
        end

        if ultimate.cfg.vars["Backtrack skeleton"] and ultimate.canBacktrack(v) then
            local len = #ultimate.btrecords[ v ]

            surface.SetDrawColor( ultimate.Colors[255] )

            for i = 1, len do
                local data = ultimate.btrecords[ v ][ i ].skeleton

                for nbone = 1, #data do
                    local screen1, screen2 = data[nbone][1]:ToScreen(), data[nbone][2]:ToScreen()
        
                    surface.DrawLine(screen1.x,screen1.y,screen2.x,screen2.y)
                end
            end
        end
    end

    surface.SetAlphaMultiplier(1)
end


surface.CreateFont("DTFont", { font = "Verdana", size = 15, antialias = false, outline = true } )
surface.CreateFont("XVIDEOS FONT", { font = "Verdana", size = 45, antialias = false, shadow = true } )

ultimate.fovColor = Color( 255, 255, 255 )
ultimate.gradFov = false

hook.Add("PostDrawTranslucentRenderables", "DrawPlayerHat", function()
            if ultimate.cfg.vars["Player Hat"] and ultimate.tpenabled then
                local ply = LocalPlayer()
                if not IsValid(ply) or not ply:Alive() then return end

                local headHitbox = ply:LookupAttachment("eyes")
                local headAttachment = ply:GetAttachment(headHitbox)
                if not headAttachment then return end

                local headPos = headAttachment.Pos

                local radius = 10
                local height = 15  
                local baseOffset = 5  

                local coneTop = headPos + Vector(0, 0, height)
                local basePos = headPos + Vector(0, 0, baseOffset)

                cam.Start3D()

                    local segments = 16
                    for i = 1, segments do
                        local theta1 = ((i - 1) / segments) * 2 * math.pi
                        local theta2 = (i / segments) * 2 * math.pi

                        local x1 = math.cos(theta1) * radius
                        local y1 = math.sin(theta1) * radius
                        local x2 = math.cos(theta2) * radius
                        local y2 = math.sin(theta2) * radius

                        local base1 = basePos + Vector(x1, y1, 0)
                        local base2 = basePos + Vector(x2, y2, 0)

                        local time = CurTime() % 1
                        local color = HSVToColor(time * 360, 1, 1)

                        render.DrawLine(base1, coneTop, color, false)
                        render.DrawLine(base1, base2, color, false)
                    end
                cam.End3D()
            end
        end)



//ultimate.bgmaterial = Material( "a/paws.png", "noclamp smooth" )



do
    local lc = Color(125, 255, 64)    -- Основной цвет
    local blc = Color(255, 64, 125)   -- Акцентный цвет
    local indx, indy = screenWidth / 2 - 100, screenHeight/2 + 250
    local charge = 0

    local gradcolor, chargedcolor, unchargedcolor = Color(200,200,200,128), Color(0,255,128), Color(255,155,0)

    local chargestate, ccharge, chargecolor = "NO CHARGE", 200, chargedcolor


    function ultimate.DrawSomeShit()
            if ultimate.cfg.vars.Indicators then 
                surface.SetFont("DTFont") -- Используем тот же шрифт, что и в первом коде
                
                local latency = math.Round((ded.GetLatency(0) + ded.GetLatency(1)) * 1000)
                local currentlby = math.Round(ded.GetCurrentLowerBodyYaw(pLocalPlayer:EntIndex()))
                local targetlby = math.Round(ded.GetTargetLowerBodyYaw(pLocalPlayer:EntIndex()))
                local velocity = math.Round(pLocalPlayer:GetVelocity():Length2D())
                local choked = ded.GetChokedCommands()


                -- Lag Compensation (как в первом коде)
                surface.SetTextColor(pLocalPlayer.break_lc and blc or lc)
                surface.SetTextPos(15, screenHeight/2 - 45)
                surface.DrawText("LagCompensation")

                -- Fake Lag Ticks (аналог FakeLagTick из первого кода)
                surface.SetTextColor(choked > 1 and lc or blc)
                surface.SetTextPos(15, screenHeight/2 - 30)
                surface.DrawText(string.format("FakeLagTick: %i", choked))

                -- Speed (аналог Speed из первого кода)
                surface.SetTextColor(lc)
                surface.SetTextPos(15, screenHeight/2 - 15)
                surface.DrawText(string.format("Speed: %i", velocity))

                -- Ping (аналог Ping из первого кода)
                surface.SetTextColor(latency > 50 and blc or lc)
                surface.SetTextPos(15, screenHeight/2)
                surface.DrawText(string.format("Ping: %i ms", latency))

                -- Lower Body Yaw (аналог LowBodyYaw из первого кода)
                surface.SetTextColor(currentlby != targetlby and blc or lc)
                surface.SetTextPos(15, screenHeight/2 + 15)
                surface.DrawText(string.format("LowBodyYaw: %i (%i)", currentlby, targetlby))
            end
        

        
        if ultimate.cfg.vars["Auto Vape"] then
            surface.SetTextColor( ultimate.tyaga == 0 and blc or lc )
            surface.SetTextPos( 38,screenHeight-220 ) 
            surface.DrawText( "Vape: " ) 
            
            surface.SetDrawColor( 0, 0, 0 )
            surface.DrawRect( 78, screenHeight-219, 60, 14 )

            surface.SetDrawColor( lc )
            surface.DrawRect( 79, screenHeight-218, ultimate.tyaga / ultimate.maxvape * 58, 12 )
        end
        
        if ultimate.cfg.vars["Tickbase shift"] and ultimate.cfg.vars["Tickbase indicator"] then
            if ded.GetCurrentCharge() <= ultimate.cfg.vars["Shift ticks"] then
                ccharge = ded.GetCurrentCharge() * 196 / ultimate.cfg.vars["Shift ticks"]
            end

            charge = math.Approach(charge,ccharge,FrameTime()*700)

            if ded.GetCurrentCharge() == 0 then
                chargestate = "NO CHARGE"
                chargecolor = unchargedcolor
            elseif ded.GetCurrentCharge() < ultimate.cfg.vars["Shift ticks"] and ultimate.IsKeyDown( ultimate.cfg.binds["Auto recharge"] ) then
                chargestate = "CHARGING"
                chargecolor = unchargedcolor
            else
                chargestate = "READY"
                chargecolor = chargedcolor
            end

            local tw, th = surface.GetTextSize(chargestate)

            surface.SetDrawColor(ultimate.Colors[12])
            surface.DrawRect(indx,indy,200,30)

            surface.SetDrawColor(chargecolor) 
            surface.DrawRect(indx+2,indy+2,charge,26)

            surface.SetDrawColor( gradcolor )
            surface.SetMaterial( ultimate.Materials["Gradient right"] )
            surface.DrawTexturedRect( indx+2,indy+2,charge,26 )

            surface.SetTextColor( ultimate.Colors[245] )

            surface.SetTextPos( indx+2,indy-20 ) 
            surface.DrawText( "CHARGE "..ded.GetCurrentCharge() ) 

            surface.SetTextPos( indx+196-tw,indy-20 ) 
            surface.DrawText( chargestate ) 
        end

        local CT = CurTime()
        local FT = FrameTime() * 128

        if ultimate.cfg.vars["Hitmarker"] and #ultimate.hitmarkers > 0 then
            local hm = string.ToColor( ultimate.cfg.colors["Hitmarker"] ) 
    
            surface.SetDrawColor( hm )

            for i = #ultimate.hitmarkers, 1, -1  do
                local v = ultimate.hitmarkers[ i ]
    
                if v.time < CT - 1 then table.remove( ultimate.hitmarkers, i ) continue end 
    
                v.add = math.Approach( v.add, v.add - (CT - 1) * 5, FT )

                surface.DrawLine( ( screenWidth * 0.5 ) - v.add, ( screenHeight * 0.5 ) - v.add, ( screenWidth * 0.5 ) - 10 - v.add, ( screenHeight * 0.5 ) - 10 - v.add )
                surface.DrawLine( ( screenWidth * 0.5 ) + v.add, ( screenHeight * 0.5 ) - v.add, ( screenWidth * 0.5 ) + 10 + v.add, ( screenHeight * 0.5 ) - 10 - v.add )
                surface.DrawLine( ( screenWidth * 0.5 ) - v.add, ( screenHeight * 0.5 ) + v.add, ( screenWidth * 0.5 ) - 10 - v.add, ( screenHeight * 0.5 ) + 10 + v.add )
                surface.DrawLine( ( screenWidth * 0.5 ) + v.add, ( screenHeight * 0.5 ) + v.add, ( screenWidth * 0.5 ) + 10 + v.add, ( screenHeight * 0.5 ) + 10 + v.add )
            end
        end

        if ultimate.cfg.vars["Hitnumbers"] and #ultimate.hitnums > 0 then 
            local n, c = string.ToColor( ultimate.cfg.colors["Hitnumbers"] ), string.ToColor( ultimate.cfg.colors["Hitnumbers krit"] )
        
            surface.SetFont( "veranda_scr" )

            for i = #ultimate.hitnums, 1, -1 do
                local v = ultimate.hitnums[ i ]

                if v.time < CT - 1 then table.remove( ultimate.hitnums, i ) continue end 

                surface.SetTextColor( v.crit and c or n )

                v.add = math.Approach( v.add, v.add - (CT - 1) * 5, FT / 2 )

                surface.SetTextPos( ( screenWidth * 0.5 ) - v.add * v.xdir, ( screenHeight * 0.5 ) - v.add * v.ydir )
                surface.DrawText( v.dmg )
            end
        end

        if ultimate.cfg.vars["Fov limit"] and ultimate.cfg.vars["Show FOV"] then 
            local col = string.ToColor( ultimate.cfg.colors["Show FOV"] )
            
            local radius = ultimate.GetFovRadius()
        
            surface.SetDrawColor( 0, 0, 0, 128 )
            surface.DrawCircle( ( screenWidth * 0.5 ), ( screenHeight * 0.5 ), radius + 1 )

            surface.SetDrawColor( col.r, col.g, col.b )
            surface.DrawCircle( ( screenWidth * 0.5 ), ( screenHeight * 0.5 ), radius )

            surface.SetDrawColor( 0, 0, 0, 128 )
            surface.DrawCircle( ( screenWidth * 0.5 ), ( screenHeight * 0.5 ), radius - 1 )
        end

        if ultimate.target and ultimate.targetVector then
            if ultimate.cfg.vars["Aimbot snapline"] then 
                local pos = ultimate.targetVector:ToScreen()
                surface.SetDrawColor( string.ToColor( ultimate.cfg.colors["Aimbot snapline"] ) )
                surface.DrawLine( pos.x, pos.y, ( screenWidth * 0.5 ), ( screenHeight * 0.5 ) )
            end
    
            if ultimate.cfg.vars["Aimbot marker"] then 
                local pos = ultimate.targetVector:ToScreen()

                surface.SetDrawColor( 0, 0, 0 )
                surface.DrawRect( pos.x - 6, pos.y - 6, 5, 3 )
                surface.DrawRect( pos.x + 2, pos.y - 6, 5, 3 )

                surface.DrawRect( pos.x - 6, pos.y + 4, 5, 3 )
                surface.DrawRect( pos.x + 2, pos.y + 4, 5, 3 )

                surface.DrawRect( pos.x - 6, pos.y - 6, 3, 5 )
                surface.DrawRect( pos.x + 4, pos.y - 6, 3, 5 )

                surface.DrawRect( pos.x - 6, pos.y + 2, 3, 5 )
                surface.DrawRect( pos.x + 4, pos.y + 2, 3, 5 )

                surface.SetDrawColor( string.ToColor( ultimate.cfg.colors["Aimbot marker"] ) )
                
                surface.DrawRect( pos.x - 5, pos.y - 5, 3, 1 )
                surface.DrawRect( pos.x + 3, pos.y - 5, 3, 1 )

                surface.DrawRect( pos.x - 5, pos.y + 5, 3, 1 )
                surface.DrawRect( pos.x + 3, pos.y + 5, 3, 1 )

                surface.DrawRect( pos.x - 5, pos.y - 5, 1, 3 )
                surface.DrawRect( pos.x + 5, pos.y - 5, 1, 3 )

                surface.DrawRect( pos.x - 5, pos.y + 3, 1, 3 )
                surface.DrawRect( pos.x + 5, pos.y + 3, 1, 3 )

            end
        end
        

        surface.SetFont( "veranda" )

        if ultimate.cfg.vars[ "On screen logs" ] and table.Count( ultimate.onScreenLogs ) > 0 then
            local tick = engine.TickCount()
            local x, y = screenWidth / 2, screenHeight / 2 + 45 
    
            for k, v in pairs( ultimate.onScreenLogs ) do

                if ultimate.TICKS_TO_TIME( tick - ultimate.onScreenLogs[ k ].tick ) > 8 then
                    ultimate.onScreenLogs[ k ] = nil
                    continue 
                end

                local data = ultimate.onScreenLogs[ k ]
                local fstr = ""
    
                for o = 1, #data[ 1 ] do
                    fstr = fstr .. data[ 1 ][ o ]
                end
    
                local tw, th = surface.GetTextSize( fstr )
    
                x = x - tw / 2
                
                for p = 1, #data[ 1 ] do
                    local str = data[ 1 ][ p ]
                    tw, th = surface.GetTextSize( str )
    
                    surface.SetTextPos( x, y )
                    surface.SetTextColor( data[ 2 ][ p ] )
                    surface.DrawText( str )
    
                    x = x + tw
                end
    
                x, y = screenWidth / 2, y + th
            end
        end
        if ultimate.cfg.vars["WaterMark"] then

            local playerName = IsValid(pLocalPlayer) and pLocalPlayer:Name() or "DISCONNECTED"
            local txt = "AK47HACK.PUB  ◆  " .. playerName .. "  ◆  v3.0  ◆  UID:1"

            -- Получаем размер текста
            surface.SetFont("Watermark_Bold")
            local txtWidth, txtHeight = surface.GetTextSize(txt)

            -- Параметры отступов (увеличены для лучшего отображения)
            local paddingX = 30
            local paddingY = 10
            local x, y = 15, 15 -- Сдвигаем от краев

            -- Цвета (увеличена контрастность)
            local bgColor = Color(10, 10, 15, 240) -- Более темный фон
            local accentColor = Color(0, 180, 255)  -- Яркий неоновый акцент
            local textColor = Color(255, 255, 255)  -- Чистый белый текст
            local shadowColor = Color(0, 0, 0, 150) -- Тень для текста

            -- 1. Основной фон с увеличенными размерами
            draw.RoundedBox(4, x, y, txtWidth + paddingX, txtHeight + paddingY, bgColor)

            -- 2. Акцентная полоса сверху
            surface.SetDrawColor(accentColor)
            surface.DrawRect(x, y, txtWidth + paddingX, 2)

            -- 3. Обводка
            surface.SetDrawColor(accentColor.r, accentColor.g, accentColor.b, 40)
            surface.DrawOutlinedRect(x, y, txtWidth + paddingX, txtHeight + paddingY)

            -- 4. Текст с тенью (для лучшей читаемости)
            draw.SimpleText(txt, "Watermark_Bold", x + paddingX/2 + 1, y + paddingY/2 + 1, shadowColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            draw.SimpleText(txt, "Watermark_Bold", x + paddingX/2, y + paddingY/2, textColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

            -- 5. Декоративные элементы по бокам
            local pulse = math.sin(CurTime() * 3) * 0.2 + 0.8
            surface.SetDrawColor(accentColor.r * pulse, accentColor.g * pulse, accentColor.b * pulse, 255)
            surface.DrawRect(x + 5, y + txtHeight + paddingY - 4, 10, 2)
            surface.DrawRect(x + txtWidth + paddingX - 15, y + txtHeight + paddingY - 4, 10, 2)

            -- 6. Иконка (если есть) или символ
            local iconSize = 14
            if file.Exists("materials/icon16/shield.vmt", "GAME") then
                surface.SetMaterial(Material("icon16/shield"))
                surface.SetDrawColor(textColor)
                surface.DrawTexturedRect(x + 8, y + (txtHeight + paddingY - iconSize)/2, iconSize, iconSize)
            else
                draw.SimpleText("✦", "Watermark_Symbols", x + 15, y + (txtHeight + paddingY)/2 + 1, accentColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            end
        end


        if ultimate.cfg.vars["RusEliteDetector"] then
                hook.Add("Think", "Ultimate_AutoWeaponDistance", function()
                if not ultimate or not ultimate.cfg or not ultimate.cfg.vars then return end

                local ply = LocalPlayer()
                if not IsValid(ply) then return end

                local wep = ply:GetActiveWeapon()
                if not IsValid(wep) then return end

                local class = wep:GetClass()

                if string.StartWith(class, "knife_" ) then
                    ultimate.cfg.vars["Max distance"] = 70 
                elseif string.StartWith(class, "swb_") then
                    ultimate.cfg.vars["Max distance"] = 130 
                elseif string.StartWith(class, "umb_") then
                    ultimate.cfg.vars["Max distance"] = 300
                else
                    ultimate.cfg.vars["Max distance"] = 4096
                end
            end)
        end        


        local plys = player.GetAll()

        if ultimate.cfg.vars["Spectator list"] then
                local y = screenHeight / 2
                local pLocalPlayer = LocalPlayer()
    
            for i = 1, #plys do
                    local v = ultimate.playerCache[plys[i]]
        
                if not v then continue end
                if v.ObserverMode == 0 then continue end 
                if not IsValid(v.entity) then continue end  -- Проверка, что ентити существует
                if not IsValid(v.ObserverTarget) then continue end  -- Проверка, что цель наблюдения существует
        
                    local spectatorName = v.entity:Name() or "Unknown"  -- На всякий случай
                    local targetName = v.ObserverTarget:Name() or "Unknown"
        
                    local text = spectatorName .. " spectating " .. targetName
                    local textWidth = surface.GetTextSize(text)
        
                    -- Цвет: красный, если следят за локальным игроком, иначе белый
                    local textColor = (v.ObserverTarget == pLocalPlayer) and Color(255, 0, 0) or Color(255, 255, 255)
        
                    surface.SetTextPos(screenWidth - textWidth - 15, y)
                    surface.SetTextColor(textColor)
                    surface.DrawText(text)
        
                y = y + 15
            end
        end 

        



        
    end
    
   
    
end


hook.Add("PostDrawTranslucentRenderables", "DrawKnifebotRange", function()
    if ultimate.cfg.vars["Knifebot Range"] and ultimate.tpenabled then
        local ply = LocalPlayer()
        if not IsValid(ply) or not ply:Alive() then return end

        -- Получаем позицию на уровне живота
        local pelvisBone = ply:LookupBone("ValveBiped.Bip01_Pelvis")
        local centerPos = ply:GetPos() + Vector(0, 0, 15)
        
        if pelvisBone then
            centerPos = ply:GetBonePosition(pelvisBone) or centerPos
        end

        local radius = 48
        local segments = 32
        local time = CurTime() % 1
        local color = HSVToColor(time * 360, 1, 1) -- Сохраняем радужный эффект

        cam.Start3D()
            -- Рисуем только внешний круг
            for i = 1, segments do
                local theta1 = ((i - 1) / segments) * 2 * math.pi
                local theta2 = (i / segments) * 2 * math.pi

                local x1 = math.cos(theta1) * radius
                local y1 = math.sin(theta1) * radius
                local x2 = math.cos(theta2) * radius
                local y2 = math.sin(theta2) * radius

                local pos1 = centerPos + Vector(x1, y1, 0)
                local pos2 = centerPos + Vector(x2, y2, 0)

                render.DrawLine(pos1, pos2, color, false)
            end
        cam.End3D()
    end
end)


/*
hook.Add( "PostDrawTranslucentRenderables", "test", function()
    if ultimate.targetVector then
        render.DrawWireframeSphere( ultimate.targetVector, 0.5, 10, 10, Color( 255, 0, 64 ) )
    end
end)
*/


ultimate.kd = false
function ultimate.togglevisible()
    if ultimate.frame:IsVisible() then
        ultimate.frame:SetVisible(false)

        if ultimate.ui.MultiComboP then ultimate.ui.RemovePanel( ultimate.ui.MultiComboP ) end
        if ultimate.ui.ColorWindow then ultimate.ui.RemovePanel( ultimate.ui.ColorWindow ) end
        if ultimate.ui.SettingsPan then ultimate.ui.RemovePanel( ultimate.ui.SettingsPan ) end

        RememberCursorPosition()

        if ultimate.validsnd then ultimate.validsnd:Pause() end
    else
        ultimate.frame:SetVisible(true)

        RestoreCursorPosition()
        if ultimate.validsnd then ultimate.validsnd:Play() end
    end
end

function ultimate.PrePlayerDraw( pEntity, iFlags )
    if ( pEntity == pLocalPlayer ) then
        return 
    end

    pEntity:AnimResetGestureSlot( GESTURE_SLOT_VCD )
    pEntity:AnimResetGestureSlot( GESTURE_SLOT_CUSTOM )

    pEntity:SetPoseParameter( "head_pitch", 0 )
    pEntity:SetPoseParameter( "head_yaw", 0 )

    if ( ultimate.cfg.vars["Resolver"] ) then
        local angs = Angle()
        angs.y = ultimate.bruteYaw[ pEntity.aimshots % #ultimate.bruteYaw + 1 ] + pEntity:EyeAngles().y

        pEntity:SetRenderAngles( angs )

        ded.SetCurrentLowerBodyYaw( pEntity:EntIndex(), angs.y )  
    end

    if ( ultimate.cfg.vars["Pitch resolver"] and pEntity.fakepitch ) then
        pEntity:SetPoseParameter( "aim_pitch", -89 )
        pEntity:SetPoseParameter( "head_pitch", -89 )
    end
    
    pEntity:InvalidateBoneCache()
    pEntity:SetupBones()

    pEntity.ChatGestureWeight = 0
end

// Chams

CreateMaterial("flat", "VertexLitGeneric") 
CreateMaterial("flat_z", "VertexLitGeneric", {
    ["$ignorez"] = 1
} )

CreateMaterial( "selfillum", "VertexLitGeneric", {
    ["$basetexture"] = "vgui/white_additive",
    ["$bumpmap"] = "vgui/white_additive",
    ["$model"] = "1",
    ["$nocull"] = "0",
    ["$selfillum"] = 1,
    ["$selfIllumFresnel"] = 1,
    ["$selfIllumFresnelMinMaxExp"] = "[0.0 0.3 0.6]",
    ["$selfillumtint"] = "[0 0 0]",
} )

CreateMaterial( "selfillum_z", "VertexLitGeneric", {
    ["$basetexture"] = "vgui/white_additive",
    ["$bumpmap"] = "vgui/white_additive",
    ["$model"] = "1",
    ["$nocull"] = "0",
    ["$selfillum"] = 1,
    ["$selfIllumFresnel"] = 1,
    ["$selfIllumFresnelMinMaxExp"] = "[0.0 0.3 0.6]",
    ["$selfillumtint"] = "[0 0 0]",
    ["$ignorez"] = 1,
} )

CreateMaterial( "selfillum_a", "VertexLitGeneric", {
    ["$basetexture"] = "vgui/white_additive",
    ["$bumpmap"] = "vgui/white_additive",
    ["$model"] = "1",
    ["$nocull"] = "1",
    ["$nodecal"] = "1",
    ["$additive"] = "1",
    ["$selfillum"] = 1,
    ["$selfIllumFresnel"] = 1,
    ["$selfIllumFresnelMinMaxExp"] = "[0.0 0.3 0.6]",
    ["$selfillumtint"] = "[0 0 0]",
} )

CreateMaterial( "selfillum_a_z", "VertexLitGeneric", {
    ["$basetexture"] = "vgui/white_additive",
    ["$bumpmap"] = "vgui/white_additive",
    ["$model"] = "1",
    ["$nocull"] = "1",
    ["$nodecal"] = "1",
    ["$additive"] = "1",
    ["$selfillum"] = 1,
    ["$selfIllumFresnel"] = 1,
    ["$selfIllumFresnelMinMaxExp"] = "[0.0 0.3 0.6]",
    ["$selfillumtint"] = "[0 0 0]",
    ["$ignorez"] = 1,
} )

CreateMaterial("wireframe", "VertexLitGeneric", {
	["$wireframe"] = 1,
})
CreateMaterial("wireframe_z", "VertexLitGeneric", {
	["$wireframe"] = 1,
    ["$ignorez"] = 1,
})

CreateMaterial("metallic", "VertexLitGeneric", {
	["$envmap"] = "env_cubemap",
    ["$envmaptint"] = "[ 0 1 1 ]",
    ["$envmapfresnel"] = "1",
    ["$alpha"] = "0.5",
})

CreateMaterial("metallic_z", "VertexLitGeneric", {
    ["$envmap"] = "env_cubemap",
    ["$envmaptint"] = "[ 0 1 1 ]",
    ["$envmapfresnel"] = "1",
    ["$alpha"] = "0.5",
    ["$ignorez"] = 1,
})

ultimate.chamMats = {
    vis = {
        Material("!flat"), -- flat
        Material("!wireframe"), -- wireframe
        Material("!selfillum"), -- glow
        Material("!selfillum_a"), -- glow outline
        Material("!metallic"), -- metallic
        Material("effects/nightvision"), -- _rt_fullframefb
        Material("effects/flashbang"), -- _rt_fullframefb
    },
    invis = {
        Material("!flat_z"), -- flat
        Material("!wireframe_z"), -- wireframe
        Material("!selfillum_z"), -- glow
        Material("!selfillum_a_z"), -- glow outline
        Material("!metallic_z"), -- metallic
        Material("effects/nightvision"), -- _rt_fullframefb
        Material("effects/flashbang"), -- _rt_fullframefb
    }
}
 
do
    local f = (1/255)

    function ultimate.RenderScreenspaceEffects()
        if ultimate.UnSafeFrame then return end

        if ultimate.cfg.vars["Color Modify"] then 
            local rse = {
                [ "$pp_colour_addr" ] = ultimate.cfg.vars["Color Modify Add Red"],
                [ "$pp_colour_addg" ] = ultimate.cfg.vars["Color Modify Add Green"],
                [ "$pp_colour_addb" ] = ultimate.cfg.vars["Color Modify Add Blue"],
                [ "$pp_colour_brightness" ] = ultimate.cfg.vars["Color Modify Brightness"],
                [ "$pp_colour_contrast" ] = ultimate.cfg.vars["Color Modify Contrast"],
                [ "$pp_colour_colour" ] = ultimate.cfg.vars["Color Modify Saturation"],
                [ "$pp_colour_mulr" ] = ultimate.cfg.vars["Color Modify Mul Red"],
                [ "$pp_colour_mulg" ] = ultimate.cfg.vars["Color Modify Mul Green"],
                [ "$pp_colour_mulb" ] = ultimate.cfg.vars["Color Modify Mul Blue"]
            }
            DrawColorModify( rse )
        end

        local vm, invm = ultimate.cfg.vars["Visible mat"], ultimate.cfg.vars["inVisible mat"]
        local sin = math.floor( math.sin( CurTime() * 4 ) * 45 )

        local vc = string.ToColor(ultimate.cfg.colors["Visible chams"])
        local invc = string.ToColor(ultimate.cfg.colors["inVisible chams"])
        local sc = string.ToColor(ultimate.cfg.colors["Self chams"])
        
        cam.Start3D()
            for k, v in pairs(player.GetAll()) do
                if not IsValid(v) or v == pLocalPlayer or not v:Alive() or v:IsDormant() then continue end 

                if ultimate.cfg.vars["Supress lighting"] then
                    render.SuppressEngineLighting(true)
                end

                if ultimate.cfg.vars["inVisible chams"] then
                    ultimate.chamMats.invis[6]:SetVector( "$envmaptint", Vector( invc.r / 255, invc.g / 255, invc.b / 255 ) )
                    render.MaterialOverride(ultimate.chamMats.invis[invm])
                    render.SetColorModulation(invc.r/255,invc.g/255,invc.b/255) 

                    if invm == 7 then
                        render.SetBlend( (sin + 100) / 255 )
                    end

                    v:SetRenderMode(1)
                    v:DrawModel()

                    if ultimate.cfg.vars["inVisible chams w"] then 
                        local w = v:GetActiveWeapon()
                        if IsValid(w) then w:DrawModel() end
                    end
                end

                if ultimate.cfg.vars["Visible chams"] then
                    ultimate.chamMats.vis[6]:SetVector( "$envmaptint", Vector( vc.r / 255, vc.g / 255, vc.b / 255 ) )
                    render.MaterialOverride(ultimate.chamMats.vis[vm])
                    render.SetColorModulation(vc.r/255,vc.g/255,vc.b/255)

                    if vm == 7 then
                        render.SetBlend( (sin + 100) / 255 )
                    end

                    v:DrawModel()

                    if ultimate.cfg.vars["Visible chams w"] then 
                        local w = v:GetActiveWeapon()
                        if IsValid(w) then w:DrawModel() end
                    end
                end

                if ultimate.cfg.vars["Supress lighting"] then
                    render.SuppressEngineLighting(false)
                end

            end

            if ultimate.cfg.vars["Self chams"] and IsValid(pLocalPlayer) and pLocalPlayer:Alive() then

                if ultimate.cfg.vars["Supress self lighting"] then
                    render.SuppressEngineLighting(true)
                end

                ultimate.chamMats.invis[6]:SetVector( "$envmaptint", Vector( sc.r / 255, sc.g / 255, sc.b / 255 ) )
                render.MaterialOverride(ultimate.chamMats.vis[ultimate.cfg.vars["Self mat"]])
                render.SetColorModulation(sc.r/255,sc.g/255,sc.b/255)

                if ultimate.cfg.vars["Self mat"] == 7 then
                    render.SetBlend( (sin + 100) / 255 )
                end

                pLocalPlayer:SetRenderMode(1)
                pLocalPlayer:DrawModel()

                if ultimate.cfg.vars["Self chams w"] then 
                    local w = pLocalPlayer:GetActiveWeapon()
                    if IsValid(w) then w:DrawModel() end
                end
              
                if ultimate.cfg.vars["Supress self lighting"] then
                    render.SuppressEngineLighting(false)
                end

            end

            


        cam.End3D()

        render.SetColorModulation(1, 1, 1)
        render.SetBlend(1)
        render.MaterialOverride()
    end
end


// Client side models 

function ultimate.CS_Model(mdl)
    local model = ClientsideModel(mdl)
	model:SetNoDraw(true)

    return model
end

function ultimate.CS_Model_update(ply,model,tbl)
    if !ply or !model or !tbl then return end

    local mdl = model
    local playerModel = ply:GetModel()
    local layers = tbl.layers 

    for i = 0, 13 do
        if mdl:IsValidLayer(i) then
            local l = layers[i]
            mdl:SetLayerCycle(l.cycle)
            mdl:SetLayerSequence(l.sequence)
            mdl:SetLayerWeight(l.weight)
        end
    end

    mdl:SetSequence(tbl.sequence)
    mdl:SetCycle(tbl.cycle)

    mdl:SetPoseParameter("aim_pitch", tbl.angles.p)
	mdl:SetPoseParameter("head_pitch", 0)
	mdl:SetPoseParameter("body_yaw", tbl.angles.y)
	mdl:SetPoseParameter("aim_yaw", 0)
		
	mdl:SetPoseParameter("move_x", tbl.movex)
	mdl:SetPoseParameter("move_y", tbl.movey)

    mdl:SetAngles( Angle( 0, tbl.angles.y, 0 ) )
    mdl:SetModel( playerModel )
	mdl:SetPos( tbl.origin )
end

function ultimate.PostDrawTranslucentRenderables()
    if ultimate.UnSafeFrame then return end

    ultimate.drawCSModels_backtrack()
    ultimate.drawCSModels_real()

    render.SetBlend(1)
    render.MaterialOverride()
end


// Backtracking 

ultimate.btrecords = {}
ultimate.predicted = {}

















function ultimate.canBacktrack(ply)
    if not ultimate.cfg.vars["Backtrack"] then return false end 
    if not IsValid(ply) then return false end
    if not ultimate.btrecords[ply] then return false end 
    if ply.break_lc then return false end 

    return true 
end

function ultimate.recordBacktrack(ply)
	local deadtime = CurTime() - ultimate.cfg.vars["Backtrack time"] / 1000
	
	local records = ultimate.btrecords[ply]

	if !records then
        records = {}
		ultimate.btrecords[ply] = records
	end
	
	local i = 1
	while i < #records do
		local record = records[i]
		
		if record.simulationtime < deadtime then
			table.remove(records, i)
			i = i - 1
		end
		
		i = i + 1
	end
	
	if !ply:Alive() then return end
    if ply.break_lc then return end
	
	local simulationtime = ded.GetSimulationTime(ply:EntIndex())
	local len = #records
	local simtimechanged = true

	if len > 0 then
		simtimechanged = records[len].simulationtime < simulationtime
	end
	
	if !simtimechanged then return end

	local layers = {}
	for i = 0, 13 do
		if ply:IsValidLayer(i) then
			layers[i] = {
				cycle = ply:GetLayerCycle(i),
				sequence = ply:GetLayerSequence(i),
				weight = ply:GetLayerWeight(i)
			}
		end
	end

    local eyeAngles = ply:EyeAngles()
    local x,y = eyeAngles.x, eyeAngles.y

    local bdata = {}
    for i = 0, ply:GetBoneCount() - 1 do
        local v, a = ply:GetBonePosition( i )
        bdata[i] = { vec = v, ang = a }
    end

    local hdata = {}
    local hset = ply:GetHitboxSet()
    local hnum = ply:GetHitBoxCount( hset )
    
    for hitbox = 0, hnum - 1 do
        local bone = ply:GetHitBoxBone( hitbox, hset )
  
        if bone == nil then continue end

        local mins, maxs = ply:GetHitBoxBounds( bone, hset )

        if not mins or not maxs then continue end 

        local bonepos, ang = ply:GetBonePosition( bone )  
        mins:Rotate( ang )
        maxs:Rotate( ang )

        hdata[ #hdata + 1 ] = { pos = bonepos, mins = mins, maxs = maxs }
    end

    local skeletondata = {}

    /*
    for i = 0, ply:GetBoneCount() - 1 do

        local parent = ply:GetBoneParent(i)

        if(!parent) then continue end

        local bonepos = ply:GetBonePosition(i)

        if(bonepos == ply:GetPos() ) then continue end

        local parentpos = ply:GetBonePosition(parent)

        if(!bonepos or !parentpos) then continue end

        skeletondata[ 1 ] = bonepos:ToScreen()
        skeletondata[ 2 ] = parentpos:ToScreen()
    end
    */

	records[len + 1] = {
		simulationtime =    ded.GetSimulationTime(ply:EntIndex()),
		angles =            Angle(x,y,0),
		origin =            ply:GetNetworkOrigin(),
		aimpos =            ultimate.GetBones( ply )[1],
		sequence =          ply:GetSequence(),
		cycle =             ply:GetCycle(),
		layers =            layers,
        movex =             ply:GetPoseParameter("move_x"),
        movey =             ply:GetPoseParameter("move_y"),
        bonedata =          bdata,
        //hitboxdata =        hdata,
        //skeleton =          skeletondata
    }
end

ultimate.btmodel = ultimate.CS_Model("models/player/kleiner.mdl")

function ultimate.drawCSModels_backtrack()
    if not ultimate.cfg.vars["Backtrack chams"] then return end 
    if not ultimate.canBacktrack(ultimate.target) then return end

    local len = #ultimate.btrecords[ultimate.target]
    local tbl = ultimate.btrecords[ultimate.target][ultimate.backtracktick]
    local m = ultimate.btmodel

    ultimate.CS_Model_update(ultimate.target,m,tbl)

    if ultimate.cfg.vars["Backtrack fullbright"] then
        render.SuppressEngineLighting(true)
    end

    local col = string.ToColor(ultimate.cfg.colors["Backtrack chams"])
    ultimate.chamMats.invis[6]:SetVector( "$envmaptint", Vector( col.r / 255, col.g / 255, col.b / 255 ) )
    render.MaterialOverride(ultimate.chamMats.invis[ultimate.cfg.vars["Backtrack material"]]) 
    render.SetColorModulation(col.r/255,col.g/255,col.b/255)
    m:SetRenderMode(1)
    m:DrawModel()

    if ultimate.cfg.vars["Backtrack fullbright"] then
        render.SuppressEngineLighting(false)
    end
end

ultimate.hitmarkers = {}
ultimate.hitnums = {}

gameevent.Listen( "player_hurt" )

function ultimate.player_hurt(data)
    local health = data.health
	local priority = SERVER and data.Priority or 5
	local hurted = Player( data.userid )
	local attackerid = data.attacker

	if attackerid == pLocalPlayer:UserID() then
        
        if ultimate.cfg.vars[ "On screen logs" ] then
            local hlcolor = string.ToColor( ultimate.cfg.colors[ "On screen logs" ] )
            local data = {
                tick = engine.TickCount(),
                {
                    "Hit ",
                    hurted:Name(),
                    " for ",
                    hurted:Health() - health,
                    " damage"
                },
                {
                    ultimate.HitLogsWhite,
                    hlcolor,
                    ultimate.HitLogsWhite,
                    hlcolor,
                    ultimate.HitLogsWhite,
                }
            }
            
            ultimate.onScreenLogs[ engine.TickCount() ] = data
            //print( "hurt", engine.TickCount() )
        end

        if ultimate.cfg.vars["Hitmarker"] then
            ultimate.hitmarkers[ #ultimate.hitmarkers + 1 ] = { time = CurTime(), add = 0 }
        end

        if ultimate.cfg.vars["Hitnumbers"] then
            local hp = hurted:Health() - health
            ultimate.hitnums[ #ultimate.hitnums + 1 ] = { time = CurTime(), add = 0, xdir = math.random(-1,1), ydir = math.random(-1,1), dmg = hp, crit = health <= 0 }
        end

        if ultimate.cfg.vars["Hitsound"] then
            surface.PlaySound( ultimate.cfg.vars["Hitsound str"] )
        end

        if ultimate.cfg.vars["Resolver"] then 
            hurted.aimshots = (hurted.aimshots or 0) - 1
        end

    end
end

/*
    Player vars 
*/

function ultimate.initPlayerVars( v )
    v.ult_prev_pos = Vector()

    v.ult_prev_simtime = 0 
    v.flticks = 0 
    v.aimshots = 0
    v.missedanimticks = 0

    v.break_lc = false 
    v.simtime_updated = false 
    v.fakepitch = false

    ultimate.btrecords[ v ] = {}
    ultimate.predicted[ v ] = {}
end

for k, v in ipairs(player.GetAll()) do
	ultimate.initPlayerVars( v )
end


ultimate.chatmsg = 
{
        [1] = {
    "%s, еба тя расплющило жирнич", 
    "%s, 《AK•47•KILLER》☆",
    "%s, Теперь я - Ютубер Truckach (◣_◢)",
    "%s, FIX KD NN DOGGO", 
    "%s, طلقه واحده هههههههههه",
    "%s, Я играю на лайфхакерском конфиге от Серёжи (◣_◢)",
    "%s, нищий улетел", 
    "%s, *忍び 1 УПАЛ び忍", 
    "%s, ХАХАХАХАХХАХА НИЩИЙ УЛЕТЕЛ (◣_◢)",
    "%s, я ķ¤нɥåλ ϯβ¤£ü ɱåɱķ£ β Ƥ¤ϯ", 
    "%s, ⒶaŴÞ ︻デ═一 -™",
    "%s, Желток в деле! Белок на пределе! (◣_◢)",
    "%s, опущены стяги, легион и.. А БЛЯТЬ ТЫЖ ТУТ ОПУЩ НАХУЙ ПХГАХААХАХАХАХА)))))))", 
    "%s, але ты там из хрущевки выеди а потом выпрыгивай блять", 
    "%s, ебать ты красиво на бутылку упал",
    "%s, ты как ваще живешь в коробке 1х1м где ты деньги на акк взял нищ ахахах",
    "%s, ╭∩╮(◣_◢)╭∩╮",
    "%s, co‌mm‌it‌ n‌ec‌k ‌ro‌pe‌ u‌r ‌to‌o ‌ba‌d ‌xa‌xa", 
    "%s, op‌ti‌on‌s ‌=>‌ h‌ow‌ t‌o ‌pl‌ay", 
    "%s, who (кто) you (ты) ватофак мен))",
    "%s, ->‌> ‌si‌rg‌ay‌zo‌rh‌ac‌k.‌pw‌/в‌оз‌вр‌ат‌де‌не‌г.‌ph‌p ‌«‌-", 
    "%s, в окно паунс сделай у тя даже юида нету ЛОООЛ",
    "%s, better buy the sergayzorhack!", 
    "%s, земля те землей хуй до чиста еденицей отлетел))",
    "%s, 8====={Headshot beath]==0", 
    "%s,  $$$ 1 TAP UFF YA $$$ ∩ ( ͡⚆ ͜ʖ ͡⚆) ∩",
    "%s, ху‌я ‌ты‌ н‌а ‌бу‌ты‌лк‌у ‌уп‌ал‌ х‌ах‌ах‌ах‌а", 
    "%s, I'm not using sergayzorhack.pw, you're just bad",
    "%s, мн‌е ‌по‌ху‌й ‌на‌ к‌ри‌ти‌ку‌ о‌че‌ре‌дн‌ог‌о ‌ны‌ти‌ка‌, ‌со‌ м‌но‌й ‌мо‌и ‌лю‌ди‌, ‌мо‌й ‌ра‌йо‌н,‌ м‌оя‌ ",  
    "%s, AHXAAP!! oNe.TaP.!*", 
    "%s, cya @ dog", 
    "%s, Я играю на вкуснейшем конфиге от Серёжи ツ", 
    "%s, как ты на пк накопил даже не знаю )))))))))", 
    "%s, ✘︎NeveR●︎Give●︎Up✘︎ヅ", 
    "%s, найс 0.5х0.5м комната блять ХАХАХАХА ТЫ ТАМ ЖЕ ДАЖЕ ПОВЕСИТЬСЯ НЕ МОЖЕШЬ МЕСТА НЕТ ПХПХПХППХ", 
    "%s, (っ◔◡◔)っ ❤️Ace Awp❤", 
    "%s, THIS IS OMLEEEEEEET (◣◢)", 
    "%s, ● Loading sergayzorhack... ] 99.9%", 
    "%s, デ ︻ ₳₭-❹❼ ���", 
    "%s, VAAAAAAAC в чат!!! (づ ◕‿◕ )づ", 
    "%s, AWPutin༻︻デ 一",
    "%s, LIFEEEEHAAAACK BITCH!!! (◣_◢)", 
    "%s, AHAHAHHAAH (◣_◢)",
    "%s, а у вас походу умирать это семейное)", 
    "%s, нахуя пидораса убил?", 
    "%s, чао персик дозревай", 
    "%s, уважаемый в тюрьме вы будете водолазом",
    "%s, говори буду плохо говорить буду сосать, буду плохо сосать буду пересасывать", 
    "%s, долбаеб иди башмачки в сундучок школьный собирай", 
    "%s, ботинок ебаный чо слетел", 
    "%s, братик маме привет передай",
    "%s, не противник",
    "%s, а ты че клоун???", 
    "%s, я обоссал тебя (", 
    "%s, ты че там отлетел то?",
    "%s, упал хуета ебаная , но в боди забрал да похуй все равно упал",
    "%s, *DEAD* ливай с хвх (", 
    "%s, до связи башмак",
    "%s, нищета глупейшая играть учись", 
    "%s, опущен сын твари",
    "%s, нищий улетел", 
    "%s, *DEAD* пофикси нищ", 
    "%s, сразу видно кфг иссуе мб конфиг у меня прикупишь ?",
    "%s, животное аддон скачай а то падаешь", 
    "%s, оттарабанен армянская королева", 
    "%s, сука не позорься и ливни",
    "%s, улетел тапочек ебаный", 
    "%s, единицей свалился фуфлыжник",
    "%s, зачем ты играешь тут безмозглый", 
    "%s, иди кумыса попей очередняра",
    "%s, откисай сочняра", 
    "%s, АХАХА ЕБАТЬ У ТЕБЯ ЧЕРЕПНАЯ КОРОБКА ПРЯМ КАК HVH #1 * M9K * CSS * RU",
    "%s, на Truckach.tech то деньги есть????", 
    "%s, ИЩИ СЕБЯ НА https://www.youtube.com/@Truckach",
    "%s, свежий кабанчик", 
        },
        [2] = {
            "я ЂÖг ₸ӹ ԉÖχ",
            "I am ♛ you noob",
            "{X}o4y kak PR0™ moGy kak DNO",
            "(‿!‿) Попа ищет ПрИкЛюченИй•",
            "٠●•۩۞۩[̲̲̅И̲̅Д̲̅И̲̲̅(ٿ)̲̅H̲̅A̲̅X̲̅У̲̅Й]۩۞۩•●٠",
            "DOLBIT N0RMALNO",
            "♛Truckach♛.CFG injecting",
            "Держи ✈ и лети нахуй !",
            "(Ауф)ᶜʸᵇᵉʳˢᵖᵒʳᵗЯ VIP А ТЫ RIP",
            "Следующая остановка – голова",
            "ᵗᵠ ᵉᵇᵃⁿᵘˡˢʸᵃ?",
            "!!!!ОР ВЫШЕ ГОР!!!!",
            "-===≡≡≡( ͝° ͜ʖ͡°) сперма летит тебе в FACE",
            "(っ´ཀ`)っ  ⋃  соси!!1",
            "★А мНе ВсЁ пОфИг★",
            "ОРЕЛ-КАВКАЗА ЛЕТИТ ВЕРШИТЬ СУДЬБУ",
            "•Я АШОТ ТЕБЕ~ХЭДШОТ•",
            "Ð•Ē•M•Ø•Ŋ KILLED YOU",
            "•Я_tOT_komy_HaBce||OX•",
            "༼ つ ◕_◕ ༽つ {лежи ннчик}",
            "4iTeRoc_Ha_SeRvErE",
            "ЂΣƊOŁ∆G∆",
            "-n๏ȼąȼέʍȼя?",
            "АхТы?НеГодЯй!",
            "TRUCKACH.TECH RELEASE ACTIVATED ....",
            "%s EB@NYHKA S CHITOM",
            "给这个亚洲人吹箫",
            "ПуЛя_В_гЛаЗ_и_Ты_УнИТаЗ",
            "$$$ 1 TAP BY ME $$$ ∩ ( ͡⚆ ͜ʖ ͡⚆) ∩",
            "Ты К@К-т0 Н3ЖН0 СТbIлRЕШЬ ТЫ ЧТО НОВИЧ0К?",
            "эй бро у меня есть truckach.lua тебе дать?",
            "༻︻デ 一♣️ u suk♡︎◕︎‿︎◕︎​",
            "растреливаю детей  ︻   一 - - -  - - -",
            "часы - накрутил✔⼺  ⼺㆔[̲̅Х̲̅][̲̅а̲̅][̲̅р̲̅][̲̅а̲̅][̲̅к̲̅][̲̅т̲̅][̲̅е̅",
            "çŤᵱẮχ çŤᵱẮχ çŤᵱẮχ çŤᵱẮχ çŤᵱẮχ çŤᵱẮχ",
            "%s, юзает пасту сережехак в6 пастед бу ILYAtrasher$",
            "ᴇꜱʟɪ ʏᴀ xᴏʀᴏʜᴏ ɪɢʀᴀɪ ᴇᴛᴏ ɴᴇ ᴢɴᴀʜɪᴛ ʜᴛᴏ ʏᴀ ᴄʜᴇᴀᴛᴇʀ",
            "нож - скамнул✔♕        Я ПЕРСОН  V I P  ТЫ ПАЦАН ВЛИП     ?"
        }, 
        [3] = { 
            "you're cute yknow :3",
            "i'd love to cuddle you <3'",
            ">:3",
            "NYYYAAAAAA!!!~~~",
            "hii daddy~ >w<",
            "soooorry =w=",
            "nice try <3",
            "S-Sorry onii-chan p-please d-do me harder ;w;",
            "Y-You got me all wet now Senpai!",
            "D-Don't t-touch me there Senpai",
            "P-Please l-love me harder oniichan ohh grrh aahhhh~!",
            "Give me all your cum Senpai ahhhhh~",
            "F-Fuck me harder chan! (⊙_⊙;)",
            "Slvtsewer is such a cute femboy ahh~~ f-fuck... ⊙.☉",
            "Oh my god I hate you so much Senpai but please k-keep fucking me harder! ahhh~",
            "D-Do you like my stripped panties getting soaked by you and your hard cock? ehhh master you're so lewd ^0^~",
            "Kun your cute little dick between my bussy looks really cute, I am blushing (*/ω＼*)",
            "M-Master does it feel good when I slide my smoll hand up and down on your cute manly part?",
            "O-Oniichan my t-toes are so warm with your cum all over them (^///^)~",
            "Lets take this swimsuit off already <3 i'll drink your unknown melty juice",
            "S-Stop Senpai if we keep making these lewd sounds im going to cum~~",
            "You're such a pervert for filling me up with your seman Senpai~~",
            "Fill up my bussy with your semen kun ^-^",
            "M-Master d-dont spank my petite butt so hard ahhhH~~~ you're getting me so w-wet~",
            "Senpai your cock is already throbbing from my huge ass~",
            "Hey kun, Can I have some semen?",
            "M-My bussy is overflowing with your semen M-Master",
            "Fill my throat bwussy with your semen kun",
            "It-It's not gay if you're wearing thigh highs M-Master",
            "I-I need somewhere to blow my load. Can i borrow your bussy?",
            "A-ah shit... Y-your cock is big and in my ass -- already~?!",
            "I'll swallow your sticky essence along with you~!",
            "B-Baka please let me be your femboy cum slut!",
            "That's a penis UwU you towd me you wewe a giww!!",
            "Ahhhh... It's like a dream come true... I get to stick my dick inside your ass...!",
            "Hey, who wants a piece of this plump 19-year-old boy-bussy? Single file, boys, come get it while it's hot!",
            "M-Master, if you keep thrusting that hard, i am going to pass out!",
            "When do you wanna meet up again? I've really taken a liking to your dick! (,,◠∇◠) I want you and only you to slam it into my buwssy every day! (≧∇≦)",
            "All I did was crossplay 'cause I felt like it might be fun... But now I am just a little boy that cums from big dicks!",
            "D-Don't get the wrong idea!!! I don't w-want you to fuck my b-bussy because I l-love you or anything! d-definitely not!",
            "I-I know I said you could be as rough as you want... But surprise fisting wasn't what I had in mind!!",
            "W-Why is it that lately... Y-You haven't been playing with my ass!!?",
            "Hehe don't touch me there Onii-chann UwU",
            "Your cum is all over my wet bussy M-Master",
            "It Feels like you're pounding me with the force of a thousand suns Senpai",
            "Y-Yes right there S-Sempai hooyah",
            "P-Please keep filling my bussy S-Sempai",
            "O-Onii-chan it felt so good when you punded my bussy",
            "P-Please Onii-chan keep filling my bussy with your melty juice",
            "O-Onii-chan you just one shot my bussy",
            "I-Im nothing but a f-fucktoy slut for your m-monster fuckmeat!",
            "Dominate my bussy with your vicious swimmers!",
            "Y-Your meat septer has penetrated my tight boy hole",
            "Mnn FASTER... HARDER! Turn me into your femboy slut~!",
            "Mmmm- soothe me, caress me, Fuck me, breed me!",
            "Probe your thick, wet, throbbing cock deeper and deeper into my boipussy~!!",
            "Hya! Not my ears! Ah... It tickles! Ah!",
            "Kouta... I can't believe how BIG his... Wait! Forget about that!! Is Nyuu-chan really giving him a Ass-Fuck!?",
            "Senpai shove deeper your penis in m-my bussy (>ω<) please",
            "I'm coming fwom you fwuking my asshole mmyyy!",
            "P-Please be gentle, S-Senpai!",
            "D-Don't get the wrong idea!! I didn't give up my viginity to you because I like you or anything!!",
            "Let me taste your futa cock with my bussy~",
        },
        [4] = {
            "хуевый ресолвер",
            "хуевые фейклаги",
            "хуевый антиаим",
            "хуевый спинбот",
            "хуевый бхоп",
            "хуевый аим",
            "найс паста аимвара",
            "найс паста мемевара",
            "неужели это идиотбокс???",
            "ого идиотбокс???",
            "неужели это аосхак???",
            "ого аосхак???",
            "неужели это ехек хак???",
            "ого ехек хак???",
            "что за ебанутый у тебя чит?",
            "ez",
            "ezz",
            "изи",
            "ииииииизи",
            "упал",
            "спи",
            "отдыхай",
            "отлетел дебил)",
            "упал пастер",
            "пастер лег",
            "изи даун",
            "ору отлетела дура",
            "найс ресолвер стен",
            "найс ресолвер деревьев",
            "бро имажин ресолвинг ин гмод",
            "улетел фанат артемкинга4",
            "упал фанат артемкинга4",
            "ты куда стреляешь)))",
            "упал ннчик без самоваре",
            "умер ннчик без самоваре",
            "отдыхай ннчик без самоваре",
            "упал подписчик урбанички",
            "умер подписчик урбанички",
            "отдыхай подписчик урбанички",
            "енжинпред где???",
            "антиаим где???",
            "фейклаги где???",
            "антиаим не спас",
            "фейклаги не спасли",
            "даун с пастой отлетел",
            "упал баимер ебаный",
            "отлетел ебаный баимер))",
            "охуеть даун с пастой аимвара",
            "упал дебил",
            "выйди не позорься",
            "найс брейн иссуе",
            "найс кфг иссуе",
            "сука не позорься и ливни лол",
            "*DEAD* пофикси нищ",
            "нищий улетел",
            "набутылирован лол",
            "ебать ты красиво на бутылку упал",
            "хуя тебя опустили))",
            "прости что без смазки)",
            "обоссан",
            "обоссал юзера пасты аимвара",
            "алло это скорая? тут такая ситуация нищ упал)))",
            "на завод иди",
            "ебать тебя унесло",
            "ой нищий упал щас скорую вызовем",
            "научи потом как так сосать на хвх",
            "нихуя ты там как самолет отлетел",
        },
        [5] = {
    "%n еба тя расплющило жирнич", 
    "%n 《AK•47•KILLER》☆",
    "%n Теперь я - Ютубер Truckach (◣_◢)",
    "%n FIX KD NN DOGGO", 
    "%n طلقه واحده هههههههههه",
    "%n Я играю на лайфхакерском конфиге от Серёжи (◣_◢)",
    "%n нищий улетел", 
    "%n *忍び 1 УПАЛ び忍", 
    "%n ХАХАХАХАХХАХА НИЩИЙ УЛЕТЕЛ (◣_◢)",
    "%n я ķ¤нɥåλ ϯβ¤£ü ɱåɱķ£ β Ƥ¤ϯ", 
    "%n ⒶaŴÞ ︻デ═一 -™",
    "%n Желток в деле! Белок на пределе! (◣_◢)",
    "%n опущены стяги, легион и.. А БЛЯТЬ ТЫЖ ТУТ ОПУЩ НАХУЙ ПХГАХААХАХАХАХА)))))))", 
    "%n але ты там из хрущевки выеди а потом выпрыгивай блять", 
    "%n ебать ты красиво на бутылку упал",
    "%n ты как ваще живешь в коробке 1х1м где ты деньги на акк взял нищ ахахах",
    "%n ╭∩╮(◣_◢)╭∩╮",
    "%n co‌mm‌it‌ n‌ec‌k ‌ro‌pe‌ u‌r ‌to‌o ‌ba‌d ‌xa‌xa", 
    "%n op‌ti‌on‌s ‌=>‌ h‌ow‌ t‌o ‌pl‌ay", 
    "%n who (кто) you (ты) ватофак мен))",
    "%n ->‌> ‌si‌rg‌ay‌zo‌rh‌ac‌k.‌pw‌/в‌оз‌вр‌ат‌де‌не‌г.‌ph‌p ‌«‌-", 
    "%n в окно паунс сделай у тя даже юида нету ЛОООЛ",
    "%n better buy the sergayzorhack!", 
    "%n земля те землей хуй до чиста еденицей отлетел))",
    "%n 8====={Headshot beath]==0", 
    "%n  $$$ 1 TAP UFF YA $$$ ∩ ( ͡⚆ ͜ʖ ͡⚆) ∩",
    "%n ху‌я ‌ты‌ н‌а ‌бу‌ты‌лк‌у ‌уп‌ал‌ х‌ах‌ах‌ах‌а", 
    "%n I'm not using sergayzorhack.pw, you're just bad",
    "%n мн‌е ‌по‌ху‌й ‌на‌ к‌ри‌ти‌ку‌ о‌че‌ре‌дн‌ог‌о ‌ны‌ти‌ка‌, ‌со‌ м‌но‌й ‌мо‌и ‌лю‌ди‌, ‌мо‌й ‌ра‌йо‌н,‌ м‌оя‌ ",  
    "%n AHXAAP!! oNe.TaP.!*", 
    "%n cya @ dog", 
    "%n Я играю на вкуснейшем конфиге от Серёжи ツ", 
    "%n как ты на пк накопил даже не знаю )))))))))", 
    "%n ✘︎NeveR●︎Give●︎Up✘︎ヅ", 
    "%n найс 0.5х0.5м комната блять ХАХАХАХА ТЫ ТАМ ЖЕ ДАЖЕ ПОВЕСИТЬСЯ НЕ МОЖЕШЬ МЕСТА НЕТ ПХПХПХППХ", 
    "%n (っ◔◡◔)っ ❤️Ace Awp❤", 
    "%n THIS IS OMLEEEEEEET (◣◢)", 
    "%n ● Loading sergayzorhack... ] 99.9%", 
    "%n デ ︻ ₳₭-❹❼ ���", 
    "%n VAAAAAAAC в чат!!! (づ ◕‿◕ )づ", 
    "%n AWPutin༻︻デ 一",
    "%n LIFEEEEHAAAACK BITCH!!! (◣_◢)", 
    "%n AHAHAHHAAH (◣_◢)",
    "%n а у вас походу умирать это семейное)", 
    "%n нахуя пидораса убил?", 
    "%n чао персик дозревай", 
    "%n уважаемый в тюрьме вы будете водолазом",
    "%n говори буду плохо говорить буду сосать, буду плохо сосать буду пересасывать", 
    "%n долбаеб иди башмачки в сундучок школьный собирай", 
    "%n ботинок ебаный чо слетел", 
    "%n братик маме привет передай",
    "%n не противник",
    "%n а ты че клоун???", 
    "%n я обоссал тебя (", 
    "%n ты че там отлетел то?",
    "%n упал хуета ебаная , но в боди забрал да похуй все равно упал",
    "%n *DEAD* ливай с хвх (", 
    "%n до связи башмак",
    "%n нищета глупейшая играть учись", 
    "%n опущен сын твари",
    "%n нищий улетел", 
    "%n *DEAD* пофикси нищ", 
    "%n сразу видно кфг иссуе мб конфиг у меня прикупишь ?",
    "%n животное аддон скачай а то падаешь", 
    "%n оттарабанен армянская королева", 
    "%n сука не позорься и ливни",
    "%n улетел тапочек ебаный", 
    "%n единицей свалился фуфлыжник",
    "%n зачем ты играешь тут безмозглый", 
    "%n иди кумыса попей очередняра",
    "%n откисай сочняра", 
    "%n АХАХА ЕБАТЬ У ТЕБЯ ЧЕРЕПНАЯ КОРОБКА ПРЯМ КАК HVH #1 * M9K * CSS * RU",
    "%n на Truckach.tech то деньги есть????", 
    "%n ИЩИ СЕБЯ НА https://www.youtube.com/@Truckach",
    "%n свежий кабанчик", 
        },    
    [6] = {"AK47HACK – DOMINATE EVERY SERVER!",  
"AK47HACK – AIMBOT THAT NEVER MISSES!",  
"AK47HACK – PERFECT LAG COMPENSATION!",  
"AK47HACK – DT THAT BREAKS HITBOXES!",  
"AK47HACK – FAKE LAG TO TRICK ENEMIES!",  
"AK47HACK – ESP WITH CUSTOM COLORS!",  
"AK47HACK – CLOUD CFG FOR INSTANT SETUPS!",  
"AK47HACK – HVH TOOLS TO DESTROY ALL!",  
"AK47HACK – ANTI-AIM THAT MAKES YOU GHOST!",  
"AK47HACK – RAGE MODE FOR EASY WINS!",  
"AK47HACK – TRIGGERBOT FOR INSTANT KILLS!",  
"AK47HACK – BUNNYHOP WITH PERFECT SYNC!",  
"AK47HACK – BACKTRACK TO HIT PAST SHOTS!",  
"AK47HACK – CHAMS THAT SEE THROUGH WALLS!",  
"AK47HACK – LEGIT MODE FOR STEALTH HACKS!",  
"AK47HACK – AUTOSTRAFE LIKE A PRO!",  
"AK47HACK – FAKE PING TO BAIT SHOTS!",  
"AK47HACK – RESOLVER THAT NEVER FAILS!",  
"AK47HACK – INSTANT HITSCAN HEADSHOTS!",  
"AK47HACK – AUTO PEEK FOR EASY KILLS!",  
"AK47HACK – UNDETECTED BY ANY SERVER!",  
"AK47HACK – 3D RADAR FOR FULL CONTROL!",  
"AK47HACK – NO RECOIL, NO PROBLEM!",  
"AK47HACK – FAKE DUCK TO BAIT ENEMIES!",  
"AK47HACK – MANUAL AA FOR PRO PLAYERS!",  
"AK47HACK – BULLET TRACERS TO FLEX!",  
"AK47HACK – AUTO PISTOL FOR FAST KILLS!",  
"AK47HACK – THE KING OF HVH CHEATS!",  
"AK47HACK – DOUBLE TAP TO BREAK ANIMATIONS!",  
"AK47HACK – ONSHOT AA TO DODGE BULLETS!",  
"AK47HACK – FAKE ORIGIN TO CONFUSE AIM!",  
"AK47HACK – UNDETECTED = NO BANS!",  
"AK47HACK – THE LAST CHEAT YOU'LL NEED!",  
"AK47HACK – OWN THE SERVER OR DIE TRYING!",  
"AK47HACK – BEST VISUALS IN GARRY'S MOD!",  
"AK47HACK – AUTO WALL FOR EASY PENETRATION!",  
"AK47HACK – PERFECT SILENT AIM!",  
"AK47HACK – SHOT PREDICTION FOR HITS!",  
"AK47HACK – FAST LOADING, NO DELAYS!",  
"AK47HACK – CUSTOM CONFIGS FOR EVERY PLAYSTYLE!",  
"AK47HACK – AIMLOCK THAT FEELS NATURAL!",  
"AK47HACK – NO SPREAD FOR PERFECT ACCURACY!",  
"AK47HACK – INSTANT SWITCH FOR QUICK KILLS!",  
"AK47HACK – PROOF AGAINST SCREENSHOTS!",  
"AK47HACK – FULLY CUSTOMIZABLE MENU!",  
"AK47HACK – ANTI-SCREENSHOT PROTECTION!",  
"AK47HACK – AUTO-BLOCK TO COUNTER ATTACKS!",  
"AK47HACK – REAL-TIME UPDATES!",  
"AK47HACK – VIP SUPPORT 24/7!",  
"AK47HACK – JOIN THE WINNERS TODAY!",  
        },
    [7] = {"%n AK47HACK – DOMINATE EVERY SERVER!",
"%n AK47HACK – AIMBOT THAT NEVER MISSES!",
"%n AK47HACK – PERFECT LAG COMPENSATION!",
"%n AK47HACK – DT THAT BREAKS HITBOXES!",
"%n AK47HACK – FAKE LAG TO TRICK ENEMIES!",
"%n AK47HACK – ESP WITH CUSTOM COLORS!",
"%n AK47HACK – CLOUD CFG FOR INSTANT SETUPS!",
"%n AK47HACK – HVH TOOLS TO DESTROY ALL!",
"%n AK47HACK – ANTI-AIM THAT MAKES YOU GHOST!",
"%n AK47HACK – RAGE MODE FOR EASY WINS!",
"%n AK47HACK – TRIGGERBOT FOR INSTANT KILLS!",
"%n AK47HACK – BUNNYHOP WITH PERFECT SYNC!",
"%n AK47HACK – BACKTRACK TO HIT PAST SHOTS!",
"%n AK47HACK – CHAMS THAT SEE THROUGH WALLS!",
"%n AK47HACK – LEGIT MODE FOR STEALTH HACKS!",
"%n AK47HACK – AUTOSTRAFE LIKE A PRO!",
"%n AK47HACK – FAKE PING TO BAIT SHOTS!",
"%n AK47HACK – RESOLVER THAT NEVER FAILS!",
"%n AK47HACK – INSTANT HITSCAN HEADSHOTS!",
"%n AK47HACK – AUTO PEEK FOR EASY KILLS!",
"%n AK47HACK – UNDETECTED BY ANY SERVER!",
"%n AK47HACK – 3D RADAR FOR FULL CONTROL!",
"%n AK47HACK – NO RECOIL, NO PROBLEM!",
"%n AK47HACK – FAKE DUCK TO BAIT ENEMIES!",
"%n AK47HACK – MANUAL AA FOR PRO PLAYERS!",
"%n AK47HACK – BULLET TRACERS TO FLEX!",
"%n AK47HACK – AUTO PISTOL FOR FAST KILLS!",
"%n AK47HACK – THE KING OF HVH CHEATS!",
"%n AK47HACK – DOUBLE TAP TO BREAK ANIMATIONS!",
"%n AK47HACK – ONSHOT AA TO DODGE BULLETS!",
"%n AK47HACK – FAKE ORIGIN TO CONFUSE AIM!",
"%n AK47HACK – UNDETECTED = NO BANS!",
"%n AK47HACK – THE LAST CHEAT YOU'LL NEED!",
"%n AK47HACK – OWN THE SERVER OR DIE TRYING!",
"%n AK47HACK – BEST VISUALS IN GARRY'S MOD!",
"%n AK47HACK – AUTO WALL FOR EASY PENETRATION!",
"%n AK47HACK – PERFECT SILENT AIM!",
"%n AK47HACK – SHOT PREDICTION FOR HITS!",
"%n AK47HACK – FAST LOADING, NO DELAYS!",
"%n AK47HACK – CUSTOM CONFIGS FOR EVERY PLAYSTYLE!",
"%n AK47HACK – AIMLOCK THAT FEELS NATURAL!",
"%n AK47HACK – NO SPREAD FOR PERFECT ACCURACY!",
"%n AK47HACK – INSTANT SWITCH FOR QUICK KILLS!",
"%n AK47HACK – PROOF AGAINST SCREENSHOTS!",
"%n AK47HACK – FULLY CUSTOMIZABLE MENU!",
"%n AK47HACK – ANTI-SCREENSHOT PROTECTION!",
"%n AK47HACK – AUTO-BLOCK TO COUNTER ATTACKS!",
"%n AK47HACK – REAL-TIME UPDATES!",
"%n AK47HACK – VIP SUPPORT 24/7!",
"%n AK47HACK – JOIN THE WINNERS TODAY!",
        },
    [8] = {"AK47HACK JUST OBLITERATED YOU - UNINSTALL NOOB!",

"MY AIMBOT NEVER MISSES - THANKS AK47HACK!",

"WHY SHOOT? AK47HACK MAKES ME UNTOUCHABLE!",

"LOL YOUR HACKS ARE TRASH COMPARED TO AK47HACK!",

"AK47HACK'S BACKTRACK DELETED YOUR HITBOX!",

"I SEE THROUGH WALLS - AK47HACK ESP OP!",

"CRY HARDER - AK47HACK OWNS THIS SERVER!",

"YOUR CHEATS CAN'T COMPETE WITH AK47HACK!",

"AK47HACK'S DT SHOT THROUGH TIME AND SPACE!",

"MY BULLETS CURVE - AK47HACK MAGIC!",

"REPORT ME? AK47HACK IS UNDETECTED!",

"I DON'T AIM - AK47HACK DOES IT FOR ME!",

"YOUR TEAM IS NEXT - AK47HACK RAGE MODE!",

"WHY RUN? AK47HACK SEES EVERYTHING!",

"AK47HACK'S FAKE LAG MAKES YOU LOOK DUMB!",

"I KILL BEFORE YOU SEE ME - AK47HACK OP!",

"UPGRADE TO AK47HACK OR STAY TRASH!",

"AK47HACK JUST MADE YOU UNINSTALL GMOD!",

"I NEVER MISS - YOUR HITBOX VANISHED!",

"AK47HACK SILENT AIM = INSTANT DEATH!",

"YOU SHOOT MY FAKE ORIGIN - NICE TRY!",

"MY CHAMS MAKE YOU GLOW LIKE XMAS!",

"AK47HACK RESOLVER FIXES YOUR BAD ANGLES!",

"I KILL WHILE LOOKING AWAY - AK47HACK OP!",

"YOUR AIM SUCKS - AK47HACK FIXES THAT!",

"AK47HACK AUTO WALL IGNORES COVER!",

"I DON'T DIE - AK47HACK ANTI-AIM OP!",

"YOU VS AK47HACK = NO CHANCE!",

"AK47HACK MADE YOU RAGE QUIT - GG!",

"MY TRIGGERBOT KILLS IN NANOSECONDS!",

"YOUR MOVEMENT IS PREDICTABLE - AK47HACK KNOWS!",

"I SEE YOUR HEALTH - YOU'RE ALREADY DEAD!",

"AK47HACK FAKE DUCK BAITED YOU!",

"NOT LAGGING - THAT'S AK47HACK FAKE PING!",

"MY ESP SHOWS YOUR WEAKNESSES!",

"AK47HACK MADE YOU LOOK LIKE A BOT!",

"I NEED NO SKILL - AK47HACK IS MY SKILL!",

"YOUR HACKS ARE TOYS - MINE ARE WEAPONS!",

"AK47HACK CLOUD CFG = PRO SETTINGS INSTANT!",

"I KILL WHILE AFK - AK47HACK OP!",

"YOUR TEAM FEEDS ME KILLS - THANKS!",

"AK47HACK AIMLOCK SNAPS TO YOUR FACE!",

"YOU CAN'T HIDE - MY WALLHACK SEES ALL!",

"I DON'T MISS - YOUR HITBOX FEARS ME!",

"AK47HACK MADE YOU UNINSTALL STEAM!",

"MY BUNNYHOP IS SMOOTHER THAN YOUR SALT!",

"YOUR SHOTS PHASE THROUGH ME - MAGIC!",

"AK47HACK AUTO PEEK = FREE KILLS!",

"I KILL EYES CLOSED - AK47HACK OP!",

"YOUR HACKS GET DESTROYED - SAD!",

"AK47HACK HVH MODE = YOU LOSE!",

"I DON'T TRY - AK47HACK CARRIES ME!",

"YOUR AIM LIKE STORM - MISSES EVERYTHING!",

"AK47HACK MADE YOU QUESTION LIFE!",

"MY NO RECOIL = LASER PRECISION!",

"NOT LAGGING - AK47HACK FAKE LAG!",

"AK47HACK MADE YOU LOOK NOOB!",

"I KILL ACROSS MAP - AK47HACK OP!",

"YOUR HACKS OBSOLETE - UPGRADE NOW!",

"AK47HACK AIM ASSIST = AUTO HS!",

"YOU SHOOT AIR - I'M OVER HERE!",

"MY ESP SHOWS YOUR POVERTY!",

"AK47HACK MADE YOU LEAVE SERVER!",

"I DON'T MOVE - AIMBOT DOES ALL!",

"YOUR HACKS WEAK - MINE STRONG!",

"AK47HACK FAKE ORIGIN = CAN'T HIT ME!",

"YOU VS CHEAT = GIVE UP!",

"MY BULLET TRACERS HUMILIATE YOU!",

"AK47HACK MADE YOU UNINSTALL CSGO!",

"I KILL WHILE TYPING - AK47HACK OP!",

"YOUR MOVEMENT LIKE BOT - EASY!",

"AK47HACK AUTO PISTOL = INSTANT HS!",

"YOU'RE NOT INVISIBLE - I SEE ALL!",

"I DON'T NEED SEE YOU - AIMBOT DOES!",

"YOUR HACKS JOKE - MINE REAL!",

"AK47HACK MADE YOU RAGE IN CHAT!",

"MY DOUBLE TAP BREAKS HITBOXES!",

"NOT LAGGING - AK47HACK ANTI-AIM!",

"AK47HACK = REASON YOU LOSE!",

"AK47HACK'S TRIGGERBOT = INSTANT KILLS!",

"YOUR POSITION KNOWN - AK47HACK RADAR!",

"I CONTROL SERVER - AK47HACK OP!",

"YOUR ANGLES BROKEN - AK47HACK FIXED!",

"AK47HACK'S MOVEMENT HACKS = GODLIKE!",

"I SHOOT THROUGH WALLS - NO PROBLEM!",

"YOUR CONFIG TRASH - MINE PERFECT!",

"AK47HACK'S RESOLVER = NO MISSES!",

"I OWN YOU - AK47HACK UNDETECTED!",

"YOUR TEAM SUCKS - AK47HACK CARRIES!",

"AK47HACK'S FAKE DUCK = BAIT KING!",

"I DODGE ALL SHOTS - LIKE MATRIX!",

"YOUR HACKS DETECTED - MINE SAFE!",

"AK47HACK'S CLOUD SYSTEM = PRO INSTANT!",

"I HAVE WALLS - YOU HAVE NOTHING!",

"YOUR LOSSES = AK47HACK WINS!",

"AK47HACK'S MENU = MOST BEAUTIFUL!",

"I TOGGLE CHEATS - YOU TOGGLE TEARS!",

"YOUR AIM BAD - MY AIMBOT PERFECT!",

"AK47HACK'S SUPPORT = ALWAYS ONLINE!",

"AK47HACK - #1 UNDETECTED CHEAT!",
        },
    [9] = {"%n AK47HACK JUST OBLITERATED YOU - UNINSTALL NOOB!",

"%n MY AIMBOT NEVER MISSES - THANKS AK47HACK!",

"%n WHY SHOOT? AK47HACK MAKES ME UNTOUCHABLE!",

"%n LOL YOUR HACKS ARE TRASH COMPARED TO AK47HACK!",

"%n AK47HACK'S BACKTRACK DELETED YOUR HITBOX!",

"%n I SEE THROUGH WALLS - AK47HACK ESP OP!",

"%n CRY HARDER - AK47HACK OWNS THIS SERVER!",

"%n YOUR CHEATS CAN'T COMPETE WITH AK47HACK!",

"%n AK47HACK'S DT SHOT THROUGH TIME AND SPACE!",

"%n MY BULLETS CURVE - AK47HACK MAGIC!",

"%n REPORT ME? AK47HACK IS UNDETECTED!",

"%n I DON'T AIM - AK47HACK DOES IT FOR ME!",

"%n YOUR TEAM IS NEXT - AK47HACK RAGE MODE!",

"%n WHY RUN? AK47HACK SEES EVERYTHING!",

"%n AK47HACK'S FAKE LAG MAKES YOU LOOK DUMB!",

"%n I KILL BEFORE YOU SEE ME - AK47HACK OP!",

"%n UPGRADE TO AK47HACK OR STAY TRASH!",

"%n AK47HACK JUST MADE YOU UNINSTALL GMOD!",

"%n I NEVER MISS - YOUR HITBOX VANISHED!",

"%n AK47HACK SILENT AIM = INSTANT DEATH!",

"%n YOU SHOOT MY FAKE ORIGIN - NICE TRY!",

"%n MY CHAMS MAKE YOU GLOW LIKE XMAS!",

"%n AK47HACK RESOLVER FIXES YOUR BAD ANGLES!",

"%n I KILL WHILE LOOKING AWAY - AK47HACK OP!",

"%n YOUR AIM SUCKS - AK47HACK FIXES THAT!",

"%n AK47HACK AUTO WALL IGNORES COVER!",

"%n I DON'T DIE - AK47HACK ANTI-AIM OP!",

"%n YOU VS AK47HACK = NO CHANCE!",

"%n AK47HACK MADE YOU RAGE QUIT - GG!",

"%n MY TRIGGERBOT KILLS IN NANOSECONDS!",

"%n YOUR MOVEMENT IS PREDICTABLE - AK47HACK KNOWS!",

"%n I SEE YOUR HEALTH - YOU'RE ALREADY DEAD!",

"%n AK47HACK FAKE DUCK BAITED YOU!",

"%n NOT LAGGING - THAT'S AK47HACK FAKE PING!",

"%n MY ESP SHOWS YOUR WEAKNESSES!",

"%n AK47HACK MADE YOU LOOK LIKE A BOT!",

"%n I NEED NO SKILL - AK47HACK IS MY SKILL!",

"%n YOUR HACKS ARE TOYS - MINE ARE WEAPONS!",

"%n AK47HACK CLOUD CFG = PRO SETTINGS INSTANT!",

"%n I KILL WHILE AFK - AK47HACK OP!",

"%n YOUR TEAM FEEDS ME KILLS - THANKS!",

"%n AK47HACK AIMLOCK SNAPS TO YOUR FACE!",

"%n YOU CAN'T HIDE - MY WALLHACK SEES ALL!",

"%n I DON'T MISS - YOUR HITBOX FEARS ME!",

"%n AK47HACK MADE YOU UNINSTALL STEAM!",

"%n MY BUNNYHOP IS SMOOTHER THAN YOUR SALT!",

"%n YOUR SHOTS PHASE THROUGH ME - MAGIC!",

"%n AK47HACK AUTO PEEK = FREE KILLS!",

"%n I KILL EYES CLOSED - AK47HACK OP!",

"%n YOUR HACKS GET DESTROYED - SAD!",

"%n AK47HACK HVH MODE = YOU LOSE!",

"%n I DON'T TRY - AK47HACK CARRIES ME!",

"%n YOUR AIM LIKE STORM - MISSES EVERYTHING!",

"%n AK47HACK MADE YOU QUESTION LIFE!",

"%n MY NO RECOIL = LASER PRECISION!",

"%n NOT LAGGING - AK47HACK FAKE LAG!",

"%n AK47HACK MADE YOU LOOK NOOB!",

"%n I KILL ACROSS MAP - AK47HACK OP!",

"%n YOUR HACKS OBSOLETE - UPGRADE NOW!",

"%n AK47HACK AIM ASSIST = AUTO HS!",

"%n YOU SHOOT AIR - I'M OVER HERE!",

"%n MY ESP SHOWS YOUR POVERTY!",

"%n AK47HACK MADE YOU LEAVE SERVER!",

"%n I DON'T MOVE - AIMBOT DOES ALL!",

"%n YOUR HACKS WEAK - MINE STRONG!",

"%n AK47HACK FAKE ORIGIN = CAN'T HIT ME!",

"%n YOU VS CHEAT = GIVE UP!",

"%n MY BULLET TRACERS HUMILIATE YOU!",

"%n AK47HACK MADE YOU UNINSTALL CSGO!",

"%n I KILL WHILE TYPING - AK47HACK OP!",

"%n YOUR MOVEMENT LIKE BOT - EASY!",

"%n AK47HACK AUTO PISTOL = INSTANT HS!",

"%n YOU'RE NOT INVISIBLE - I SEE ALL!",

"%n I DON'T NEED SEE YOU - AIMBOT DOES!",

"%n YOUR HACKS JOKE - MINE REAL!",

"%n AK47HACK MADE YOU RAGE IN CHAT!",

"%n MY DOUBLE TAP BREAKS HITBOXES!",

"%n NOT LAGGING - AK47HACK ANTI-AIM!",

"%n AK47HACK = REASON YOU LOSE!",

"%n AK47HACK'S TRIGGERBOT = INSTANT KILLS!",

"%n YOUR POSITION KNOWN - AK47HACK RADAR!",

"%n I CONTROL SERVER - AK47HACK OP!",

"%n YOUR ANGLES BROKEN - AK47HACK FIXED!",

"%n AK47HACK'S MOVEMENT HACKS = GODLIKE!",

"%n I SHOOT THROUGH WALLS - NO PROBLEM!",

"%n YOUR CONFIG TRASH - MINE PERFECT!",

"%n AK47HACK'S RESOLVER = NO MISSES!",

"%n I OWN YOU - AK47HACK UNDETECTED!",

"%n YOUR TEAM SUCKS - AK47HACK CARRIES!",

"%n AK47HACK'S FAKE DUCK = BAIT KING!",

"%n I DODGE ALL SHOTS - LIKE MATRIX!",

"%n YOUR HACKS DETECTED - MINE SAFE!",

"%n AK47HACK'S CLOUD SYSTEM = PRO INSTANT!",

"%n I HAVE WALLS - YOU HAVE NOTHING!",

"%n YOUR LOSSES = AK47HACK WINS!",

"%n AK47HACK'S MENU = MOST BEAUTIFUL!",

"%n I TOGGLE CHEATS - YOU TOGGLE TEARS!",

"%n YOUR AIM BAD - MY AIMBOT PERFECT!",

"%n AK47HACK'S SUPPORT = ALWAYS ONLINE!",

"%n AK47HACK - #1 UNDETECTED CHEAT!",
        }
    }


ultimate.killstreak = 0 

// Init player vars 
gameevent.Listen( "player_spawn" )
gameevent.Listen( "player_activate" )
gameevent.Listen( "entity_killed" )

function ultimate.entity_killed(data)
    local aid = Entity(data.entindex_attacker)  
    local vid = Entity(data.entindex_killed)

    if aid == pLocalPlayer and aid != vid and !vid:IsNPC() and (vid:IsPlayer() or vid:IsBot() ) then
        if ultimate.cfg.vars["Killsay"] then
            local chatPrefixes = {
                [2] = "/ooc ",
                [3] = "/ad ",
                [4] = "/pm "
            }
            
            local chatGroup = ultimate.cfg.vars["Killsay group"]
            
            local prefix = chatPrefixes[chatGroup] or ""
        
            local tbl = ultimate.chatmsg[ ultimate.cfg.vars["Killsay mode"] ]
            local str = prefix .. tbl[ math.random( 1, #tbl ) ]
            
            if str:find("%s") then 
                str = str:gsub("%%s", vid:Nick()) 
            end
            if str:find("%n") then 
                str = str:gsub("%%n", vid:SteamID()) 
            end

            RunConsoleCommand( "say", str )
        end

        
        if ultimate.cfg.vars["Killsound"] then
            surface.PlaySound( ultimate.cfg.vars["Killsound str"] )
        end

        if ultimate.cfg.vars["Killstreak"] then
            ultimate.killstreak = (ultimate.killstreak or 0) + 1  
            
            if ultimate.killstreak > 0 then
                if ultimate.killstreak == 1 then
                    surface.PlaySound("firstblood.wav")
                elseif ultimate.killstreak == 2 then
                    surface.PlaySound("doublekill.wav")
                elseif ultimate.killstreak == 3 then
                    surface.PlaySound("killingspree.wav")
                elseif ultimate.killstreak == 4 then
                    surface.PlaySound("unstoppable.wav")
                elseif ultimate.killstreak == 5 then
                    surface.PlaySound("triplekill.wav")
                elseif ultimate.killstreak == 7 then
                    surface.PlaySound("wickedsick.wav")
                elseif ultimate.killstreak == 9 then
                    surface.PlaySound("dominating.wav")
                elseif ultimate.killstreak == 11 then
                    surface.PlaySound("ultrakill.wav")
                elseif ultimate.killstreak == 15 then
                    surface.PlaySound("holyshit.wav")
                elseif ultimate.killstreak == 17 then
                    surface.PlaySound("godlike.wav")
                elseif ultimate.killstreak == 20 then
                    surface.PlaySound("rampage.wav")
                elseif ultimate.killstreak > 20 then
                    ultimate.killstreak = 0  -- Сброс после 20 убийств
                end
            end
        end
    end
end

function ultimate.updatePlayerVars( data )
    local id = data.userid  

    local ply = Player( id )

    ply.ult_prev_pos = Vector()
    // ply.ult_prev_hitbox_pos = Vector()
    
    ply.ult_prev_simtime = 0
    ply.flticks = 0
        
    ply.simtime_updated = false
    ply.break_lc = false
    ply.fakepitch = false

    ultimate.btrecords[ ply ] = {}
    ultimate.predicted[ ply ] = {}
end



















// Menu hints 

function ultimate.DrawMenuHints()
    if not ultimate.frame:IsVisible() then return end

    if not ultimate.hint then
        ultimate.hintText = ""
        return
    end

    surface.SetTextColor(ultimate.Colors[165])
    surface.SetFont("DermaSmall")

    local tw, th = surface.GetTextSize(ultimate.hintText)

    surface.SetDrawColor(ultimate.Colors[35])
    surface.DrawRect(ultimate.hintX,ultimate.hintY,tw+20,th+10)
    surface.SetDrawColor(ultimate.Colors[54])
    surface.DrawOutlinedRect(ultimate.hintX,ultimate.hintY,tw+20,th+10,1)    

    surface.SetTextPos(ultimate.hintX+10,ultimate.hintY+5)
    surface.DrawText(ultimate.hintText)

    ultimate.hint = false
end

function ultimate.DrawOverlay()
    if ultimate.UnSafeFrame then return end

    ultimate.DrawMenuHints()
end


// Gamemode UpdateClientsideAnimation

local function RunSandboxAnims(ply, velocity, maxseqgroundspeed)
    local len = velocity:Length()
	local movement = 1.0

	if ( len > 0.2 ) then
		movement = ( len / maxseqgroundspeed )
	end

	local rate = math.min( movement, 2 )

	-- if we're under water we want to constantly be swimming..
	if ( ply:WaterLevel() >= 2 ) then
		rate = math.max( rate, 0.5 )
	elseif ( !ply:IsOnGround() && len >= 1000 ) then
		rate = 0.1
	end

	ply:SetPlaybackRate( rate )

	-- We only need to do this clientside..
	if ( CLIENT ) then
		if ( ply:InVehicle() ) then
			--
			-- This is used for the 'rollercoaster' arms
			--
			local Vehicle = ply:GetVehicle()
			local Velocity = Vehicle:GetVelocity()
			local fwd = Vehicle:GetUp()
			local dp = fwd:Dot( Vector( 0, 0, 1 ) )

			ply:SetPoseParameter( "vertical_velocity", ( dp < 0 && dp || 0 ) + fwd:Dot( Velocity ) * 0.005 )

			-- Pass the vehicles steer param down to the player
			local steer = Vehicle:GetPoseParameter( "vehicle_steer" )
			steer = steer * 2 - 1 -- convert from 0..1 to -1..1
			if ( Vehicle:GetClass() == "prop_vehicle_prisoner_pod" ) then steer = 0 ply:SetPoseParameter( "aim_yaw", math.NormalizeAngle( ply:GetAimVector():Angle().y - Vehicle:GetAngles().y - 90 ) ) end
			ply:SetPoseParameter( "vehicle_steer", steer )

		end
	end
end

function GAMEMODE:UpdateAnimation(plr, velocity, maxSeqGroundSpeed)
    local hResult = self.BaseClass.UpdateAnimation(self, plr, velocity, maxSeqGroundSpeed)

    RunSandboxAnims(plr, velocity, maxSeqGroundSpeed)
    return hResult;
end




/*
    Libs -> Color
*/



//function ultimate.


function ultimate.ColorLerp( first, second )
    local FT = FrameTime() * 350

    first.r = math.Approach( first.r, second.r, FT )
    first.g = math.Approach( first.g, second.g, FT )
    first.b = math.Approach( first.b, second.b, FT )
    first.a = math.Approach( first.a, second.a, FT )

    math.Round( first.r, 0 )
    math.Round( first.g, 0 )
    math.Round( first.b, 0 )
    math.Round( first.a, 0 )

    return first
end

function ultimate.ColorEqual( first, second )
    if first.r != second.r or first.g != second.g or first.b != second.b or first.a != second.a then
        return false
    end

    return true 
end





/* 
    hooks -> Think 
*/

ultimate.ekd = false
ultimate.ekd2 = false
ultimate.ekd3 = false
ultimate.fbkd = false

// Dancer ( act / taunt spam )

ultimate.nextact = 0
ultimate.actCommands = {"robot","muscle","laugh","bow","cheer","wave","becon","agree","disagree","forward","group","half","zombie","dance","pers","halt","salute"}
ultimate.nextact2 = 0
ultimate.act2Commands = {"melee", "frenzy", "melee2", "poke"}

// Name changer 

do
    local cooldown = GetConVarNumber("sv_namechange_cooldown_seconds")
    local curtime = CurTime()
    local lastname = pLocalPlayer:Name()
    local changed = 0

    local function check(pl,mn,ptbl)
        if pl == pLocalPlayer then return false end 

        if pl:Name() == mn then return false end

        if #ptbl > 5 then
            if lastname == pl:Name() then return  false end
        end

        return true
    end

    local function changename(name)
        ded.NetSetConVar("name",name.." ")

        if changed >= 2 then
            changed = 0
            lastname = name
        else
            changed = changed + 1
        end

        curtime = CurTime() + cooldown
    end

    function ultimate.nameChanger() 
        if curtime > CurTime() then return end

        local pltbl = player.GetAll()

        local len = pLocalPlayer:Name():len()

        local mname = string.sub(pLocalPlayer:Name(),1,len-1)

        local i = math.random(1,#pltbl)

        if not check(pltbl[i],mname,pltbl) then return end

        changename(pltbl[i]:Name())
    end
end

do
    local tply
    local chatdelay = CurTime()
    local inverterdown = false
        
    function ultimate.Think()
        if input.IsKeyDown(KEY_END) then 
            ultimate.Unload()
        end

        if input.IsKeyDown(KEY_DELETE) and not ultimate.kd then 
            ultimate.togglevisible()
    
            CloseDermaMenus()
        end

        ultimate.kd = input.IsKeyDown(KEY_DELETE)

        if ultimate.IsKeyDown( ultimate.cfg.binds["Ent add"] ) and not ultimate.ekd then
            local tr = pLocalPlayer:GetEyeTrace().Entity

            if IsValid( tr ) then 
                local class = tr:GetClass()

                if not ultimate.cfg.ents[ class ] then
                   ultimate.cfg.ents[ class ] = true
                else
                   ultimate.cfg.ents[ class ] = nil
                end
            end
        end

-- Оригинальный код для добавления в друзья
if ultimate.IsKeyDown(ultimate.cfg.binds["Player add"]) and not ultimate.ekd2 then
    local tr = pLocalPlayer:GetEyeTrace().Entity

    if IsValid(tr) and tr:GetClass() == "player" then 
        local steamId = tr:SteamID()

        if not ultimate.cfg.friends[steamId] then
            ultimate.cfg.friends[steamId] = true
        else
            ultimate.cfg.friends[steamId] = nil
        end
    end
end

-- Добавляем обработку Priority List по другой клавише (например, "Player priority")
if ultimate.IsKeyDown(ultimate.cfg.binds["Priority add"] or KEY_F4) and not ultimate.ekd3 then
    local tr = pLocalPlayer:GetEyeTrace().Entity

    if IsValid(tr) and tr:GetClass() == "player" then 
        local steamId = tr:SteamID()

        if not ultimate.cfg.priorityList[steamId] then
            ultimate.cfg.priorityList[steamId] = true
            print("[Priority] Добавлен игрок: "..tr:Name())
        else
            ultimate.cfg.priorityList[steamId] = nil
            print("[Priority] Удален игрок: "..tr:Name())
        end
    end
end

        if ultimate.cfg.vars["Inverter"] and ultimate.IsKeyDown( ultimate.cfg.binds["Inverter"] ) and not inverterdown then
            ultimate.inverted = !ultimate.inverted 
        end

        inverterdown = ultimate.IsKeyDown( ultimate.cfg.binds["Inverter"] )

        ultimate.ekd = ultimate.IsKeyDown( ultimate.cfg.binds["Ent add"] )
        ultimate.ekd2 = ultimate.IsKeyDown( ultimate.cfg.binds["Player add"] )
        ultimate.ekd3 = ultimate.IsKeyDown( ultimate.cfg.binds["Priority add"] )

        if ultimate.IsKeyDown( ultimate.cfg.binds["Fullbright"] ) and not ultimate.fbkd then
            ultimate.fbe = not ultimate.fbe
        end

        ultimate.fbkd = ultimate.IsKeyDown( ultimate.cfg.binds["Fullbright"] )

        if ultimate.cfg.vars["FSpec ClickTP"] and ultimate.IsKeyDown( ultimate.cfg.binds["FSpec ClickTP"] ) then
            local pos = pLocalPlayer:GetEyeTrace().HitPos
            
            //print(pos)

            //RunConsoleCommand( "ba", "spec" )

            RunConsoleCommand( "FTPToPos", string.format("%d, %d, %d", pos.x, pos.y, pos.z), string.format("%d, %d, %d", 0, 0, 0) )
        end

        
        
        // ultimate.cfg.vars["FSpec Teleport"] = false
        // ultimate.cfg.binds["FSpec Teleport"] = 0
        
        // ultimate.cfg.vars["FSpec Masskill"] = false
        // ultimate.cfg.binds["FSpec Masskill"] = 0
        
        // ultimate.cfg.vars["FSpec Velocity"] = false
        // ultimate.cfg.binds["FSpec Velocity"] = 0

        if ultimate.cfg.vars["Chat spammer"] and CurTime() > chatdelay then
            local chatPrefixes = {
                [2] = "/ooc ",
                [3] = "/ad "
            }
            
            local chatGroup = ultimate.cfg.vars["Chat group"]
            
            local prefix = chatPrefixes[chatGroup] or ""
        
            local tbl = ultimate.chatmsg[ ultimate.cfg.vars["Chat mode"] ]
            local str = prefix .. tbl[ math.random( 1, #tbl ) ]

            local players   = player.GetAll()

            local random_ply = players[ math.random( 1, #players ) ]
            if random_ply == pLocalPlayer then return end

            str = string.format( str, ultimate.playerCache[ random_ply ].Name )

            RunConsoleCommand("say", str)

            chatdelay = CurTime() + ultimate.cfg.vars["Chat delay"]
        end
    
        if ultimate.cfg.vars["Name stealer"] then ultimate.nameChanger() end
    
        if ded.GetCurrentCharge() < ultimate.cfg.vars["Shift ticks"] then ded.StartShifting( false ) end

        if ultimate.cfg.vars["Tickbase shift"] then 
            if ultimate.IsKeyDown( ultimate.cfg.binds["Tickbase shift"] ) then
                ded.StartShifting( true )
            end
            
            local shouldcharge =  ded.GetCurrentCharge() < ultimate.cfg.vars["Charge ticks"] and ultimate.IsKeyDown( ultimate.cfg.binds["Auto recharge"] )
            
            ded.StartRecharging( shouldcharge )
        
            if shouldcharge then
                ded.StartShifting( false )
            end
        end
    
        if ultimate.cfg.vars["Taunt spam"] and ultimate.nextact < CurTime() and pLocalPlayer:Alive() then 
            local act = ultimate.actCommands[ultimate.cfg.vars["Taunt"]]
    
            RunConsoleCommand("act", act)
            ultimate.nextact = CurTime() + 0.3
        end
    
        if ultimate.cfg.vars["Taunt 2"] and ultimate.nextact2 < CurTime() and pLocalPlayer:Alive() then
            local act2 = ultimate.act2Commands[ultimate.cfg.vars["Taunt 2.1"]]
    
            RunConsoleCommand("act2", act2)
            ultimate.nextact2 = CurTime() + 0.3
        end

        if ultimate.cfg.vars["Yaw base"] == 2 then
            tply = ultimate.GetSortedPlayers( 1, 0, 1, false ) 
    
            if tply then
                ultimate.aatarget = tply[1][1]
            end
        end

        if ultimate.cfg.vars["Auto peak"] then
            ultimate.autopeakThink()
        end
    end
end


/*
    hooks -> CalcView
*/

ultimate.vieworigin = pLocalPlayer:EyePos()
ultimate.viewfov    = 0
ultimate.znear      = 0

ultimate.tpenabled = false
ultimate.tptoggled = false

ultimate.fcvector = pLocalPlayer:EyePos()
ultimate.fcangles = pLocalPlayer:EyeAngles()
ultimate.fcenabled = false
ultimate.fctoggled = false


/* // TODO
ultimate.checkbox("Collision","Third person collision",p:GetItemPanel())
ultimate.checkbox("Smoothing","Third person smoothing",p:GetItemPanel())

ultimate.slider("X","Viewmodel x",1,180,0,p:GetItemPanel())
ultimate.slider("Y","Viewmodel y",1,180,0,p:GetItemPanel())
ultimate.slider("Z","Viewmodel z",1,180,0,p:GetItemPanel())
ultimate.slider("Roll","Viewmodel r",1,360,0,p:GetItemPanel())
*/

function ultimate.ShouldDrawLocalPlayer(ply)
    if ( ultimate.tpenabled ) then
        ply:SetNoDraw( false )
    end
    return ultimate.tpenabled 
end

ultimate.cameraHullMax = Vector( 3, 3, 3 )
ultimate.cameraHullMin = Vector( -3, -3, -3 )
function ultimate.CalcView( ply, origin, angles, fov, znear, zfar )
    if ultimate.UnSafeFrame then 
        return { origin = origin, angles = angles, fov = fov } 
    end

    local view = {}

    local tppressed = ultimate.IsKeyDown(ultimate.cfg.binds["Third person"])
    local fcpressed = ultimate.IsKeyDown(ultimate.cfg.binds["Free camera"])

    if ultimate.cfg.vars["Third person"] and tppressed and not ultimate.tptoggled then
        ultimate.tpenabled = not ultimate.tpenabled
    end

    if ultimate.cfg.vars["Free camera"] and fcpressed and not ultimate.fctoggled then
        ultimate.fcenabled = not ultimate.fcenabled
        ultimate.fcangles = pLocalPlayer:EyeAngles()
    elseif ultimate.fcenabled and not ultimate.cfg.vars["Free camera"] then
        ultimate.fcenabled = false
    end

    ultimate.tptoggled = tppressed
    ultimate.fctoggled = fcpressed


    if ultimate.cfg.vars["Fake duck"] and ultimate.IsKeyDown(ultimate.cfg.binds["Fake duck"]) then
        origin.z = pLocalPlayer:GetPos().z + 64
    end

    local fangs = ultimate.cfg.vars["Silent aim"] and ultimate.SilentAngle or angles

    //angles = fangs
    //if not ultimate.cfg.vars[ "Norecoil" ] then
    //    angles:Add( ply:GetViewPunchAngles() )
    //end

    if ultimate.fcenabled then
        local speed = ultimate.cfg.vars["Free camera speed"]
        
        if input.IsKeyDown(KEY_W) then
            ultimate.fcvector = ultimate.fcvector + ultimate.SilentAngle:Forward() * speed
        end

        if input.IsKeyDown(KEY_S) then
            ultimate.fcvector = ultimate.fcvector - ultimate.SilentAngle:Forward() * speed
        end

        if input.IsKeyDown(KEY_A) then
            ultimate.fcvector = ultimate.fcvector - ultimate.SilentAngle:Right() * speed
        end

        if input.IsKeyDown(KEY_D) then
            ultimate.fcvector = ultimate.fcvector + ultimate.SilentAngle:Right() * speed
        end

        if input.IsKeyDown(KEY_SPACE) then
            ultimate.fcvector.z = ultimate.fcvector.z + speed
        end

        if input.IsKeyDown(KEY_LSHIFT) then
            ultimate.fcvector.z = ultimate.fcvector.z - speed
        end

        view.origin = ultimate.fcvector
        view.angles = fangs
        view.fov = ultimate.cfg.vars["Fov override"]
        view.drawviewer = !ultimate.cfg.vars["Ghetto free cam"]
    else
        ultimate.fcvector = origin
        view.origin = ultimate.tpenabled and origin - ( (fangs):Forward() * ultimate.cfg.vars["Third person distance"] ) or origin

        if ultimate.tpenabled and ultimate.cfg.vars["Third person collision"] then
            local tr = {}

            tr.start = origin
            tr.endpos = origin - ( (fangs):Forward() * ultimate.cfg.vars["Third person distance"] )
            tr.mins = ultimate.cameraHullMin
            tr.maxs = ultimate.cameraHullMax
            tr.filter = ply
            tr.mask = MASK_BLOCKLOS

            local res = TraceHull( tr )

            view.origin = res.HitPos
        end

        view.angles = fangs
        view.fov = ultimate.cfg.vars["Fov override"]
        view.drawviewer = hook.Call( "ShouldDrawLocalPlayer", nil, ply )
    end

    ultimate.vieworigin = ( ultimate.cfg.vars["Ghetto free cam"] and ultimate.fcenabled ) and ultimate.fcvector or origin
    ultimate.viewfov    = view.fov
    ultimate.znear      = znear

    if ( not ultimate.cfg.vars["Override view"] ) then
        if ( math.floor( fov ) ~= GetConVar( "fov_desired" ):GetFloat() ) then
            view.fov = fov 
        end

        local pVehicle = pLocalPlayer:GetVehicle()

        if ( IsValid( pVehicle ) ) then
            view = hook.Run( "CalcVehicleView", pVehicle, ply, view )
        end

        local pWeapon = pLocalPlayer:GetActiveWeapon()
        
        if ( IsValid( pWeapon ) ) then
            local pWeaponCalcView = pWeapon.CalcView 

            if ( pWeaponCalcView ) then
                local origin, angles, fov = pWeaponCalcView( pWeapon, ply, Vector( view.origin ), Angle( view.angles ), view.fov ) 
			    view.origin, view.angles, view.fov = origin or view.origin, angles or view.angles, fov or view.fov
            end
        end
    end
	return view
end

function ultimate.GetFovRadius()
    local Radius = ultimate.cfg.vars["Aimbot FOV"]

    local Ratio = screenWidth / screenHeight
    local AimFOV = Radius * (math.pi / 180)
    local GameFOV = ultimate.viewfov * (math.pi / 180)
    local ViewFOV = 2 * math.atan(Ratio * (ultimate.znear / 2) * math.tan(GameFOV / 2))



    return (math.tan(AimFOV) / math.tan(ViewFOV / 2)) * screenWidth
end

/*
    hooks -> CalcViewModelView
*/

function ultimate.CalcViewModelView(wep, vm, oldPos, oldAng, pos, ang)
    if wep.CalcViewModelView then wep.CalcViewModelView = nil end

    pos = ultimate.vieworigin 
	ang = ultimate.cfg.vars["Silent aim"] and ultimate.SilentAngle or ang

	return pos, ang
end

/*
    hooks -> Pre / Post DrawViewModel
*/

do
    local drawing = false

    function ultimate.PreDrawViewModel( vm, ply, w )
        if ultimate.UnSafeFrame then return end
        if ply != pLocalPlayer then return end

        if ultimate.cfg.vars["Viewmodel chams"] then
            local col = string.ToColor( ultimate.cfg.colors["Viewmodel chams"] )
            ultimate.chamMats.vis[6]:SetVector( "$envmaptint", Vector( col.r / 255, col.g / 255, col.b / 255 ) )
            local mat = ultimate.chamMats.vis[ultimate.cfg.vars["Viewmodel chams type"]] 

            render.SetBlend(col.a/255)
            render.SetColorModulation(col.r/255,col.g/255,col.b/255)
            render.MaterialOverride(mat)
        end

        if ultimate.cfg.vars["Fullbright viewmodel"] then
            render.SuppressEngineLighting( true )
        end

        if ultimate.cfg.vars["Viewmodel fov"] != GetConVar("viewmodel_fov"):GetInt() and not drawing then 
            cam.Start3D(nil, nil, ultimate.cfg.vars["Viewmodel fov"])

                drawing = true

                render.DepthRange( 0, 0.01 )

                vm:DrawModel()

                render.DepthRange( 0, 1 )

                drawing = false

            cam.End3D()
        else
            return 
        end
        
        return true
    end

end

function ultimate.PostDrawViewModel( vm, ply, w )
    render.SetColorModulation(1, 1, 1)
    render.MaterialOverride()
    render.SetBlend(1)
    render.SuppressEngineLighting(false)
end

/*
    hooks -> OnImpact ( c++ module )
*/
ultimate.bulletImpacts = {}

function ultimate.OnImpact( data )
    local startpos = data.m_vStart 

    if ultimate.cfg.vars[ "Bullet tracers muzzle" ] and data.m_vStart == pLocalPlayer:EyePos() then
        local vm = pLocalPlayer:GetViewModel()
	    local wep = pLocalPlayer:GetActiveWeapon()

        if vm && IsValid( wep ) && IsValid( vm ) then
            local muzzle = vm:LookupAttachment( "muzzle" )
			
		    if muzzle == 0 then
			    muzzle = vm:LookupAttachment( "1" )
		    end

            if vm:GetAttachment( muzzle ) then
                startpos = vm:GetAttachment( muzzle ).Pos
            end
        end
    end

    ultimate.bulletImpacts[#ultimate.bulletImpacts + 1] = {
        shootTime = CurTime(),
        startPos = startpos,
        endPos = data.m_vOrigin,
        hitbox = data.m_nHitbox,
        alpha = 255
    }
end




/*
    hooks -> PostDrawOpaqueRenderables
*/

do
    local oldtrmat = ultimate.cfg.vars["Bullet tracers material"]
    local tracemat = Material("sprites/tp_beam001")

    local realcolor, fakecolor, lbycolor = Color( 0, 255, 0 ), Color( 255, 0, 0 ), Color( 0, 0, 255 )



    -- Saddam Hussein
    /*
    local bIsSaddamHusseinGenerated = false 
    local pSaddamHussein = { Model = ClientsideModel( "models/player/breen.mdl" ) }
    local flSysTime = SysTime()

    while ( not pSaddamHussein.Position ) do
        local vecRandom = VectorRand( -4096, 4096 )

        if ( not util.TraceLine( { collisiongroup = COLLISION_GROUP_WORLD, start = pos, endpos = pos } ).HitWorld ) then
            pSaddamHussein.Position = util.TraceLine( { collisiongroup = COLLISION_GROUP_WORLD, start = vecRandom, endpos = vecRandom + Vector( 0, 0, -1 ) * 50000 } ).HitPos
            pSaddamHussein.Position.z = pSaddamHussein.Position.z + 16
        end
    end

    print( string.format( "Generated Saddam Hussein in %fs, approximate location: %s.", SysTime() - flSysTime, pSaddamHussein.Position ) )

    pSaddamHussein.Model:SetPos( pSaddamHussein.Position )
    pSaddamHussein.Model:SetAngles( Angle( -90, 0, 0 ) )
    pSaddamHussein.Model:SetNoDraw( true )
*/

    function ultimate.PostDrawOpaqueRenderables()

        if ultimate.UnSafeFrame then return end

        if ultimate.cfg.vars["Angle arrows"] then
            local pos = pLocalPlayer:GetPos()

            cam.IgnoreZ(true)

            cam.Start3D2D( pos, Angle(0, ultimate.realAngle.y + 45, 0), 1 )
                surface.SetDrawColor( realcolor )
                surface.DrawLine( 0, 0, 25, 25 )
            cam.End3D2D()
    
            cam.Start3D2D( pos, Angle(0, ultimate.fakeAngles.angle.y + 45, 0), 1 )
                surface.SetDrawColor( fakecolor )
                surface.DrawLine( 0, 0, 25, 25 )
            cam.End3D2D()
    
            local lby = ded.GetCurrentLowerBodyYaw( pLocalPlayer:EntIndex() )
            cam.Start3D2D( pos, Angle(0, lby + 45, 0), 1 )
                surface.SetDrawColor( lbycolor )
                surface.DrawLine( 0, 0, 25, 25 )
            cam.End3D2D()
    
            cam.IgnoreZ( false )
        end

        if ultimate.cfg.vars["Bullet tracers"] then
            local trmat = ultimate.cfg.vars["Bullet tracers material"] 
    
            if trmat != oldtrmat then
                tracemat = Material( trmat )
                oldtrmat = trmat
            end

            render.SetMaterial( tracemat ) 
    
            local tracercolor = string.ToColor(ultimate.cfg.colors["Bullet tracers"])
            local oldAlpha = tracercolor.a

            local curTime = CurTime()
            local dieTime = ultimate.cfg.vars["Tracers die time"]
    
            for i = #ultimate.bulletImpacts, 1, -1 do
                local impact = ultimate.bulletImpacts[i]

                if (curTime - impact.shootTime) > dieTime then
                    table.remove(ultimate.bulletImpacts, i)
                    continue
                end

                tracercolor.a = 255 - ( ( curTime - impact.shootTime ) / dieTime * 255 )
    
                render.DrawBeam( impact.startPos, impact.endPos, 1, 1, 1, tracercolor )
            end

            tracercolor.a = oldAlpha
        end

        

        if ultimate.cfg.vars["Auto peak"] and ultimate.startedPeeking then
            ultimate.drawAutopeak()
        end






        -- Saddam Hussein
        /*
        if ( pSaddamHussein.Position:DistToSqr( pLocalPlayer:EyePos() ) <= ( 2048 ^ 2 ) ) then
            render.MaterialOverride( Material( "!flat" ) ) 
            render.SetColorModulation( 255, 0, 0 )
            render.SetBlend( 255 ) 

            cam.IgnoreZ( true )
                pSaddamHussein.Model:DrawModel()

                cam.Start3D2D( pSaddamHussein.Position, Angle( 0, 0, 90 ), 0.25 )
                    surface.SetDrawColor( 0, 0, 0 )
                    surface.DrawRect( -128, -200, 4, 200 )

                    surface.SetFont( "saddamhussein" )
                    surface.SetTextColor( 0, 0, 0 )

                    surface.SetTextPos( -128, -256 )
                    surface.DrawText( "Saddam Hussein" )
                cam.End3D2D()
            cam.IgnoreZ( false )
        end
        */
    end 
end

/*
    hooks -> FrameStageNotify ( c++ module )
*/

function ultimate.GetUserGroup(ply)
    if ply.GetUserGroup then
        return ply:GetUserGroup()
    elseif ply.GetRankTable and ply:GetRankTable().NiceName then
        // fix for RusEliteRP
        return ply:GetRankTable().NiceName
    else
        return "unknown"
    end
end

function ultimate.GetTeam( ply )
    local iTeam = ply:Team()

    if rp and rp.GetJobWithoutDisguise then
        local index = rp.GetJobWithoutDisguise( ply:EntIndex() ) 
        local tbl = rp.jobs.List[ index ]

        return index, tbl.Name, tbl.Color
    else
        return iTeam, team.GetName(iTeam), team.GetColor(iTeam)
    end
end

// Player data tables

ultimate.playerCache = {}

function ultimate.playerTableUpdate( ply )
    if not ultimate.playerCache[ ply ] then
        ultimate.playerCache[ ply ] = {}
    end
    
    local v = ultimate.playerCache[ ply ]

    v.entity = ply
    
    v.Name = ply:Name()

    local index, name, color = ultimate.GetTeam( ply )

    v.Team = index
    v.TeamColor = color
    v.TeamName = name

    v.GetUserGroup = ultimate.GetUserGroup(ply)

    v.Health = ply:Health()
    v.GetMaxHealth = ply:GetMaxHealth()

    v.Armor = ply:Armor()
    v.GetMaxArmor = ply:GetMaxArmor()

    v.GetPos = ply:GetPos()

    v.ObserverMode = ply:GetObserverMode()
    v.ObserverTarget = ply:GetObserverTarget()

    local w = ply:GetActiveWeapon()

    v.WeaponClass = IsValid(w) and ( ultimate.cfg.vars["Weapon printname"] and language.GetPhrase( w:GetPrintName() ) or w:GetClass() ) or "Unarmed"
    v.WeaponAmmo = IsValid(w) and w:Clip1() or "-"
 
    v.MoneyVar = MetaPlayer.getDarkRPVar and DarkRP.formatMoney(ply:getDarkRPVar("money")) or "beggar"
end

function ultimate.playerDataUpdate( )

    ultimate.playerCache = {}

    local plys = player.GetAll()

    for i = 1, #plys do
        local v = plys[i]

        if v == pLocalPlayer then continue end
    
        ultimate.playerTableUpdate( v )
    end
end

// Entity data

ultimate.entityCache = {}
ultimate.cfg.ents = {}

function ultimate.entTableUpdate()
    
    ultimate.entityCache = {}

    local entitys = ents.GetAll()

    for i = 1, #entitys do
        local v = entitys[ i ]
        local v_class = v:GetClass()

        if not IsValid( v ) then continue end 
        if v_class == "player" then continue end
        if not ultimate.cfg.ents[ v_class ] then continue end

        ultimate.entityCache[ #ultimate.entityCache + 1 ] = {
            entity = v,
            class = v_class,
            position = v:GetPos(),
        }
    end
end



// Resolver 

ultimate.bruteYaw = { -180, -120, -90, -60, -30, 0, 30, 60, 90, 120, 180  }
















do
    local localData = {}

    localData.origin = Vector()

    function ultimate.FillLocalNetworkData( netdata )
        localData.origin     =   netdata[1]
    end
    
    function ultimate.GetLocalNetworkData()
        return localData
    end
end


do
    local missedTicks = 0
    local lastSimTime = 0

    local FRAME_START = 0
    local FRAME_NET_UPDATE_START = 1
    local FRAME_NET_UPDATE_POSTDATAUPDATE_START = 2
    local FRAME_NET_UPDATE_POSTDATAUPDATE_END = 3
    local FRAME_NET_UPDATE_END = 4
    local FRAME_RENDER_START = 5
    local FRAME_RENDER_END = 6

    function ultimate.PreFrameStageNotify( stage )
        local plys = player.GetAll()

        if stage == FRAME_NET_UPDATE_POSTDATAUPDATE_END then

            ultimate.entTableUpdate()

            plys = player.GetAll()

            local orig = pLocalPlayer:GetNetworkOrigin()

            local data = {}

            data[1] = orig      // last networked origin

            ultimate.FillLocalNetworkData( data )

            for i = 1, #plys do
                local v = plys[i]

                //if !v.ult_prev_pos then continue end

                local cur_simtime = ded.GetSimulationTime(v:EntIndex())
                local cur_pos = v:GetNetworkOrigin()

                --v.ult_cur_pos = cur_pos

                if not v.ult_prev_simtime then
                    v.ult_prev_simtime = cur_simtime
                    v.ult_prev_pos = cur_pos
                    // v.ult_prev_hitbox_pos = cur_pos
                    v.flticks = 0
                    v.missedanimticks = 0
                    v.simtime_updated = false 
                    v.break_lc = false

                    ultimate.btrecords[ v ] = {}
                    ultimate.predicted[ v ] = {}

                    v.aimshots = 0
                    v.fakepitch = v:EyeAngles().p > 90

                elseif v.ult_prev_simtime != cur_simtime then
                    local flticks = ultimate.TIME_TO_TICKS(cur_simtime-v.ult_prev_simtime)

                    // print(v,flticks )

                    ded.SetMissedTicks( flticks )
                    ded.AllowAnimationUpdate( true )

                    v.flticks = math.Clamp(flticks,1,24)

                    v.ult_prev_simtime = cur_simtime

                    v.break_lc = cur_pos:DistToSqr(v.ult_prev_pos) > 4096

                    --if v.ult_prev_pos != v.ult_cur_pos then
                    v.ult_prev_pos = cur_pos

                    // v.ult_prev_hitbox_pos = ultimate.getHitbox(v)
                    --end 
                    v.fakepitch = v:EyeAngles().p > 90

                    v.simtime_updated = true
                else
                    v.simtime_updated = false
                end

                if ultimate.canBacktrack(v) and v != pLocalPlayer and v.simtime_updated then
                    ultimate.recordBacktrack(v)
                end

                if v.break_lc then
                    ultimate.btrecords[ v ] = {}
                end

                /*
                if ultimate.cfg.vars["Extrapolation"] and v.simtime_updated and v != pLocalPlayer then
                    -- Получаем текущую позицию игрока
                    local currentPos = v:GetNetworkOrigin()
                    local currentTime = ded.GetSimulationTime(v:EntIndex())
                    
                    -- Вычисляем время предсказания с ограничением
                    local predTime = math.min(ded.GetLatency(0) + ded.GetLatency(1), 0.2) -- Максимум 200ms
                    
                    -- Проверяем, есть ли предыдущая позиция для сравнения
                    if not v.ult_prev_pos then
                        v.ult_prev_pos = currentPos
                        v.ult_prev_time = currentTime
                        return
                    end
                    
                    -- Вычисляем скорость движения
                    local timeDelta = currentTime - (v.ult_prev_time or currentTime)
                    if timeDelta <= 0 then return end
                    
                    local velocity = (currentPos - v.ult_prev_pos) / timeDelta
                    local speed = velocity:Length()
                    
                    -- Ограничиваем максимальную скорость для предотвращения телепортации
                    local maxSpeed = 1000 -- Максимальная разумная скорость
                    if speed > maxSpeed then
                        velocity = velocity:GetNormalized() * maxSpeed
                    end
                    
                    -- Начинаем симуляцию
                    ded.StartSimulation(v:EntIndex())
                    
                    local predictedPos = currentPos
                    local ticks = ultimate.TIME_TO_TICKS(predTime)
                    
                    -- Ограничиваем количество тиков
                    ticks = math.min(ticks, 20) -- Максимум 20 тиков
                    
                    for tick = 1, ticks do
                        ded.SimulateTick()
                        local data = ded.GetSimulationData()
                        
                        -- Проверяем на разумность позиции
                        local posChange = (data.m_vecAbsOrigin - predictedPos):Length()
                        if posChange > 200 then -- Если изменение позиции слишком большое
                            break -- Прерываем симуляцию
                        end
                        
                        predictedPos = data.m_vecAbsOrigin
                        debugoverlay.Cross(predictedPos, 6, 0.1, ultimate.Colors["Red"], true)
                    end
                    
                    local finalData = ded.GetSimulationData()
                    
                    -- Дополнительная проверка на разумность финальной позиции
                    local totalChange = (finalData.m_vecAbsOrigin - currentPos):Length()
                    if totalChange > 500 then -- Если изменение слишком большое
                        -- Используем линейную экстраполяцию вместо симуляции
                        predictedPos = currentPos + velocity * predTime
                    else
                        predictedPos = finalData.m_vecAbsOrigin
                    end
                    
                    -- Плавное смешивание между текущей и предсказанной позицией
                    local blendFactor = math.min(predTime * 2, 1.0) -- Плавность смешивания
                    local smoothedPos = currentPos + (predictedPos - currentPos) * blendFactor
                    
                    -- Устанавливаем позицию рендеринга
                    v:SetRenderOrigin(smoothedPos)
                    
                    -- Обновляем debug информацию
                    debugoverlay.Box(smoothedPos, v:OBBMins(), v:OBBMaxs(), 0.1, color_white)
                    
                    -- Сохраняем данные для следующего кадра
                    v.ult_prev_pos = currentPos
                    v.ult_prev_time = currentTime
                    
                    -- Обновляем таблицу предсказанных позиций
                    local boneData = ultimate.GetBones(v)
                    if boneData and boneData[1] then
                        ultimate.predicted[v] = {
                            pos = boneData[1],
                            tick = ultimate.TIME_TO_TICKS(currentTime + predTime),
                            confidence = math.max(0, 1 - (predTime * 2)) -- Уверенность в предсказании
                        }
                    end
                    
                    ded.FinishSimulation()
                end
                */

                if ultimate.cfg.vars["Extrapolation"] and v.break_lc then
                    local predTime = ded.GetLatency(0) + ded.GetLatency(1)
                    ded.StartSimulation(v:EntIndex())
        
                    for tick = 1, ultimate.TIME_TO_TICKS(predTime) do
                        ded.SimulateTick()
                    end
        
                    local data = ded.GetSimulationData()
                    v:SetRenderOrigin(data.m_vecAbsOrigin)
                    v:SetNetworkOrigin(data.m_vecAbsOrigin)
                    ded.FinishSimulation()
                end

            end
        elseif stage == FRAME_RENDER_START then
            plys = player.GetAll()

            for i = 1, #plys do
                local v = plys[i]

                if v == pLocalPlayer then continue end
            end
        end
    end
end


function ultimate.PostFrameStageNotify( stage ) 
    if stage == 3 then
        ultimate.playerDataUpdate()

        /*local playerlist = player.GetAll()

        for i = 1, #playerlist do
            local pEntity = playerlist[ i ]

            local iEntIndex = pEntity:EntIndex()
            local pTable = pEntity:GetTable()

            -- Simulation time 
            local flSimulationTime = ded.GetSimulationTime( iEntIndex )

            pTable.iChokedCommands = Utility.TimeToTicks( flSimulationTime - pTable.flSimulationTime )
            pTable.bIsSimulated = flSimulationTime ~= pTable.flSimulationTime
            pTable.flSimulationTime = flSimulationTime    
        end*/
    end
end

/*
    hooks -> ShouldUpdateAnimation ( cpp )
*/

ultimate.fakeAngles = {
    angle = pLocalPlayer:EyeAngles(),
    movex = 0,
    movey = 0,
    layers = {},
    seq = 0,
    cycle = 0,
    origin = pLocalPlayer:GetPos(),
}

function ultimate.UpdateAnimation( v )
    v:InvalidateBoneCache()
end

function ultimate.ShouldUpdateAnimation( entIndex ) 
    local ent = Entity( entIndex )

    if not ent.simtime_updated then return end

    ded.SetMissedTicks( ent.flticks )
    ded.AllowAnimationUpdate( true )
end

// AA shit
ultimate.realModel = ultimate.CS_Model( pLocalPlayer:GetModel() )
ultimate.fakeModel = ultimate.CS_Model( pLocalPlayer:GetModel() )

ultimate.newModel = pLocalPlayer:GetModel()

function ultimate.drawCSModels_real()
    if not ultimate.cfg.vars["Anti aim chams"] or not ultimate.tpenabled then 
        return 
    end 
    if not pLocalPlayer:Alive() then 
        return 
    end

    local mymodel = pLocalPlayer:GetModel()

    if ultimate.newModel != mymodel then
        ultimate.CS_Model( mymodel )
        ultimate.newModel = mymodel
    end

    local tbl = {
        layers = ultimate.fakeAngles.layers,
        angles = ultimate.fakeAngles.angle,
        sequence = ultimate.fakeAngles.seq,
        cycle = ultimate.fakeAngles.cycle,
        origin = ultimate.fakeAngles.origin,
        movex = ultimate.fakeAngles.movex,
        movey = ultimate.fakeAngles.movey,
    }

    ultimate.CS_Model_update( pLocalPlayer, ultimate.realModel, tbl )

    if ultimate.cfg.vars["Antiaim fullbright"] then
        render.SuppressEngineLighting(true)
    end

    local col = string.ToColor(ultimate.cfg.colors["Real chams"])
    ultimate.chamMats.invis[6]:SetVector( "$envmaptint", Vector( col.r / 255, col.g / 255, col.b / 255 ) )
    render.MaterialOverride(ultimate.chamMats.invis[ultimate.cfg.vars["Antiaim material"]]) 
    render.SetColorModulation(col.r/255,col.g/255,col.b/255)
    render.SetBlend(col.a/255) 
    ultimate.realModel:SetRenderMode(1)
    ultimate.realModel:DrawModel()

    if ultimate.cfg.vars["Antiaim fullbright"] then
        render.SuppressEngineLighting(false)
    end
end

/*
    hooks -> PostDrawEffects
*/

do
    /*
            

    */

    local CopyMat		= Material("pp/copy")
    local AddMat		= Material( "pp/add" )
    local SubMat		= Material( "pp/sub" )
    local OutlineMat	= CreateMaterial("OutlineMat","UnlitGeneric",{["$ignorez"] = 1,["$alphatest"] = 1})

    local outline_mats = {
        [1] = OutlineMat,
        [2] = SubMat,
        [3] = AddMat,
        [4] = GradMat,
        [5] = BloomMat,
    }

    local subclear = {
        [2] = true,
        //[4] = true,
    }
    
    ultimate.cfg.vars["Player outline"] = false
    ultimate.cfg.vars["Entity outline"] = false
    ultimate.cfg.colors["Player outline"] = "45 255 86 255"
    ultimate.cfg.colors["Entity outline"] = "255 86 45 255"

    local StoreTexture	= render.GetScreenEffectTexture(0)
    local DrawTexture	= render.GetScreenEffectTexture(1)

    function ultimate.RenderOutline()
        local renderEnts = {}

        if ultimate.cfg.vars["Player outline"] then
            local plys = player.GetAll()

            for i = 1, #plys do 
                local v = plys[ i ]

                if not IsValid( v ) or v == pLocalPlayer or not v:Alive() or v:IsDormant() then continue end

                renderEnts[ #renderEnts + 1 ] = v
            end
        end

        if ultimate.cfg.vars["Entity outline"] then
            for i = 1, #ultimate.entityCache do
                local v = ultimate.entityCache[ i ].entity 

                if not IsValid( v ) or v:IsDormant() then continue end
        
                renderEnts[ #renderEnts + 1 ] = v
            end
        end

        if #renderEnts == 0 then return end

        local scene = render.GetRenderTarget()
        render.CopyRenderTargetToTexture(StoreTexture)
        
        if subclear[ ultimate.cfg.vars["Outline style"] ] then
            render.Clear( 255, 255, 255, 255, true, true )
        else
            render.Clear( 0, 0, 0, 0, true, true )
        end

        render.SetStencilEnable(true)
            cam.IgnoreZ(true)
            render.SuppressEngineLighting(true)
        
            render.SetStencilWriteMask(255)
            render.SetStencilTestMask(255)
            
            render.SetStencilCompareFunction(STENCIL_ALWAYS)
            render.SetStencilFailOperation(STENCIL_KEEP)
            render.SetStencilZFailOperation(STENCIL_REPLACE)
            render.SetStencilPassOperation(STENCIL_REPLACE)
            
            cam.Start3D()
                for i = 1, #renderEnts do 
                    render.SetStencilReferenceValue( i )

                    renderEnts[i]:DrawModel()
                end
            cam.End3D()
            
            render.SetStencilCompareFunction(STENCIL_EQUAL)
            
            cam.Start2D()
                for i = 1, #renderEnts do 
                    local c = renderEnts[i]:IsPlayer() and string.ToColor( ultimate.cfg.colors["Player outline"] ) or string.ToColor( ultimate.cfg.colors["Entity outline"] ) 

				    render.SetStencilReferenceValue( i )

                    surface.SetDrawColor( c )
                    surface.DrawRect( 0, 0, screenWidth, screenHeight )

                    // surface_SimpleTexturedRect( 0, 0, screenWidth, screenHeight, string.ToColor( ultimate.cfg.colors["Health bar gradient"] ) , ultimate.Materials["Gradient"] )
                end
            cam.End2D()
            
            render.SuppressEngineLighting(false)
            cam.IgnoreZ(false)
        render.SetStencilEnable(false)
        
        render.CopyRenderTargetToTexture(DrawTexture)

        if ultimate.cfg.vars["Outline style"] > 1 then 
            render.BlurRenderTarget( DrawTexture, 1, 1, 1 )
        end

        render.SetRenderTarget(scene)
        CopyMat:SetTexture("$basetexture",StoreTexture)
        render.SetMaterial(CopyMat)
        render.DrawScreenQuad()
        
        render.SetStencilEnable(true)
            render.SetStencilReferenceValue(0)
            render.SetStencilCompareFunction(STENCIL_EQUAL)
            
            local mat = outline_mats[ ultimate.cfg.vars["Outline style"] ]

            mat:SetTexture( "$basetexture", DrawTexture )
            render.SetMaterial( mat )
            
            for x=-1,1 do
                for y=-1,1 do
                    if x==0 and x==0 then continue end
                    
                    render.DrawScreenQuadEx(x,y,screenWidth,screenHeight)
                end
            end
        render.SetStencilEnable(false)
    end
end

hook.Add("PrePlayerDraw",  "WIP", function()
	for k, v in ipairs(player.GetAll()) do
        if ultimate.cfg.vars["Modelchanger"] then
            LocalPlayer():InvalidateBoneCache()
			LocalPlayer():SetSequence(LocalPlayer():GetSequence())
            local state = LocalPlayer():GetPredictable()
            LocalPlayer():SetPredictable(not state)
            LocalPlayer():SetPredictable(state)
            if ultimate.cfg.vars["Modelchanger model"] == 1 then
                LocalPlayer():SetModel("models/cyanblue/fate_extella_link/astolfo/astolfo.mdl")
            elseif ultimate.cfg.vars["Modelchanger model"] == 2 then
                LocalPlayer():SetModel("models/squids_pms/ocs/xani_protogen/xani_pm.mdl")
            elseif ultimate.cfg.vars["Modelchanger model"] == 3 then
                LocalPlayer():SetModel("models/walter/playermodels/walter.mdl")
            elseif ultimate.cfg.vars["Modelchanger model"] == 4 then
                LocalPlayer():SetModel("models/survivors/survivor_mechanic.mdl")
            elseif ultimate.cfg.vars["Modelchanger model"] == 5 then
                LocalPlayer():SetModel("models/ray/nikoo/nikopm.mdl")
            elseif ultimate.cfg.vars["Modelchanger model"] == 6 then
                LocalPlayer():SetModel("models/player/floyd/georgedroyd.mdl")
            elseif ultimate.cfg.vars["Modelchanger model"] == 7 then
                LocalPlayer():SetModel("models/jazzmcfly/bgs/bgs.mdl")
            elseif ultimate.cfg.vars["Modelchanger model"] == 8 then
                LocalPlayer():SetModel("models/invincible/mark/mark.mdl")
            elseif ultimate.cfg.vars["Modelchanger model"] == 9 then
                LocalPlayer():SetModel("models/good/goob_outlined.mdl")
            elseif ultimate.cfg.vars["Modelchanger model"] == 10 then
                LocalPlayer():SetModel("models/boykisser/boykisser.mdl")
            elseif ultimate.cfg.vars["Modelchanger model"] == 11 then   
                LocalPlayer():SetModel("models/adidas_combine/playermodel/adidas_combine.mdl")            
            end
            LocalPlayer():SetupBones()
        end
        /*if ultimate.cfg.vars["Player_modelchanger"] then
            v:InvalidateBoneCache()	
            v:SetupBones()
            if ultimate.cfg.vars["Player_modelchanger_agent"] == 1 then
                v:InvalidateBoneCache()	
                v:SetupBones()
                v:SetModel("models/player/charple.mdl")
            elseif ultimate.cfg.vars["Player_modelchanger_agent"] == 2 then
                v:InvalidateBoneCache()	
                v:SetupBones()
                v:SetModel("models/player/Group01/male_03.mdl")
            elseif ultimate.cfg.vars["Player_modelchanger_agent"] == 3 then
                v:InvalidateBoneCache()	
                v:SetupBones()
                v:SetModel("models/player/gman_high.mdl")
            elseif ultimate.cfg.vars["Player_modelchanger_agent"] == 4 then
                v:InvalidateBoneCache()	
                v:SetupBones()
                v:SetModel("models/player/zombie_classic.mdl")
                elseif ultimate.cfg.vars["Player_modelchanger_agent"] == 5 then
                v:InvalidateBoneCache()    
                v:SetupBones()
                v:SetModel("models/player/Astolfo.mdl")
            end			
        end*/
    
    end
		
	
end)


function ultimate.PostDrawEffects()
    if ultimate.UnSafeFrame then return end
    if not ultimate.cfg.vars["Player outline"] and not ultimate.cfg.vars["Entity outline"] then return end

    ultimate.RenderOutline()
end
    
function ultimate.AdjustMouseSensitivity( defaultSensivity )
    return ultimate.cfg.vars["Disable sensivity adjustment"] and 0 or nil
end

ultimate.fbe = false

function ultimate.PreRender()
    if ultimate.cfg.vars["Fullbright"] and ultimate.fbe then
        render.SetLightingMode( ultimate.cfg.vars["Fullbright mode"] )
    end
end

function ultimate.GetMotionBlurValues()
    render.SetLightingMode( 0 )
end

ded.ConVarSetFlags( "mat_fullbright", 0 )
ded.ConVarSetFlags( "r_aspectratio", 0 )
ded.ConVarSetFlags( "cl_showhitboxes", 0 )

function GAMEMODE:CreateMove( cmd ) return true end
function GAMEMODE:CalcView( view )  return true end
function GAMEMODE:ShouldDrawLocal() return true end

GAMEMODE["EntityFireBullets"] = function( self, p, data ) 
    if not ultimate.activeWeapon then return end

    local tick = engine.TickCount()
    if ultimate.cfg.vars[ "On screen logs" ] and data.Src == pLocalPlayer:EyePos() and ultimate.aimingrn and ultimate.target and not ultimate.onScreenLogs[ tick ] and IsFirstTimePredicted() then
        local reason = 1
        
        local tr = {}
        tr.filter = pLocalPlayer 
        tr.start = data.Src 
        tr.endpos = data.Src + data.Dir * 13337
        tr.mask = MASK_SHOT

        tr = TraceLine( tr )

        if ultimate.target.break_lc then
            reason = 4
        elseif ded.GetLatency( 0 ) > 0.2 then
            reason = 3
        elseif tr.StartSolid or tr.Hit and tr.Entity != ultimate.target then
            reason = 2
        end
        
        local hlcolor = string.ToColor( ultimate.cfg.colors[ ultimate.MissReasons[ reason ].var ] )
        local data = {
            tick = tick,
            { "Shot at ", ultimate.target:Name(), " missed due to ", ultimate.MissReasons[ reason ].str, },
            { ultimate.HitLogsWhite, hlcolor, ultimate.HitLogsWhite, hlcolor, }
        }
            
        ultimate.onScreenLogs[ tick ] = data
    end
 
    local spread = data.Spread * -1
    
	if ultimate.cones[ ultimate.activeWeaponClass ] == spread or spread == ultimate.nullVec then return end

    ultimate.cones[ ultimate.activeWeaponClass ] = spread;
end

function ultimate.SetupWorldFog()
    if not ultimate.cfg.vars[ "FogChanger" ] then return end 

    local color = string.ToColor(ultimate.cfg.colors["FogChanger"])
    

    render.FogMode( MATERIAL_FOG_LINEAR )
    render.FogColor( color.r, color.g, color.b )
    render.FogStart( ultimate.cfg.vars[ "FogStart" ] )
    render.FogEnd( ultimate.cfg.vars[ "FogEnd" ] ) 
    render.FogMaxDensity( color.a / 255 )
    
    return true 
end

function ultimate.SetupSkyboxFog( SkyboxSize )
    if not ultimate.cfg.vars[ "FogChanger" ] then return end 

    local color = string.ToColor(ultimate.cfg.colors["FogChanger"])

    render.FogMode( MATERIAL_FOG_LINEAR )
    render.FogColor( color.r, color.g, color.b )
    render.FogStart( ultimate.cfg.vars[ "FogStart" ] * SkyboxSize )
    render.FogEnd( ultimate.cfg.vars[ "FogEnd" ] * SkyboxSize ) 
    render.FogMaxDensity( color.a / 255 )
    
    return true 
end

function ultimate.CalcMainActivity(ply, velocity)
    if ultimate.cfg.vars["Invalidate activity"] and ply ~= LocalPlayer() then
        return -1, -1
    end
end

net.Receive("rp.police.SetLocalHandcuff", function()
    if not ultimate.cfg.vars["Retry on handcuff"] then return end
    
    RunConsoleCommand("retry")
end)

/*
    Hooks
*/

ultimate.hooks           = {}

function ultimate.AddHook( event, func )
    if func == nil and not ultimate[ event ] then print("Failed to find hook: " .. event) return end
    local name = util.Base64Encode( event ) .. CurTime()
    hook.Add( event, name, ultimate[ event ] or func )
    ultimate.hooks[ #ultimate.hooks + 1 ] = { event, name }
end

function ultimate.RemoveAllHooks()
    for i = #ultimate.hooks, 1, -1 do
        local chk = ultimate.hooks[i]
        hook.Remove(chk[1], chk[2])
        table.remove(ultimate.hooks, i)
    end
end

function ultimate.Unload()
    ultimate.frame:Remove()

    ded.SetBSendPacket( true )
    ded.SetInterpolation( true )
    ded.SetSequenceInterpolation( true )
    ultimate.RemoveAllHooks() 

    render.SetLightingMode( 0 )
end

ultimate.AddHook( "CreateMove" )
ultimate.AddHook( "Think" )

ultimate.AddHook( "RenderScene" )
ultimate.AddHook( "DrawOverlay" )
ultimate.AddHook( "Ungrabbable2D", function() ultimate.DrawESP() ultimate.DrawSomeShit() end )   

ultimate.AddHook( "CalcView" )
ultimate.AddHook( "CalcViewModelView" )

ultimate.AddHook( "PreDrawViewModel" )
ultimate.AddHook( "PostDrawViewModel" )

ultimate.AddHook( "PostDrawOpaqueRenderables" )
ultimate.AddHook( "PostDrawEffects" )

ultimate.AddHook( "OnImpact" )

ultimate.AddHook( "PreFrameStageNotify" )
ultimate.AddHook( "PostFrameStageNotify" )

ultimate.AddHook( "UpdateAnimation" )
ultimate.AddHook( "ShouldUpdateAnimation" )

ultimate.AddHook( "AdjustMouseSensitivity" )

ultimate.AddHook( "RenderScreenspaceEffects" )
ultimate.AddHook( "PostDrawTranslucentRenderables" )

ultimate.AddHook( "PreRender" )
ultimate.AddHook( "GetMotionBlurValues" )

ultimate.AddHook( "DrawPhysgunBeam" )

ultimate.AddHook( "PrePlayerDraw" )

ultimate.AddHook( "OnEntityCreated" )  

ultimate.AddHook( "entity_killed" )  
ultimate.AddHook( "player_hurt" )  

ultimate.AddHook( "SetupWorldFog" )
ultimate.AddHook( "SetupSkyboxFog" )

ultimate.AddHook( "ShouldDrawLocalPlayer" )
ultimate.AddHook( "CalcMainActivity" )



ultimate.knownTrackedPlayers = ultimate.knownTrackedPlayers or {}
ultimate.alreadyNotified = ultimate.alreadyNotified or {}

ultimate.trackedPlayers = {
["STEAM_0:1:436828002"] = true,
["STEAM_0:0:527475945"] = true,
["STEAM_0:1:543095867"] = true,
["STEAM_0:0:85161933"] = true,
["STEAM_0:0:539832760"] = true,
["STEAM_0:0:768366475"] = true,
["STEAM_0:1:839703715"] = true,
["STEAM_0:1:100134965"] = true,
["STEAM_0:1:190920688"] = true,
["STEAM_0:1:567882"] = true,
["STEAM_0:0:641838651"] = true,
["STEAM_0:1:589073347"] = true,
["STEAM_0:0:14148252"] = true,
["STEAM_0:0:811209569"] = true,
["STEAM_0:1:806312846"] = true,
["STEAM_0:0:556281083"] = true,
["STEAM_0:0:616631834"] = true,
["STEAM_0:0:453356413"] = true,
["STEAM_0:1:565888199"] = true,
["STEAM_0:1:813938330"] = true,
["STEAM_0:1:428620691"] = true,
["STEAM_0:0:529497837"] = true,
["STEAM_0:1:762276521"] = true,
["STEAM_0:1:448764194"] = true,
["STEAM_0:1:765078061"] = true,
["STEAM_0:1:106651565"] = true,
["STEAM_0:1:176142806"] = true,
["STEAM_0:1:455428067"] = true,
["STEAM_0:1:566826019"] = true,
["STEAM_0:1:16149313"] = true,
["STEAM_0:0:423333338"] = true,
["STEAM_0:1:600204671"] = true,
["STEAM_0:1:460002163"] = true,
["STEAM_0:1:795560908"] = true,
["STEAM_0:0:527794979"] = true,
["STEAM_0:1:2393854"] = true,
["STEAM_0:0:109145007"] = true,
["STEAM_0:1:702436824"] = true,
["STEAM_0:0:534763468"] = true,
["STEAM_0:0:4727797"] = true,
["STEAM_0:1:203904700"] = true,
["STEAM_0:0:41386936"] = true,
["STEAM_0:0:779325404"] = true,
["STEAM_0:0:39774534"] = true,
["STEAM_0:0:904420245"] = true,
["STEAM_0:1:547180217"] = true,
["STEAM_0:1:532170488"] = true,
["STEAM_0:1:579803502"] = true,
["STEAM_0:0:621614166"] = true,
["STEAM_0:1:579307406"] = true,
["STEAM_0:0:704051703"] = true,
["STEAM_0:0:144381831"] = true,
["STEAM_0:1:513066207"] = true,
["STEAM_0:0:105213013"] = true,
["STEAM_0:0:641587985"] = true,
["STEAM_0:0:62528412"] = true,
["STEAM_0:0:195296219"] = true,
["STEAM_0:1:705841459"] = true,
["STEAM_0:0:200336136"] = true,
["STEAM_0:1:587428386"] = true,
["STEAM_0:1:639100548"] = true,
["STEAM_0:0:485250012"] = true,
["STEAM_0:0:42185710"] = true,
["STEAM_0:1:540519170"] = true,
["STEAM_0:1:832608163"] = true,
["STEAM_0:0:51108817"] = true,
["STEAM_0:1:157029890"] = true,
["STEAM_0:1:546227826"] = true,
["STEAM_0:1:712876207"] = true,
["STEAM_0:1:593884587"] = true,
["STEAM_0:0:85931768"] = true,
["STEAM_0:1:755790469"] = true,
["STEAM_0:1:713442817"] = true,
["STEAM_0:1:239993978"] = true,
["STEAM_0:0:920903890"] = true,
["STEAM_0:0:421990246"] = true,
["STEAM_0:1:774602853"] = true,
["STEAM_0:1:484736827"] = true,
["STEAM_0:0:443419471"] = true,
["STEAM_0:1:577054975"] = true,
["STEAM_0:1:629293263"] = true,
["STEAM_0:1:555276375"] = true,
["STEAM_0:1:585861369"] = true,
["STEAM_0:1:775979697"] = true,
["STEAM_0:1:612388155"] = true,
["STEAM_0:0:569559588"] = true,
["STEAM_0:0:571089796"] = true,
["STEAM_0:1:508504180"] = true,
["STEAM_0:0:541075273"] = true,
["STEAM_0:1:607870972"] = true,
["STEAM_0:1:504308746"] = true,
["STEAM_0:1:570889301"] = true,
["STEAM_0:0:601460790"] = true,
["STEAM_0:0:664615776"] = true,
["STEAM_0:1:770395308"] = true,
["STEAM_0:1:165101731"] = true,
["STEAM_0:1:775416457"] = true,
["STEAM_0:1:244442659"] = true,
["STEAM_0:1:519663063"] = true,
["STEAM_0:0:164190289"] = true,
["STEAM_0:1:556253186"] = true,
["STEAM_0:0:786870009"] = true,
["STEAM_0:1:784802416"] = true,
["STEAM_0:0:165421836"] = true,
["STEAM_0:0:922388644"] = true,
["STEAM_0:1:636552585"] = true,
["STEAM_0:0:674935943"] = true,
["STEAM_0:1:628929307"] = true,
["STEAM_0:0:509236870"] = true,
["STEAM_0:1:853836896"] = true,
["STEAM_0:1:912278580"] = true,
["STEAM_0:1:204403113"] = true,
["STEAM_0:0:596711323"] = true,
["STEAM_0:0:635888330"] = true,
["STEAM_0:0:629576309"] = true,
["STEAM_0:0:640858754"] = true,
["STEAM_0:0:711503752"] = true,
["STEAM_0:1:557146787"] = true,
["STEAM_0:1:815938285"] = true,
["STEAM_0:1:424647225"] = true,
["STEAM_0:0:540487084"] = true,
["STEAM_0:0:568460345"] = true,
["STEAM_0:0:564544243"] = true,
["STEAM_0:1:578798068"] = true,
["STEAM_0:1:846772301"] = true,
["STEAM_0:0:626409394"] = true,
["STEAM_0:1:33128632"] = true,
["STEAM_0:1:229499093"] = true,
["STEAM_0:0:874984034"] = true,
["STEAM_0:1:797496435"] = true,
["STEAM_0:0:636153158"] = true,
["STEAM_0:0:231670303"] = true,
["STEAM_0:1:836118391"] = true,
["STEAM_0:0:56811722"] = true,
["STEAM_0:1:517211563"] = true,
["STEAM_0:0:633230814"] = true,
["STEAM_0:0:507509808"] = true,
["STEAM_0:1:648929572"] = true,
["STEAM_0:0:636273808"] = true,
["STEAM_0:0:559068505"] = true,
["STEAM_0:1:117597227"] = true,
["STEAM_0:0:509211855"] = true,
["STEAM_0:1:778468550"] = true,
["STEAM_0:0:450705388"] = true,
["STEAM_0:1:868884361"] = true,
["STEAM_0:0:486041428"] = true,
["STEAM_0:0:714504867"] = true,
["STEAM_0:0:531426256"] = true,
["STEAM_0:1:187613416"] = true,
["STEAM_0:0:462689539"] = true,
["STEAM_0:1:192913718"] = true,
["STEAM_0:0:804267023"] = true,
["STEAM_0:1:244388356"] = true,
["STEAM_0:0:605513382"] = true,
["STEAM_0:1:677960346"] = true,
["STEAM_0:1:517760046"] = true,
["STEAM_0:1:174311327"] = true,
["STEAM_0:0:756724781"] = true,
["STEAM_0:0:35717190"] = true,
["STEAM_0:1:76873410"] = true,
["STEAM_0:0:712512864"] = true,
["STEAM_0:0:865451227"] = true,
["STEAM_0:1:781603244"] = true,
["STEAM_0:1:765111757"] = true,
["STEAM_0:0:151653729"] = true,
["STEAM_0:1:792058179"] = true,
["STEAM_0:0:774141380"] = true,
["STEAM_0:1:522611108"] = true,
["STEAM_0:1:188616486"] = true,
["STEAM_0:1:778586351"] = true,
["STEAM_0:1:817429243"] = true,
["STEAM_0:0:775422976"] = true,
["STEAM_0:0:743578999"] = true,
["STEAM_0:1:186999125"] = true,
["STEAM_0:0:839382000"] = true,
["STEAM_0:0:631485478"] = true,
["STEAM_0:1:843710495"] = true,
["STEAM_0:1:636691197"] = true,
["STEAM_0:1:649239708"] = true,
["STEAM_0:1:535964227"] = true,
["STEAM_0:1:226101328"] = true,
["STEAM_0:0:538394034"] = true,
["STEAM_0:0:135734974"] = true,
["STEAM_0:0:502379199"] = true,
["STEAM_0:1:149906042"] = true,
["STEAM_0:0:150281729"] = true,
["STEAM_0:0:626788056"] = true,
["STEAM_0:0:769459253"] = true,
["STEAM_0:0:68377468"] = true,
["STEAM_0:1:583676910"] = true,
["STEAM_0:1:579605196"] = true,
["STEAM_0:1:567384525"] = true,
["STEAM_0:0:215017624"] = true,
["STEAM_0:0:574398411"] = true,
["STEAM_0:1:525915233"] = true,
["STEAM_0:1:53555168"] = true,
["STEAM_0:1:760503879"] = true,
["STEAM_0:1:193787083"] = true,
["STEAM_0:1:425150145"] = true,
["STEAM_0:1:514315052"] = true,
["STEAM_0:1:533247655"] = true,
["STEAM_0:1:497545627"] = true,
["STEAM_0:1:564877715"] = true,
["STEAM_0:1:774317159"] = true,
["STEAM_0:1:780000239"] = true,
["STEAM_0:0:475054153"] = true,
["STEAM_0:1:774522420"] = true,
["STEAM_0:1:129017331"] = true,
["STEAM_0:1:646389338"] = true,
["STEAM_0:1:421024681"] = true,
["STEAM_0:0:209746218"] = true,
["STEAM_0:0:212374353"] = true,
["STEAM_0:1:156546630"] = true,
["STEAM_0:1:737887038"] = true,
["STEAM_0:0:509725910"] = true,
["STEAM_0:1:639206089"] = true,
["STEAM_0:0:781200124"] = true,
["STEAM_0:1:50482471"] = true,
["STEAM_0:1:460011581"] = true,
["STEAM_0:0:84060435"] = true,
["STEAM_0:1:549114111"] = true,
["STEAM_0:0:171614366"] = true,
["STEAM_0:1:213591736"] = true,
["STEAM_0:0:201369258"] = true,
["STEAM_0:0:636144181"] = true,
["STEAM_0:0:428575723"] = true,
["STEAM_0:0:881096656"] = true,
["STEAM_0:0:848703377"] = true,
["STEAM_0:0:127506252"] = true,
["STEAM_0:1:418178655"] = true,
["STEAM_0:1:612009028"] = true,
["STEAM_0:0:135631558"] = true,
["STEAM_0:0:912930125"] = true,
["STEAM_0:1:712220742"] = true,
["STEAM_0:1:666883711"] = true,
["STEAM_0:1:922471308"] = true,
["STEAM_0:0:223427594"] = true,
["STEAM_0:0:657187892"] = true,
["STEAM_0:1:846102233"] = true,
["STEAM_0:0:91370481"] = true,
["STEAM_0:0:916551193"] = true,
["STEAM_0:1:860078324"] = true,
["STEAM_0:0:765632211"] = true,
["STEAM_0:0:539534285"] = true,
["STEAM_0:1:218419600"] = true,
["STEAM_0:1:779502874"] = true,
["STEAM_0:0:799384795"] = true,
["STEAM_0:1:833764577"] = true,
["STEAM_0:0:582141084"] = true,
["STEAM_0:0:551275401"] = true,
["STEAM_0:1:51776059"] = true,
["STEAM_0:1:784159876"] = true,
["STEAM_0:1:862543822"] = true,
["STEAM_0:0:513272382"] = true,
["STEAM_0:0:757793591"] = true,
["STEAM_0:0:49401058"] = true,
["STEAM_0:1:853430336"] = true,
["STEAM_0:1:644564560"] = true,
["STEAM_0:1:63306774"] = true,
["STEAM_0:0:571719635"] = true,
["STEAM_0:1:439425808"] = true,
["STEAM_0:1:98953571"] = true,
["STEAM_0:0:602528761"] = true,
["STEAM_0:1:90662689"] = true,
["STEAM_0:1:711444991"] = true,
["STEAM_0:1:528433029"] = true,
["STEAM_0:1:93569289"] = true,
["STEAM_0:1:170335505"] = true,
["STEAM_0:0:555584412"] = true,
["STEAM_0:0:630922153"] = true,
["STEAM_0:1:861441617"] = true,
["STEAM_0:1:77141376"] = true,
["STEAM_0:0:53755660"] = true,
["STEAM_0:0:657187892"] = true,
["STEAM_0:1:570360423"] = true,
["STEAM_0:0:520369783"] = true,
["STEAM_0:0:634678362"] = true,
["STEAM_0:1:27075092"] = true,
["STEAM_0:0:740515639"] = true,
["STEAM_0:0:793121967"] = true,
["STEAM_0:0:591420493"] = true,
["STEAM_0:1:583113641"] = true,
["STEAM_0:1:520863677"] = true,
["STEAM_0:0:444264538"] = true,
["STEAM_0:1:84188955"] = true,
["STEAM_0:1:231434392"] = true,
["STEAM_0:0:28441369"] = true,
["STEAM_0:1:657938019"] = true,
["STEAM_0:0:515314538"] = true,
["STEAM_0:1:781644113"] = true,
["STEAM_0:0:74295630"] = true,
["STEAM_0:0:234031824"] = true,
["STEAM_0:0:542694144"] = true,
["STEAM_0:1:919919275"] = true,
["STEAM_0:1:526065628"] = true,
["STEAM_0:1:836965014"] = true,
["STEAM_0:1:219758362"] = true,
["STEAM_0:0:777522568"] = true,
["STEAM_0:0:901171679"] = true,
["STEAM_0:0:495224761"] = true,
["STEAM_0:0:919759762"] = true,
["STEAM_0:1:919928730"] = true,
["STEAM_0:0:586663622"] = true,
["STEAM_0:0:549625209"] = true,
["STEAM_0:1:432855707"] = true,
["STEAM_0:0:586678919"] = true,
["STEAM_0:1:568644289"] = true,
["STEAM_0:0:540348770"] = true,
["STEAM_0:1:855906142"] = true,
["STEAM_0:1:495520600"] = true,
["STEAM_0:1:771512939"] = true,
["STEAM_0:1:434484359"] = true,
["STEAM_0:1:455474396"] = true,
["STEAM_0:1:695198635"] = true,
["STEAM_0:1:593338531"] = true,
["STEAM_0:0:664957682"] = true,
["STEAM_0:0:530587169"] = true,
["STEAM_0:1:757969903"] = true,
["STEAM_0:1:30917262"] = true,
["STEAM_0:0:858769899"] = true,
["STEAM_0:1:729382505"] = true,
["STEAM_0:1:880863426"] = true,
["STEAM_0:1:32831663"] = true,
["STEAM_0:1:763930692"] = true,
["STEAM_0:0:787675179"] = true,
["STEAM_0:1:558686328"] = true,
["STEAM_0:1:605953199"] = true,
["STEAM_0:1:25194"] = true,
["STEAM_0:0:926569939"] = true,
["STEAM_0:0:623709208"] = true,
["STEAM_0:0:780091977"] = true,
["STEAM_0:0:200583762"] = true,
["STEAM_0:0:205376238"] = true,
["STEAM_0:0:420254835"] = true,
["STEAM_0:1:725882394"] = true,
["STEAM_0:1:798169611"] = true,
["STEAM_0:0:495860643"] = true,
["STEAM_0:0:765927738"] = true,
["STEAM_0:0:591418882"] = true,
["STEAM_0:0:629148604"] = true,
["STEAM_0:1:791197409"] = true,
["STEAM_0:1:90594485"] = true,
["STEAM_0:0:557428449"] = true,
["STEAM_0:0:459070089"] = true,
["STEAM_0:0:595115402"] = true,
["STEAM_0:0:563987516"] = true,
["STEAM_0:1:461981523"] = true,
["STEAM_0:1:875334304"] = true,
["STEAM_0:1:154576620"] = true,
["STEAM_0:0:839341058"] = true,
["STEAM_0:0:420045146"] = true,
["STEAM_0:1:186905963"] = true,
["STEAM_0:0:785447926"] = true,
["STEAM_0:1:200711382"] = true,
["STEAM_0:1:627885222"] = true,
["STEAM_0:0:539101555"] = true,
["STEAM_0:1:525142284"] = true,
["STEAM_0:1:607180975"] = true,
["STEAM_0:0:150035229"] = true,
["STEAM_0:1:127418290"] = true,
["STEAM_0:1:439030289"] = true,
["STEAM_0:1:593058511"] = true,
["STEAM_0:0:817068708"] = true,
["STEAM_0:0:785447926"] = true,
["STEAM_0:0:520369783"] = true,
["STEAM_0:0:557428449"] = true,
["STEAM_0:1:860844599"] = true,
["STEAM_0:0:149023685"] = true,
["STEAM_0:0:183504169"] = true,
["STEAM_0:1:18496459"] = true,
["STEAM_0:0:817068708"] = true,
["STEAM_0:0:915271811"] = true,
["STEAM_0:0:241845755"] = true,
["STEAM_0:0:130910880"] = true,
["STEAM_0:1:226091576"] = true,
["STEAM_0:0:104702236"] = true,
["STEAM_0:1:540140220"] = true,
["STEAM_0:1:526713154"] = true,
["STEAM_0:0:81786806"] = true,
["STEAM_0:1:847010097"] = true,
["STEAM_0:0:511670197"] = true,
["STEAM_0:1:859751657"] = true,
["STEAM_0:0:536748292"] = true,
["STEAM_0:1:601457943"] = true,
["STEAM_0:1:870164545"] = true,
["STEAM_0:0:568362937"] = true,
["STEAM_0:1:529720142"] = true,
["STEAM_0:0:924898394"] = true,
["STEAM_0:0:566102944"] = true,
["STEAM_0:1:863880541"] = true,
["STEAM_0:0:569348968"] = true,
["STEAM_0:0:569348968"] = true,
["STEAM_0:0:931401417"] = true,
["STEAM_0:1:709827768"] = true,
["STEAM_0:0:569422843"] = true,
["STEAM_0:0:741914722"] = true,
["STEAM_0:0:75204909"] = true,
["STEAM_0:0:779577878"] = true,
["STEAM_0:1:650470689"] = true,
["STEAM_0:0:830569928"] = true,
["STEAM_0:0:578760519"] = true,
["STEAM_0:0:492511280"] = true,
["STEAM_0:0:635022953"] = true,
["STEAM_0:1:584035409"] = true,
["STEAM_0:1:743481318"] = true,
["STEAM_0:1:519676029"] = true,
["STEAM_0:0:807430647"] = true,
["STEAM_0:1:462322174"] = true,
["STEAM_0:0:95663991"] = true,
["STEAM_0:0:798580016"] = true,
["STEAM_0:1:861179470"] = true,
["STEAM_0:0:755026709"] = true,
["STEAM_0:1:868895683"] = true,
["STEAM_0:1:555281996"] = true,
["STEAM_0:1:515906715"] = true,
["STEAM_0:0:104090227"] = true,
["STEAM_0:1:115609036"] = true,
["STEAM_0:0:555477456"] = true,
["STEAM_0:1:870058984"] = true,
["STEAM_0:0:918520635"] = true,
["STEAM_0:0:184946154"] = true,
["STEAM_0:0:151986320"] = true,
["STEAM_0:1:186083776"] = true,
["STEAM_0:0:132295660"] = true,
["STEAM_0:0:741677848"] = true,
["STEAM_0:1:462961543"] = true,
["STEAM_0:0:204076914"] = true,
["STEAM_0:1:587679665"] = true,
["STEAM_0:0:864140194"] = true,
["STEAM_0:1:608584338"] = true,
["STEAM_0:1:546554251"] = true,
["STEAM_0:1:191672390"] = true,
["STEAM_0:0:624929397"] = true,
["STEAM_0:0:933163396"] = true,
["STEAM_0:1:936545957"] = true,
["STEAM_0:0:113765605"] = true,
["STEAM_0:1:523640224"] = true,
["STEAM_0:0:507354907"] = true,
["STEAM_0:1:124515142"] = true,
["STEAM_0:1:193254860"] = true,
["STEAM_0:0:722038990"] = true,
["STEAM_0:0:166676025"] = true,
["STEAM_0:1:158504649"] = true,
["STEAM_0:1:453981063"] = true,
["STEAM_0:0:694647569"] = true,
["STEAM_0:0:184271806"] = true,
["STEAM_0:1:763453475"] = true,
["STEAM_0:0:200958615"] = true,
["STEAM_0:1:168826317"] = true,
["STEAM_0:0:504890412"] = true,
["STEAM_0:0:504890412"] = true,
["STEAM_0:0:856144016"] = true,
["STEAM_0:0:492588152"] = true,
["STEAM_0:1:558622343"] = true,
["STEAM_0:1:105489577"] = true,
["STEAM_0:1:203244510"] = true,
["STEAM_0:0:59454187"] = true,
["STEAM_0:0:703907148"] = true,
["STEAM_0:1:803668004"] = true,
["STEAM_0:0:457914866"] = true,
["STEAM_0:1:103834547"] = true,
["STEAM_0:1:564103660"] = true,
["STEAM_0:1:506210750"] = true,
["STEAM_0:0:542880793"] = true,
["STEAM_0:0:457914866"] = true,
["STEAM_0:1:803668004"] = true,
["STEAM_0:1:810031466"] = true,
["STEAM_0:1:189017573"] = true,
["STEAM_0:1:32616914"] = true,
["STEAM_0:0:789412369"] = true,
["STEAM_0:1:562060350"] = true,
["STEAM_0:0:543079075"] = true,
["STEAM_0:1:944667323"] = true,
["STEAM_0:0:599999607"] = true,
["STEAM_0:0:690791256"] = true,
["STEAM_0:0:484918447"] = true,
["STEAM_0:1:600334345"] = true,
["STEAM_0:1:189126659"] = true,
["STEAM_0:0:547447446"] = true,
["STEAM_0:0:204833828"] = true,
["STEAM_0:1:792884581"] = true,
["STEAM_0:0:507900653"] = true,
["STEAM_0:1:180893359"] = true,
["STEAM_0:0:520483191"] = true,
["STEAM_0:1:922061635"] = true,
["STEAM_0:1:852756722"] = true,
["STEAM_0:1:439011181"] = true,
["STEAM_0:1:579458160"] = true,
["STEAM_0:1:942875026"] = true,
["STEAM_0:0:418093452"] = true,
["STEAM_0:0:721334581"] = true,
["STEAM_0:0:534684252"] = true,
["STEAM_0:1:929864360"] = true,
["STEAM_0:0:201018665"] = true,
["STEAM_0:1:920904568"] = true,
["STEAM_0:1:782982347"] = true,
["STEAM_0:1:461536897"] = true,
["STEAM_0:1:508128944"] = true,
["STEAM_0:1:603798141"] = true,
["STEAM_0:1:197292451"] = true,
["STEAM_0:0:641212780"] = true,
["STEAM_0:1:818565307"] = true,
["STEAM_0:0:753488600"] = true,
["STEAM_1:1:936208505"] = true,
["STEAM_1:1:884357560"] = true,
["STEAM_1:0:922239105"] = true,
["STEAM_1:0:214166591"] = true,
["STEAM_1:1:721991989"] = true,
["STEAM_1:0:808841060"] = true,
["STEAM_1:0:79017947"] = true,
["STEAM_1:1:549804715"] = true,
["STEAM_0:0:939155025"] = true,
["STEAM_0:0:866757991"] = true,
["STEAM_0:0:775986659"] = true,
["STEAM_0:1:816249907"] = true,
["STEAM_0:0:945022645"] = true,
["STEAM_0:1:876160217"] = true,
["STEAM_0:0:700923507"] = true,
["STEAM_0:0:944865252"] = true,
["STEAM_0:0:852177142"] = true,
["STEAM_0:1:859083547"] = true,
["STEAM_0:1:547873004"] = true,
["STEAM_0:1:450637180"] = true,
["STEAM_0:1:793273845"] = true,
["STEAM_0:0:594169301"] = true,
["STEAM_0:1:778589700"] = true,
["STEAM_0:0:555171001"] = true,
["STEAM_0:1:29010309"] = true,
["STEAM_0:0:733704815"] = true,
["STEAM_0:0:90828257"] = true,
["STEAM_0:1:87011806"] = true,
["STEAM_0:1:444806615"] = true,
["STEAM_0:0:635379702"] = true,
["STEAM_0:1:503016806"] = true,
["STEAM_0:1:553151280"] = true,
["STEAM_0:0:709634922"] = true,
["STEAM_0:0:95680184"] = true,
["STEAM_0:0:465817063"] = true,
["STEAM_0:1:789374585"] = true,
["STEAM_0:1:912314120"] = true,
["STEAM_0:0:921732035"] = true,
["STEAM_0:1:521115009"] = true,
["STEAM_0:1:437305415"] = true,
["STEAM_0:0:420386790"] = true,
["STEAM_0:0:854044409"] = true,
["STEAM_0:1:160968120"] = true,
["STEAM_0:1:768247177"] = true,
["STEAM_0:1:221743542"] = true,
["STEAM_0:0:538212720"] = true,
["STEAM_0:1:551725832"] = true,
["STEAM_0:0:556466396"] = true,
["STEAM_0:0:77760461"] = true,
["STEAM_0:1:912314120"] = true,
["STEAM_0:1:220263464"] = true,
["STEAM_0:0:947360651"] = true,
["STEAM_0:1:162263841"] = true,
["STEAM_0:1:2274502"] = true,
["STEAM_0:0:428898435"] = true,
["STEAM_0:1:586292106"] = true,
["STEAM_0:1:448982070"] = true,
["STEAM_0:0:887428339"] = true,
["STEAM_0:0:947422068"] = true,
["STEAM_0:0:116003133"] = true,
["STEAM_1:0:817429243"] = true,
["STEAM_0:1:118223185"] = true,
["STEAM_0:1:539082277"] = true,
["STEAM_0:0:555181600"] = true,
["STEAM_0:1:920399498"] = true,
["STEAM_0:1:745830085"] = true,
["STEAM_0:0:552314562"] = true,
["STEAM_0:0:585514744"] = true,
["STEAM_0:0:816194621"] = true,
["STEAM_0:1:591337701"] = true,
["STEAM_0:1:777915991"] = true,
["STEAM_0:0:63826996"] = true,
["STEAM_0:1:511090883"] = true,
["STEAM_0:0:524186698"] = true,
["STEAM_0:0:45561379"] = true,
["STEAM_0:1:899972340"] = true,
["STEAM_0:0:452950093"] = true,
["STEAM_0:1:520087429"] = true,
["STEAM_0:0:185449352"] = true,
["STEAM_0:1:796808901"] = true,
["STEAM_0:0:737318455"] = true,
["STEAM_0:0:838501860"] = true,
["STEAM_0:0:840179637"] = true,
["STEAM_0:0:722965474"] = true,
["STEAM_0:1:868912570"] = true,
["STEAM_0:0:628154972"] = true,
["STEAM_0:1:808289897"] = true,
["STEAM_0:1:1058595"] = true,
["STEAM_0:1:570496513"] = true,
["STEAM_0:1:599567902"] = true,
["STEAM_0:1:454644559"] = true,
["STEAM_0:0:191754705"] = true,
["STEAM_0:0:898970135"] = true,
["STEAM_0:1:771936882"] = true,
["STEAM_0:0:497571103"] = true,
["STEAM_0:1:939582318"] = true,
["STEAM_0:1:46342874"] = true,
["STEAM_0:1:562337802"] = true,
["STEAM_0:0:618714199"] = true,
["STEAM_0:1:863512620"] = true,
["STEAM_0:0:774141380"] = true,
["STEAM_0:0:917689761"] = true,
["STEAM_0:1:591713904"] = true,
["STEAM_0:0:890014793"] = true,
["STEAM_0:0:713675235"] = true,
["STEAM_0:1:621641466"] = true,
["STEAM_0:1:95196227"] = true,
["STEAM_0:0:794694761"] = true,
["STEAM_0:0:3127626"] = true,
["STEAM_0:0:913766304"] = true,
["STEAM_0:1:224598890"] = true,
["STEAM_0:0:580592536"] = true,
["STEAM_0:1:30151182"] = true,
["STEAM_0:1:703906403"] = true,
["STEAM_0:1:876160217"] = true,
["STEAM_0:0:948412435"] = true,
["STEAM_0:1:721208596"] = true,
["STEAM_0:1:740792720"] = true,
["STEAM_0:1:95196227"] = true,
["STEAM_0:1:224598890"] = true,
["STEAM_0:1:621641466"] = true,
["STEAM_0:1:546597457"] = true,
["STEAM_0:1:11539441"] = true,
["STEAM_0:1:504644783"] = true,
["STEAM_0:1:124161389"] = true,
["STEAM_0:1:722763526"] = true,
["STEAM_0:1:788848746"] = true,
["STEAM_0:1:789877432"] = true,
["STEAM_0:1:709342764"] = true,
["STEAM_0:0:717919337"] = true,
["STEAM_0:0:920153475"] = true,
["STEAM_0:0:611509151"] = true,
["STEAM_0:1:949867613"] = true,
["STEAM_0:0:633017652"] = true,
["STEAM_0:1:34279496"] = true,
["STEAM_0:1:628545106"] = true,
["STEAM_0:1:770019410"] = true,
["STEAM_0:0:659353483"] = true,
["STEAM_0:1:717665116"] = true,
["STEAM_0:0:530810595"] = true,
["STEAM_0:1:743575197"] = true,
["STEAM_0:1:624952386"] = true,
["STEAM_0:0:765176209"] = true,
["STEAM_0:1:104859112"] = true,
["STEAM_0:0:927114246"] = true,
["STEAM_1:0:741942042"] = true,
["STEAM_0:1:82141713"] = true,
["STEAM_0:1:876703593"] = true,
["STEAM_0:0:741942042"] = true,
["STEAM_0:1:429692806"] = true,
["STEAM_0:1:92343765"] = true,
["STEAM_0:0:550032644"] = true,
["STEAM_0:1:161463867"] = true,
["STEAM_0:1:532020296"] = true,
["STEAM_0:0:799753225"] = true,
["STEAM_0:1:922146713"] = true,
["STEAM_0:0:552533078"] = true,
["STEAM_0:1:648251785"] = true,
["STEAM_0:0:149585396"] = true,
["STEAM_0:1:839717091"] = true,
["STEAM_0:0:737984190"] = true,
["STEAM_0:1:648251785"] = true,
["STEAM_0:1:572225163"] = true,
["STEAM_0:0:780307387"] = true,
["STEAM_0:1:648251785"] = true,
["STEAM_0:0:625005878"] = true,
["STEAM_0:0:149585396"] = true,
["STEAM_0:1:839717091"] = true,
["STEAM_0:0:737984190"] = true,
["STEAM_0:1:518761660"] = true,
["STEAM_0:0:524089364"] = true,
["STEAM_0:1:570984315"] = true,
["STEAM_0:1:635535744"] = true,
["STEAM_0:1:623285780"] = true,
["STEAM_0:0:833337658"] = true,
["STEAM_0:1:218965416"] = true,
["STEAM_0:1:105646017"] = true,
["STEAM_0:1:117878305"] = true,
["STEAM_0:0:515340292"] = true,
["STEAM_0:0:435756603"] = true,
["STEAM_0:1:79576718"] = true,
["STEAM_0:1:211976613"] = true,
["STEAM_0:1:713329250"] = true,
["STEAM_0:0:567986646"] = true,
["STEAM_0:1:151183997"] = true,
["STEAM_0:0:563142577"] = true,
["STEAM_0:1:430035016"] = true,
["STEAM_0:0:895015374"] = true,
["STEAM_0:0:551379648"] = true,
["STEAM_0:0:847972216"] = true,
["STEAM_0:0:656073323"] = true,
["STEAM_0:0:43451635"] = true,
["STEAM_0:0:641897240"] = true,
["STEAM_0:1:928995382"] = true,
["STEAM_0:0:598802172"] = true,
["STEAM_0:0:945170348"] = true,
["STEAM_0:1:458398992"] = true,
["STEAM_0:1:670282933"] = true,
["STEAM_0:1:517281045"] = true,
["STEAM_0:1:419360020"] = true,
["STEAM_0:0:813085378"] = true,
["STEAM_0:1:442827682"] = true,
["STEAM_0:0:454873017"] = true,
["STEAM_0:0:709080985"] = true,
["STEAM_0:1:555638706"] = true,
["STEAM_0:0:906074941"] = true,
["STEAM_0:1:892056836"] = true,
["STEAM_0:1:806976483"] = true,
["STEAM_0:0:592085439"] = true,
["STEAM_0:1:797651822"] = true,
["STEAM_0:1:52645859"] = true,
["STEAM_0:1:801524405"] = true,
["STEAM_0:1:544500372"] = true,
["STEAM_0:1:772772091"] = true,
["STEAM_0:1:121782969"] = true,
["STEAM_0:1:772772091"] = true,
["STEAM_0:1:121782969"] = true,
["STEAM_0:1:564606135"] = true,
["STEAM_0:1:825715754"] = true,
["STEAM_0:1:571270369"] = true,
["STEAM_0:0:657007399"] = true,
["STEAM_0:1:837414887"] = true,
["STEAM_0:0:728581580"] = true,
["STEAM_0:1:543047025"] = true,
["STEAM_0:1:12768375"] = true,
["STEAM_0:0:454750318"] = true,
["STEAM_0:1:634990044"] = true,
["STEAM_0:1:176015835"] = true,
["STEAM_0:0:192102037"] = true,
["STEAM_0:1:555656687"] = true,
["STEAM_0:0:797978620"] = true,
["STEAM_0:0:148912316"] = true,
["STEAM_0:1:865284504"] = true,
["STEAM_0:1:163549246"] = true,
["STEAM_0:1:765026908"] = true,
["STEAM_0:1:544346420"] = true,
["STEAM_0:0:934907081"] = true,
["STEAM_0:0:636128933"] = true,
["STEAM_0:0:443315757"] = true,
["STEAM_0:1:927288805"] = true,
["STEAM_0:1:927465431"] = true,
["STEAM_0:1:422433133"] = true,
["STEAM_0:0:743213338"] = true,
["STEAM_0:0:642238857"] = true,
["STEAM_0:1:753731692"] = true,
["STEAM_0:0:569650994"] = true,
["STEAM_0:0:87994335"] = true,
["STEAM_0:0:850805133"] = true,
["STEAM_0:1:762680554"] = true,
["STEAM_0:0:567188921"] = true,
["STEAM_0:0:536998053"] = true,
["STEAM_0:1:783401400"] = true,
["STEAM_0:1:16749755"] = true,
["STEAM_0:1:807348073"] = true,
["STEAM_0:0:854901979"] = true,
["STEAM_0:1:523131808"] = true,
["STEAM_0:0:894312289"] = true,
["STEAM_0:1:761473340"] = true,
["STEAM_0:0:527704999"] = true,
["STEAM_0:0:672672217"] = true,
["STEAM_0:1:922319536"] = true,
["STEAM_0:1:753651797"] = true,
["STEAM_0:1:884116288"] = true,
["STEAM_0:0:769668722"] = true,
["STEAM_0:0:785086074"] = true,
["STEAM_0:1:180302600"] = true,
["STEAM_0:1:514155057"] = true,
["STEAM_0:0:449997691"] = true,
["STEAM_0:0:615140146"] = true,
["STEAM_0:0:198542759"] = true,
["STEAM_0:1:785527959"] = true,
["STEAM_0:1:781429712"] = true,
["STEAM_0:0:628648805"] = true,
["STEAM_0:1:939065257"] = true,
["STEAM_0:1:918574347"] = true,
["STEAM_0:0:610126456"] = true,
["STEAM_0:0:558233996"] = true,
["STEAM_0:0:842674206"] = true,
["STEAM_0:0:841231319"] = true,
["STEAM_0:1:119115259"] = true,
["STEAM_0:1:765877069"] = true,
["STEAM_0:0:84413404"] = true,
["STEAM_0:0:59012257"] = true,
["STEAM_0:1:770162126"] = true,
["STEAM_0:0:441357711"] = true,
["STEAM_0:0:851902288"] = true,
["STEAM_0:0:457589993"] = true,
["STEAM_0:0:543276016"] = true,
["STEAM_0:0:606802913"] = true,
["STEAM_0:0:800850358"] = true,
["STEAM_0:1:852465095"] = true,
["STEAM_0:0:431143642"] = true,
["STEAM_0:0:955198948"] = true,
["STEAM_0:0:948497693"] = true,
["STEAM_0:0:445214660"] = true,
["STEAM_0:1:603846931"] = true,
["STEAM_0:1:948925129"] = true,
["STEAM_0:1:731071929"] = true,
["STEAM_0:0:45255855"] = true,
["STEAM_0:1:553897769"] = true,
["STEAM_0:0:920928206"] = true,
["STEAM_0:0:172562376"] = true,
["STEAM_0:1:762252049"] = true,
["STEAM_0:1:544346420"] = true,
["STEAM_0:0:853723114"] = true,
["STEAM_0:0:613400749"] = true,
["STEAM_0:0:783022886"] = true,
["STEAM_0:0:935301216"] = true,
["STEAM_0:1:540522801"] = true,
["STEAM_0:1:28480875"] = true,
["STEAM_0:0:518956852"] = true,
["STEAM_0:0:164481968"] = true,
["STEAM_0:0:551106214"] = true,
["STEAM_0:1:627564669"] = true,
["STEAM_0:1:800040299"] = true,
["STEAM_0:1:76120031"] = true,
["STEAM_0:0:179072055"] = true,
["STEAM_0:1:666396418"] = true,
["STEAM_0:0:532660363"] = true,
["STEAM_0:0:924866881"] = true,
["STEAM_0:0:866015802"] = true,
["STEAM_0:0:644426135"] = true,
["STEAM_0:0:951899484"] = true,
["STEAM_0:1:619736579"] = true,
["STEAM_0:0:834885927"] = true,
["STEAM_0:0:644426135"] = true,
["STEAM_0:1:618682461"] = true,
["STEAM_0:0:575060537"] = true,
["STEAM_0:0:846035146"] = true,
["STEAM_0:0:637969207"] = true,
["STEAM_0:0:626544221"] = true,
["STEAM_0:0:722920243"] = true,
["STEAM_0:0:635389035"] = true,
["STEAM_0:1:502557722"] = true,
["STEAM_0:1:552900308"] = true,
["STEAM_0:1:925402363"] = true,
["STEAM_0:0:956166435"] = true,
["STEAM_0:0:761402397"] = true,
["STEAM_0:1:632760808"] = true,
["STEAM_0:0:86374018"] = true,
["STEAM_0:1:722366218"] = true,
["STEAM_0:0:782765176"] = true,
["STEAM_0:0:25809095"] = true,
["STEAM_0:0:800041024"] = true,
["STEAM_0:1:10207891"] = true,
["STEAM_0:1:766382835"] = true,
["STEAM_0:0:447319593"] = true,
["STEAM_0:0:564458180"] = true,
["STEAM_0:0:214954847"] = true,
["STEAM_0:0:893334411"] = true,
["STEAM_0:0:924152622"] = true,
["STEAM_0:0:629027852"] = true,
["STEAM_0:0:450174583"] = true,
["STEAM_0:0:939349847"] = true,
["STEAM_0:0:764280919"] = true,
["STEAM_0:1:832948563"] = true,
["STEAM_0:1:558038790"] = true,
["STEAM_0:0:623037873"] = true,
["STEAM_0:1:79509711"] = true,
["STEAM_0:1:535068254"] = true,
["STEAM_0:1:648331689"] = true,
["STEAM_0:0:60983108"] = true,
["STEAM_0:1:796709170"] = true,
["STEAM_0:0:510485001"] = true,
["STEAM_0:0:135821566"] = true,
["STEAM_0:0:792798941"] = true,
["STEAM_0:0:177091425"] = true,
["STEAM_0:0:149959596"] = true,
["STEAM_0:1:181688046"] = true,
["STEAM_0:1:649097643"] = true,
["STEAM_0:0:755158781"] = true,
["STEAM_0:1:852797051"] = true,
["STEAM_0:0:96981136"] = true,
["STEAM_0:1:550460725"] = true,
["STEAM_0:0:950447175"] = true,
}

hook.Add("PlayerConnect", "Ultimate_TrackPlayerConnect", function(name, ip)
    
end)

local function IsPlayerTracked(ply)
    if not IsValid(ply) then return false end
    local sid = ply:SteamID()
    return sid and ultimate.trackedPlayers[sid]
end

hook.Add("NotifyShouldTransmit", "Ultimate_TrackPlayerJoin", function(ent, shouldTransmit)
    if not shouldTransmit or not IsValid(ent) or not ent:IsPlayer() then return end
    if IsPlayerTracked(ent) then
        ultimate.cfg.priorityList[ent:SteamID()] = true
        
        ultimate.knownTrackedPlayers[ent] = true
        if not ultimate.alreadyNotified[ent] then
            ultimate.alreadyNotified[ent] = true
            chat.AddText(
                Color(255, 100, 100), "[ak47hack] ",
                Color(255, 0, 0), "читер с ником ",
                Color(0, 0, 0), ent:Nick(),
                Color(255, 255, 255), " зашел на сервер."
            )
        end
    end
end)

hook.Add("InitPostEntity", "Ultimate_InitialCheck", function()
    timer.Simple(5, function()
        for _, ply in ipairs(player.GetAll()) do
            if IsValid(ply) and IsPlayerTracked(ply) then
                ultimate.cfg.priorityList[ply:SteamID()] = true
                
                if not ultimate.alreadyNotified[ply] then
                    ultimate.alreadyNotified[ply] = true
                    chat.AddText(
                        Color(255, 200, 0), "[ak47hack] ",
                        Color(255, 255, 255), ply:Nick() .. " уже на сервере!"
                    )
                end
            end
        end
    end)
end)

hook.Add("EntityRemoved", "Ultimate_TrackPlayerLeave", function(ent)
    if not IsValid(ent) or not ent:IsPlayer() then return end
    if ultimate.knownTrackedPlayers[ent] then
        chat.AddText(
            Color(255, 100, 100), "[ak47hack] ",
            Color(255, 0, 0), ent:Nick() .. " rq"
        )
        ultimate.knownTrackedPlayers[ent] = nil
        ultimate.alreadyNotified[ent] = nil
    end
end)
