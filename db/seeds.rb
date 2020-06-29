# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(username: "guy1")
user2 = User.create(username: "guy2")

event1 = Event.create(title: "event1", user_id: user1.id)
event2 = Event.create(title: "event2", user_id: user2.id)

attendance1 = Attendance.create(attendee_id: user1.id, attended_event_id: event2.id)
attendance2 = Attendance.create(attendee_id: user2.id, attended_event_id: event1.id)