package.path = package.path .. ";data/scripts/lib/?.lua"
require ("galaxy")
require ("utility")
require ("stringutility")

-- Don't remove or alter the following comment, it tells the game the namespace this script lives in. If you remove it, the script will break.
-- namespace WelcomeMail
WelcomeMail = {}

WelcomeMail.welcomeMoney = 0

WelcomeMail.amountIron = 0
WelcomeMail.amountTitanium = 0
WelcomeMail.amountNaonite = 0
WelcomeMail.amountTrinium = 0
WelcomeMail.amountXanion = 0
WelcomeMail.amountOgonite = 0
WelcomeMail.amountAvorion = 0

local mailText = ""
local mailHeader = ""
local mailSender = ""

function WelcomeMail.restore(values)
    WelcomeMail.welcomeMoney = values.welcomeMoney or 0
    
    WelcomeMail.amountIron = values.amountIron or 0
    WelcomeMail.amountTitanium = values.amountTitanium or 0
    WelcomeMail.amountNaonite = values.amountNaonite or 0
    WelcomeMail.amountTrinium = values.amountTrinium or 0
    WelcomeMail.amountXanion = values.amountXanion or 0
    WelcomeMail.amountOgonite = values.amountOgonite or 0
    WelcomeMail.amountAvorion = values.amountAvorion or 0
    
    mailText = values.mailText or ""
    mailHeader = values.mailHeader or ""
    mailSender = values.mailSender or ""
end

function WelcomeMail.secure()
    return {
        welcomeMoney = WelcomeMail.welcomeMoney,
        amountIron = WelcomeMail.amountIron,
        amountTitanium = WelcomeMail.amountTitanium,
        amountNaonite = WelcomeMail.amountNaonite,
        amountTrinium = WelcomeMail.amountTrinium,
        amountXanion = WelcomeMail.amountXanion,
        amountOgonite = WelcomeMail.amountOgonite,
        amountAvorion = WelcomeMail.amountAvorion
    }
end

-- this function gets called on creation of the entity the script is attached to, on client and server
function WelcomeMail.initialize()
    if onServer() then
        print("Welcome Mail initialised!")
    end

    if onClient() then
        invokeServerFunction("setTranslatedMailText",
                             "Some Assets to Help You Get Rolling"%_t,      --message header
                             WelcomeMail.generateWelcomeMailText(Player().index),
                             "Shrooblord /* The owner of this galaxy. Wait, what? */"%_t)       --sender
        invokeServerFunction("generateWelcomeMailAttachments",
                                50,  --money
                                100,  --iron
                                200,  --titanium
                                300,  --naonite
                                400,  --trinium
                                500,  --xanion
                                600,  --ogonite
                                700)  --avorion
        invokeServerFunction("onPlayerLogIn", Player().index)
    end
end

function WelcomeMail.setTranslatedMailText(header, text, sender)
    mailHeader = header
    mailText = text
    mailSender = sender
end

-- when the player logs in, this function is called
function WelcomeMail.onPlayerLogIn(playerIndex)
    if onServer() then 
        local player = Player(playerIndex)
        local server = Server()
        local playerLogIns =  server:getValue("player_"..tostring(player.name).."_logIns")
        
        if playerLogIns == 0 or playerLogIns == nil then
            playerLogIns = 1
            server:setValue("player_"..tostring(player.name).."_logIns", 1)
        else
            playerLogIns = playerLogIns + 1
            server:setValue("player_"..tostring(player.name).."_logIns", playerLogIns)
        end
        
        if playerLogIns == 1 then

            local mail = Mail()
            mail.header = mailHeader
            mail.text = mailText
            mail.sender = mailSender
            mail.money = WelcomeMail.welcomeMoney

            mail:setResources(WelcomeMail.amountIron, WelcomeMail.amountTitanium, WelcomeMail.amountNaonite, WelcomeMail.amountTrinium, WelcomeMail.amountXanion, WelcomeMail.amountOgonite, WelcomeMail.amountAvorion)

            player:addMail(mail)
        else
            print("WelcomeMail: Number of times player "..tostring(player.name).." has logged in: "..tostring(playerLogIns).." times; not generating welcome mail.")
        end
    end
    --regardless of whether re run on server or client, we will end script execution as soon as we're done sending or not sending the mail
    terminate()
end

function WelcomeMail.generateWelcomeMailAttachments(attachMoney, attachIron, attachTitanium, attachNaonite, attachTrinium, attachXanion, attachOgonite, attachAvorion)
    WelcomeMail.welcomeMoney = attachMoney or 0
    
    WelcomeMail.amountIron = attachIron or 0
    WelcomeMail.amountTitanium = attachTitanium or 0
    WelcomeMail.amountNaonite = attachNaonite or 0
    WelcomeMail.amountTrinium = attachTrinium or 0
    WelcomeMail.amountXanion = attachXanion or 0
    WelcomeMail.amountOgonite = attachOgonite or 0
    WelcomeMail.amountAvorion = attachAvorion or 0
end

-- following are mail texts sent to the player
function WelcomeMail.generateWelcomeMailText(playerIndex)
    local receiver = Player(playerIndex)
    
    local welcome_text = [[Welcome, ${player},

We see you are new here. Good to have you on board!
Included in this e-mail is a bit of a start-up capital for you to work with.
We hope this will help you get going more easily, and give you a little bit
of a leg-up in this dangerous Galaxy... good luck out there!
    
May our paths once cross. Until then!

Best wishes,


Your Galactic Overlords
]]%_t

    return welcome_text % {player = receiver.name}
end

function WelcomeMail.getValues()
    if onClient() then return end

    return {
        welcomeMoney = WelcomeMail.welcomeMoney,
        amountIron = WelcomeMail.amountIron,
        amountTitanium = WelcomeMail.amountTitanium,
        amountNaonite = WelcomeMail.amountNaonite,
        amountTrinium = WelcomeMail.amountTrinium,
        amountXanion = WelcomeMail.amountXanion,
        amountOgonite = WelcomeMail.amountOgonite,
        amountAvorion = WelcomeMail.amountAvorion
    }
end

return WelcomeMail
