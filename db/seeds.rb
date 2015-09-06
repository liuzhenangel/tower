team = Team.find_or_create_by(name: 'test')
team2 = Team.find_or_create_by(name: 'test2')
user = User.find_or_initialize_by(email: 'user@tower.com') do |u|
  u.password = '1' * 8
  u.name = "test"
end
user2 = User.find_or_initialize_by(email: 'user2@tower.com') do |u|
  u.password = '1' * 8
  u.name = "test2"
end
user.teams = [team, team2]
user.save!

user2.teams = [team, team2]
user2.save!
