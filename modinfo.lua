
meta =
{
    id = "WelcomeMail",
    name = "WelcomeMail",
    title = "Welcome Mail",
    description = "Sends a Mail to players who just join the server and gives them free stuff.",

    authors = {"Shrooblord"},
    version = "1.1.0",

    dependencies = {
        {id = "Avorion", min = "0.29.2", max = "0.29.2"},
        {id = "1847767864", min = "1.1.0"},             --ShrooblordMothership (library mod)
    },

    serverSideOnly = false,
    clientSideOnly = false,
    saveGameAltering = true,

    contact = "avorion@shrooblord.com",
}
