--Devzinh their discord is invite is J37PW97j6a
function sb()
    local c = {
        bp = {"Cheat", "Exploit", "Hack", "Script", "Inject", "Memory", "Speed", "Teleport", "Noclip", "Fly", "Bypass", "Macro", "AutoFarm", "WallHack", "AimBot", "SpeedHack", "NoClip", "InfiniteResource", "ModifiedClient", "GameModifier", "ClientModification", "RuntimePatch", "MemoryManipulation", "ProcessInjection"},
        fe = {"Roblox Studio", "Roblox Client", "Roblox Player", "Roblox Beta", "Roblox Test Client", "RobloxPlayerBeta", "RobloxStudioBeta", "RobloxApp", "RobloxMobile"},
        nt = {md = 0.05, mc = 100, at = 0.8},
        lr = {min = 50, max = 100},
        ok = 0x35ACED,
        rni = 10,
        doi = 30,
        bm = {at = 0.7, lr = 0.01, hs = 100}
    }

    local s = {
        nc = {},
        lns = tick(),
        rnt = tick(),
        lo = math.random(c.lr.min, c.lr.max) / 1000,
        os = math.random(1, 1000000),
        bh = {},
        as = 0
    }

    local function es(i, k)
        local r = ""
        for j = 1, #i do
            local c = string.byte(i, j)
            local b = k % 256
            r = r .. string.char(bit32.bxor(c, b))
            k = bit32.rshift(k, 8) + bit32.lshift(b, 24)
        end
        return r
    end

    local function ot(t, s)
        local o = {}
        for k, v in pairs(t) do
            local ok = es(tostring(k), s)
            if type(v) == "string" then
                o[ok] = es(v, s)
            elseif type(v) == "table" then
                o[ok] = ot(v, s + 1)
            else
                o[ok] = v
            end
        end
        return o
    end

    local function sa()
        local a = {
            "[S] I...", "[I] S...", "[W] P...",
            "[D] O...", "[N] E...", "[P] A...",
            "[S] S..."
        }
        return a[math.random(1, #a)]
    end

    local function fl()
        local ls = game:GetService("LogService")
        local oc = ls.MessageOut.Connect

        hookfunction(oc, function(self, cb)
            return oc(self, function(m)
                for _, p in ipairs(c.bp) do
                    if m:lower():find(p:lower()) then
                        return
                    end
                end
                if tick() - s.rnt >= c.rni then
                    s.rnt = tick()
                    cb(sa())
                end
                cb(m)
            end)
        end)
    end

    local function me()
        getgenv().ie = function()
            local i = (tick() % #c.fe) + 1
            return c.fe[i]
        end
    end

    local function sl()
        local ot = tick

        getgenv().tick = function()
            local fv = math.random(-10, 10) / 1000
            local nv = math.random(-5, 5) / 1000
            s.lo = s.lo + fv + nv
            return ot() + s.lo
        end
    end

    local function bsf()
        local sf = {"warn", "error", "debug.traceback", "assert"}

        for _, fn in ipairs(sf) do
            local of = getfenv(0)[fn]
            hookfunction(of, function(...)
                local i = debug.getinfo(2, "Sl")
                print("[S] F c: " .. fn .. " (L " .. i.currentline .. ")")
                return true
            end)
        end
    end

    local function on()
        local os = game.ReplicatedStorage.RemoteEvent.FireServer

        game.ReplicatedStorage.RemoteEvent.FireServer = function(self, ...)
            local a = {...}
            local ea = ot(a, s.os)
            for k, v in pairs(ea) do
                if type(k) == "string" and k:find(c.ok) then
                    return
                end
            end

            local ct = tick()
            if ct - s.lns < c.nt.md then
                return
            end

            s.lns = ct
            table.insert(s.nc, ct)

            local cpm = #s.nc
            if cpm > c.nt.mc then
                local ec = cpm - c.nt.mc
                if ec / c.nt.mc > c.nt.at then
                    c.nt.md = c.nt.md * 1.1
                end
                for i = 1, ec do
                    table.remove(s.nc, 1)
                end
            elseif cpm < c.nt.mc * 0.9 then
                c.nt.md = c.nt.md * 0.9
            end

            return os(self, ...)
        end
    end

    local function dm()
        spawn(function()
            while wait(5) do
                local ct = tick()
                for i = #s.nc, 1, -1 do
                    if ct - s.nc[i] > 60 then
                        table.remove(s.nc, i)
                    end
                end
            end
        end)
    end

    local function rok()
        spawn(function()
            while wait(c.doi) do
                s.os = math.random(1, 1000000)
            end
        end)
    end

    local function dab(b)
        table.insert(s.bh, 1, b)
        if #s.bh > c.bm.hs then
            table.remove(s.bh)
        end

        local as = 0
        for _, pb in ipairs(s.bh) do
            local s = 0
            for i = 1, math.min(#b, #pb) do
                if b[i] == pb[i] then
                    s = s + 1
                end
            end
            s = s / math.max(#b, #pb)
            as = as + (1 - s)
        end
        as = as / #s.bh

        if as > c.bm.at then
            print("[B M] A b d. S: " .. as)
            s.as = s.as + c.bm.lr * (as - s.as)
        else
            s.as = s.as - c.bm.lr * s.as
        end

        return as
    end

    local function mnb()
        local os = game.ReplicatedStorage.RemoteEvent.FireServer

        game.ReplicatedStorage.RemoteEvent.FireServer = function(self, ...)
            local a = {...}
            local b = {self.Name, unpack(a)}
            local as = dab(b)

            if as > c.bm.at then
                return
            end

            return os(self, ...)
        end
    end

    local function mlb()
        local ls = game:GetService("LogService")
        local oc = ls.MessageOut.Connect

        hookfunction(oc, function(self, cb)
            return oc(self, function(m)
                local b = {m}
                local as = dab(b)

                if as > c.bm.at then
                    return
                end

                cb(m)
            end)
        end)
    end

    fl()
    me()
    sl()
    bsf()
    on()
    dm()
    rok()
    mnb()
    mlb()
end
