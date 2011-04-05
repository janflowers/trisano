require 'factory_girl'
require 'faker'

Factory.define(:code) do |code|
  code.code_name  { Factory.next(:code_name) }
  code.the_code   { Factory.next(:the_code)  }
  code.code_description { Factory.next(:code_description) }
end

Factory.define(:external_code) do |code|
  code.code_name  { Factory.next(:code_name) }
  code.the_code   { Factory.next(:the_code)  }
  code.code_description { Factory.next(:code_description) }
end

Factory.define(:contact_type, :parent => :external_code) do |code|
  code.code_name "contact_type"
end

Factory.define(:place_type, :parent => 'code') do |code|
  code.code_name "placetype"
end

Factory.define(:county, :parent => :external_code) do |c|
  c.code_name 'county'
end

Factory.define(:gender, :parent => :external_code) do |g|
  g.code_name 'gender'
end

Factory.define(:treatment_type, :parent => :code) do |g|
  g.code_name 'treatment_type'
end

# sequences

Factory.sequence(:code_name) do |n|
  "code_name_#{n}"
end

Factory.sequence(:the_code) do |n|
  "a#{Time.now.to_i.to_s}#{n}"
end

Factory.sequence(:code_description) do |n|
  "#{n}A code description#{n}"
end

