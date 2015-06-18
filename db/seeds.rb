if account = Account.find_by(name: "Powershop Collider")
  print "I AM GOING TO DESTROY EVERYTHING!  Type yes to continue: "
  exit unless STDIN.gets.strip.downcase == "yes"
  puts "Ok then..."
  account.destroy
end

a = Account.create!(name: "Powershop Collider")

elements = %w(Epic Story Deliverable Task Issue).map do |name|
  a.elements.create!(name: name)
end

epic, story, dlvr, task, issue = elements 

description = a.fields.create!(name: "Description", field_type: "textarea", data_type: "text")
priority = a.fields.create!(name: "Priority", field_type: "small", data_type: "integer")

elements.each do |element|
  element.element_fields.create!(field: description)
  element.element_fields.create!(field: priority)
end
