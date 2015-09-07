user = User.find_or_create_by(email: 'user@tower.com') do |u|
  u.password = '1' * 8
  u.name = "test"
  u.logo = File.open(Rails.root.join('app', 'assets', 'images', 'default_image.jpg'))
end

user2 = User.find_or_create_by(email: 'user2@tower.com') do |u|
  u.password = '1' * 8
  u.name = "test2"
  u.logo = File.open(Rails.root.join('app', 'assets', 'images', 'default_image.jpg'))
end

User.current = user

team = Team.find_or_create_by(name: 'test')
team2 = Team.find_or_create_by(name: 'test2')

project = Project.find_or_create_by(name: 'Project', team_id: team.id)

todolist = Todolist.find_or_create_by(name: 'Todolist', project_id: project.id)

user.teams = [team, team2]
user.save!

user2.teams = [team, team2]
user2.save!
