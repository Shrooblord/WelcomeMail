--Welcome Mail (C) 2019 Shrooblord
--Group configuration file for Welcome Mail.

package.path = package.path .. ";data/scripts/config/?.lua"



local groupConfig = {
    {
        name = "Default",
        description = "Default Group that all users are placed into. They get the Default Welcome Mail.",
        members = {},
        mail = {
            title = "Some Assets to Help You Get Rolling"%_t,
            sender = "Shrooblord /* The owner of this galaxy. Wait, what? */"%_t,
            --use ${player} in this Mail to refer to the Player's name, and ${group} to refer to their Group name.
            body = [[Welcome, ${player},

We see you are new here. Good to have you on board!
Included in this e-mail is a bit of a start-up capital for you to work with.

We hope this will help you get going more easily, and give you a little bit
of a leg-up in this dangerous Galaxy... good luck out there!
    
May our paths once cross. Until then!

Best wishes,


Your Galactic Overlords
]]%_t,
            --The complementary welcome package that comes with receiving this Mail.
            gift = {
                money = 10000,
                iron = 5000,
                titanium = 1000,
                naonite = 0,
                trinium = 0,
                xanion = 0,
                ogonite = 0,
                avorion = 0
            },

        }
    },

    {
        name = "Elite",
        description = "Sample Elite Group that you can place users into using commands. They get the Elite Welcome Mail in addition to the Default Welcome Mail.",
        members = {},
        mail = {
            title = "Welcome, Partner!"%_t,
            sender = "Shrooblord /* The owner of this galaxy. Wait, what? */"%_t,
            --use ${player} in this Mail to refer to the Player's name, and ${group} to refer to their Group name.
            body = [[Welcome, ${player},

We see you are new here. Good to have you on board!
Included in this e-mail is a bit of a start-up capital for you to work with.

Because you are a valued member of our ${group} customerbase, enjoy this
sparkling {$group} Package. You will certainly be the centre of attention
when you have this shiny hunk of goods to show off to all your friends.

Thank you for choosing our {$group} Package today. We hope to see you again soon!

Best wishes,


Your Galactic Overlords
]]%_t,
            --The complementary welcome package that comes with receiving this Mail.
            gift = {
                money = 1000000,
                iron = 45000,
                titanium = 9000,
                naonite = 5000,
                trinium = 2000,
                xanion = 1000,
                ogonite = 500,
                avorion = 250
            }
        }
    },
}

return groupConfig
