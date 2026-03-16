function slowPrint(mon, text, speed)
    speed = speed or 0.05
    for i = 1, #text do
        mon.write(text:sub(i,i))
        sleep(speed)
    end
end

local monitor = peripheral.find("monitor")

if not monitor then
    print("No monitor found!")
    return
end

monitor.setTextScale(1)
monitor.setBackgroundColor(colors.black)
monitor.setTextColor(colors.lime)
monitor.clear()
monitor.setCursorPos(1,1)

monitor.write("Furr Army Terminal V Alpha 0.6")
monitor.setCursorPos(1,2)
monitor.write("----------------------------")
monitor.setCursorPos(1,3)
slowPrint(monitor,"System Ready",0.03)

local y = 5

while true do
    term.setCursorPos(1,1)
    term.clearLine()
    write("> ")
    local cmd = read()

    monitor.setCursorPos(1,y)
    monitor.write("> "..cmd)

    y = y + 1

    if cmd == "hello" then
        monitor.setCursorPos(1,y)
        monitor.write("Hello Commander")

    elseif cmd == "time" then
        monitor.setCursorPos(1,y)
        monitor.write(textutils.formatTime(os.time(), true))

    elseif cmd == "clear" then
        monitor.clear()
        monitor.setCursorPos(1,1)
        slowPrint(monitor,"Furr Army Terminal V Alpha 0.6",0.03)
        y = 3

    else
        monitor.setCursorPos(1,y)
        monitor.write("Unknown command")
    end

    y = y + 2
end
