if account = Account.find_by(name: "Powershop Collider")
  print "I AM GOING TO DESTROY EVERYTHING!  Type yes to continue: "
  exit unless STDIN.gets.strip.downcase == "yes"
  puts "Ok then..."
  account.destroy
end

a = Account.create!(name: "Powershop Collider")

user = a.users.create!(email: "roger.nesbitt@powershop.co.nz")

elements = %w(Epic Story Deliverable Task Issue).map do |name|
  a.elements.create!(name: name)
end

epic, story, dlvr, task, issue = elements 

title = a.fields.create!(name: "Title", field_type: "long", data_type: "text")
description = a.fields.create!(name: "Description", field_type: "textarea", data_type: "text")
priority = a.fields.create!(name: "Priority", field_type: "small", data_type: "integer")

elements.each do |element|
  [title, description, priority].each do |field|
    element.element_fields.create!(field: field)
  end
end

data = {
  "element_id" => story.id,
  "properties" => {
    title.id => "Write more tests",
    priority.id => 2,
    description.id => "It's important to write tests otherwise we won't know when we've borken things."
  }
}

atom = PopulateAtom.new(nil, data, user: user)
raise atom.errors.full_messages.to_sentence unless atom.call
