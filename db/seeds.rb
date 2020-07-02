# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
User.destroy_all
Event.destroy_all
Attendance.destroy_all
Category.destroy_all
EventCategory.destroy_all


user1 = User.create(username: "guy1")
user2 = User.create(username: "guy2")
user3 = User.create(username: "guy3")
user4 = User.create(username: "guy4")


event1 = Event.create(title: "event1", user_id: user1.id)
event2 = Event.create(title: "event2", user_id: user2.id)

attendance1 = Attendance.create(user_id: user1.id, event_id: event2.id)
attendance2 = Attendance.create(user_id: user2.id, event_id: event1.id)
attendance3 = Attendance.create(user_id: user2.id, event_id: event2.id)
attendance4 = Attendance.create(user_id: user4.id, event_id: event1.id)
attendance5 = Attendance.create(user_id: user3.id, event_id: event1.id)
