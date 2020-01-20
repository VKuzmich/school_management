if Admin.count.zero?
  puts 'admin seeding'
  Admin.create!(email: 'luis@example.com', first_name: 'Luis', last_name: 'Adriano', password: '123123', password_confirmation: '123123')
end

if Teacher.count.zero?
  puts 'Teachers seeding'
  Teacher.create!(first_name: 'Gosha', last_name: 'Krit', description: 'Senior Teacher')
  Teacher.create!(first_name: 'Taras', last_name: 'Pugovkin', description: 'Usual Teacher')
  Teacher.create!(first_name: 'Misha', last_name: 'Frans', description: 'OnCall Teacher')
end

if Discipline.count.zero?
  puts 'Seeding Disciplines'
  %w(Graphics Scatching).each do |name|
    Discipline.create!(name: name)
  end
end
