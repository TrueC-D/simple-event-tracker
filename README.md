

Has an admin who can create events and keep track of participants. A user can add and remove events on their agenda.   They should be able to filter their events to exclude past events and order events chronologically.  There are categories that events can belong to which can help the user identify whether the event would be of interest.  Ex: Category could be Music: Rap, or Literature: Science Fiction, etc.  Users also have tickets which belongs to a status (standard, premium, vip) and has an optional expectations string that the user can enter.

Can load this app by running rails s then navigatio to localhost:3000/signin

The following is seeded to the database before load: 

<!-- admin = User.create([
    {name: 'Admin', username: 'username', password: 'password', admin: true }
]) -->  Alter Admin information to your preference.

statuses = Status.create([
    {name: 'Standard'}, {name: 'Premium'}, {name: 'VIP'}
])

categories = Category.create([
    {name: 'Entertainment & Art', description: 'This includes music, movies, painting, dance, comedy, etc.'},
    {name: 'Science & Innovation', description: 'New scientific discoveries and engineering innovation and marvels.'},
    {name: 'Psychology, History and Social Change', description: 'What is, what was and what will be.  Discussing the nature of people and their envirement. Here we learn how we have been influenced and how we can be influenced. This section includes politics.'},
    {name: 'Health & Personal Growth', description: 'Exploring the path to mental and physical well-being.'},
    {name: 'Participatory', description: 'Requireing atendee participation. This is often educational.'}
])