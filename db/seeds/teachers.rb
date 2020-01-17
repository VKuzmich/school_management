if Teacher.count.zero?
  puts 'Teachers seeding'
  Teacher.create!(first_name: 'Gosha', last_name: 'Krit', description: 'Senior Teacher')
  Teacher.create!(first_name: 'Taras', last_name: 'Pugovkin', description: 'Usual Teacher')
  Teacher.create!(first_name: 'Misha', last_name: 'Frans', description: 'OnCall Teacher')
end
