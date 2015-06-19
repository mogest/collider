if account = Account.find_by(name: "Powershop Collider")
  print "I AM GOING TO DESTROY EVERYTHING!  Type yes to continue: "
  exit unless STDIN.gets.strip.downcase == "yes"
  puts "Ok then..."
  account.destroy
end

a = Account.create!(name: "Powershop Collider")

@roger = a.users.create!(name: "Roger", preferred_name: "Roger", email: "roger.nesbitt@powershop.co.nz")

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

def make(data)
  populator = PopulateAtom.new(nil, data, user: @roger)
  raise populator.errors.full_messages.to_sentence unless populator.call
  populator.atom
end

e = make(
  "element_id" => epic.id,
  "properties" => {
    title.id => "Improve our capability to scale",
    priority.id => 3,
    description.id => "One day we'd like to have more than one developer work on our project. What do we have to do to our codebase to make it more robust and allow more people to work on it?"
  }
)

s = make(
  "element_id" => story.id,
  "parent_atom_number" => e.number,
  "properties" => {
    title.id => "Write more tests",
    priority.id => 2,
    description.id => "As a developer\nI want to write more tests\nSo that I know when I've broken my code.\n"
  }
)

make(
  "element_id" => dlvr.id,
  "parent_atom_number" => s.number,
  "properties" => {
    title.id => "Install rspec",
    priority.id => 2,
    description.id => "Install rspec as a first step towards getting tests on our app"
  }
)

d = make(
  "element_id" => dlvr.id,
  "parent_atom_number" => s.number,
  "properties" => {
    title.id => "Write specs for models",
    priority.id => 2,
    description.id => "Our models are the first thing that needs tests."
  }
)

make(
  "element_id" => issue.id,
  "parent_atom_number" => d.number,
  "properties" => {
    title.id => "Widget model specs are failing",
    priority.id => 1,
    description.id => "The widget model specs fail when run between the hours of 7pm and 8pm"
  }
)

make(
  "element_id" => issue.id,
  "parent_atom_number" => d.number,
  "properties" => {
    title.id => "Baz specs incomplete",
    priority.id => 3,
    description.id => "The main Baz functionality doesn't cover the case when the input has the character z or $."
  }
)
