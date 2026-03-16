local users = {
    Mike = {password="Lt.Mike", clearance=10},
    HR = {password="HR", clearance=3},
    MR = {password="MR", clearance=2},
    LR = {password="LR", clearance=1}
}

local currentUser = nil
local userClearance = 0

print("Username:")
local username = read()

print("Password:")
local password = read("*")

if users[username] and users[username].password == password then
    currentUser = username
    userClearance = users[username].clearance
    print("Login successful")
    print("Clearance Level: "..userClearance)
else
    print("ACCESS DENIED")
    return
end

local documents = {
    facility = {
        clearance = 1,
        text = "Furr Army Facility Overview..."
    },

    weapons = {
        clearance = 2,
        text = "Weapon development files..."
    },

    blackops = {
        clearance = 10,
        text = "TOP SECRET: Operation Night Fang"
    }
}

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

slowPrint(monitor,"Furr Army Terminal V Alpha 0.6",0.10)
monitor.setCursorPos(1,2)
slowPrint(monitor,"----------------------------"0.10)
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

    elseif cmd:sub(1,4) == "doc " then
    local docName = cmd:sub(5)

    if documents[docName] then
        if userClearance >= documents[docName].clearance then
            print(documents[docName].text)
        else
            print("ACCESS DENIED - CLEARANCE "..documents[docName].clearance.." REQUIRED")
        end
    else
        print("Document not found")
    end

    else
        monitor.setCursorPos(1,y)
        monitor.write("Unknown command")
    end

    y = y + 2
end
