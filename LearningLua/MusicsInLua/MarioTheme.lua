local tunes = {
    "E5/8 E5/8 P/8 E5/8 P/8 C5/8 E5/8 G5/4",
    "P/4 G4/8 P/4 C5/8 P/8 G4/8 P/8 E4/8",

    "A4/8 B4/8 A#4/8 A4/8 G4/4 E5/8 G5/8 A5/4",
    "F5/8 G5/8 E5/4 C5/8 D5/8 B4/4"
}

local notes_freq = {
    C4=261, ["C#4"]=277, D4=293, ["D#4"]=311, E4=329,
    F4=349, ["F#4"]=369, G4=392, ["G#4"]=415, A4=440, ["A#4"]=466, B4=493,

    C5=523, ["C#5"]=554, D5=587, ["D#5"]=622, E5=659,
    F5=698, ["F#5"]=739, G5=784, ["G#5"]=830, A5=880, ["A#5"]=932, B5=988
}

function get_duration(frac)
    local base = 1.1 -- Use this to make the song faster or slower
    return base / tonumber(frac)
end

function play_freq(freq, duration)
    local cmd = string.format("play -n synth %f sine %d vol 0.5 2>/dev/null", duration, freq)
    os.execute(cmd)
end

function play_tune(tune)
    print("\n🎵 Tocando:")

    for note in tune:gmatch("%S+") do
        -- AGORA aceita #:
        local name, duration = note:match("([A-G]#?%d)/(%d+)")
        local pause = note:match("(P)/(%d+)")

        local time = get_duration(duration or note:match("/(%d+)"))

        if pause then
            os.execute("sleep " .. time)
        else
            local freq = notes_freq[name]
            if freq then
                print("🔊", name, freq.."Hz")
                play_freq(freq, time)
            else
                print("Nota desconhecida:", name)
            end
        end
    end
end

for i = 1, #tunes do
    play_tune(tunes[i])
end