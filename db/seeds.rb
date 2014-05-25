# create built in status
approved = Status.create! label: "approved"
pending = Status.create! label: "pending"
banned = Status.create! label: "banned"
prospective = Status.create! label: "prospective"
inactive = Status.create! label: "inactive"

Admin.create! name: "liz", password: "kiwi"

# Pending approval
TeachingAssistant.create! name: "Andrea Wilson", email: "awilson532@gmail.com", status: pending
TeachingAssistant.create! name: "Arelia Jones", email: "arelia.jones@gmail.com", status: pending
TeachingAssistant.create! name: "Ashish Dixit", email: "tundal45@gmail.com", status: pending
TeachingAssistant.create! name: "Diana Calvache", email: "calvache.diana@gmail.com", status: pending
TeachingAssistant.create! name: "Elizabeth Engelman", email: "emengelman@gmail.com", status: pending
TeachingAssistant.create! name: "Erik Allar", email: "allareri@gmail.com", status: pending
TeachingAssistant.create! name: "Hank", email: "hankster81@yahoo.com", status: pending
TeachingAssistant.create! name: "Hyunah Park", email: "phablue@gmail.com", status: pending
TeachingAssistant.create! name: "Jacky Sum", email: "jsum528@icloud.com", status: pending
TeachingAssistant.create! name: "JP Bader", email: "jp@zavteq.com", status: pending
TeachingAssistant.create! name: "Monique Wingard", email: "moniquewingard@gmail.com", status: pending
TeachingAssistant.create! name: "Nidhi Mehta", email: "nidhididi@gmail.com", status: pending
TeachingAssistant.create! name: "Jenny O'Neil", email: "oneilj@umich.edu", status: pending
TeachingAssistant.create! name: "Rishika Murthy", email: "murthy.rishika@gmail.com", status: pending
TeachingAssistant.create! name: "Jonathan Ozeran", email: "ozeranjo@gmail.com", status: pending

# Approved
TeachingAssistant.create! name: "Alan Deitch", email: "adeitch@groupon.com", status: approved
TeachingAssistant.create! name: "Allen Dayag", email: "a.dayag@gmail.com", status: approved
TeachingAssistant.create! name: "Amanda Powell", email: "apowell55@gmail.com", status: approved
TeachingAssistant.create! name: "Andrew Jorczak", email: "andrew.jorczak@me.com", status: approved
TeachingAssistant.create! name: "Andrew Stamm", email: "astamm78@gmail.com", status: approved
TeachingAssistant.create! name: "Catherine Wah", email: "catherine.wah@gmail.com", status: approved
TeachingAssistant.create! name: "Chris Doyle", email: "archslide@gmail.com", status: approved
TeachingAssistant.create! name: "Clark Kampfe", email: "clark.kampfe@gmail.com", status: approved
TeachingAssistant.create! name: "Coraline Ehmke", email: "coraline@idolhands.com", status: approved
TeachingAssistant.create! name: "Dain Hall", email: "dainovu3@gmail.com", status: approved
TeachingAssistant.create! name: "Dusty Burwell", email: "dustyburwell@gmail.com", status: approved
TeachingAssistant.create! name: "Erin Drummond", email: "e.b.drummond@gmail.com", status: approved
TeachingAssistant.create! name: "Jen Mozen", email: "jen@tablexi.com", status: approved
TeachingAssistant.create! name: "Jen Myers", email: "jen@girldevelopit.com", status: approved
TeachingAssistant.create! name: "Jeff Belser", email: "justaboutjeff@gmail.com", status: approved
TeachingAssistant.create! name: "Kevin Zurawel", email: "kzurawel@gmail.com", status: approved
TeachingAssistant.create! name: "Lauren Dorman", email: "lauren@designisalso.com", status: approved
TeachingAssistant.create! name: "Lauren Scott", email: "wisconsinpoet@gmail.com", status: approved
TeachingAssistant.create! name: "Maria Tzeka", email: "marianna.tzeka@gmail.com", status: approved
TeachingAssistant.create! name: "Lucas Willet", email: "me@ltw.io", status: approved
TeachingAssistant.create! name: "Meagan Evanoff", email: "meaganevanoff@gmail.com", status: approved
TeachingAssistant.create! name: "Monica Friend", email: "monica.jones.2010@gmail.com", status: approved
TeachingAssistant.create! name: "Stephanie Finken", email: "sjfinken@gmail.com", status: approved
TeachingAssistant.create! name: "LaToya Allen", email: "latoyanallen@gmail.com", status: approved
TeachingAssistant.create! name: "Lorena Mesa", email: "mesa.lauren@gmail.com", status: approved
TeachingAssistant.create! name: "Meara Charnetski", email: "mcharnetski@gmail.com", status: approved
TeachingAssistant.create! name: "Jill Lynch", email: "jill.lynch5@gmail.com", status: approved
TeachingAssistant.create! name: "Meredith Laverty", email: "meredith@fancyrabbit.co", status: approved
