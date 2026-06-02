# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "faker"

Resume.destroy_all
Skills.destroy_all
Experiences.destroy_all
Education.destroy_all
Languages.destroy_all

resume = Resume.create!(
    name: Faker::Name.name,
    title: 'full-stack Developer',
    email: Faker::Internet.user,
    summary: "Passionate developper with 9 weeks bootcamps capable of creating an app"
)

resume = Resume.create!(
    name: Faker::Name.name,
    title: "full-stack Developper",
    email: Faker::Internet.user,
    summary: "Passionate web developper with 5+ years experience",
)

resume.skill.create!([
  { name: "Ruby on Rails", level: "Medium"},
  { name: "javascript", level: "Expert"},
  { name: "Html and css", level: "advenced"},
])

resume.experiences.create!([
{
  company: Faker::company.name,
  role: "Full-stack web devloper",
  start_date: Date.new(2018, 03, 21),
  end_date: Date.new(2023, 04, 27),
  description: "Built and maintained client website"
},
])

main_tech_skills = [
  { name: "Ruby on Rails", level: "Expert", category: "Main Technical" },
  { name: "JavaScript (React)", level: "Advanced", category: "Main Technical" },
  { name: "PostgreSQL", level: "Advanced", category: "Main Technical" }
]

secondary_tech_skills = [
  { name: "Docker", level: "Intermediate", category: "Secondary Technical" },
  { name: "AWS", level: "Intermediate", category: "Secondary Technical" },
  { name: "GraphQL", level: "Beginner", category: "Secondary Technical" }
]

soft_skills = [
  { name: "Team Leadership", level: "Strong", category: "Soft Skill" },
  { name: "Problem Solving", level: "Strong", category: "Soft Skill" },
  { name: "Time Management", level: "Strong", category: "Soft Skill" }
]

languages = [
  { name: "English", level: "Fluent" },
  { name: "French", level: "Intermediate" },
  { name: "Spanish", level: "Basic" }
]

(main_tech_skills + secondary_tech_skills + soft_skills).each do |skill|
  resume.skills.create!(skill)
end

languages.each do |lang|
  resume.languages.create!(lang)
end

resume.experiences.create!([
  {
    company: Faker::Company.name,
    role: "Senior Software Engineer",
    start_date: Date.new(2021, 05, 10),
    end_date: nil,
    description: "Lead developer for multiple SaaS products, mentoring junior engineers and improving system performance."
  },
  {
    company: Faker::Company.name,
    role: "Full-Stack Developer",
    start_date: Date.new(2018, 3, 1),
    end_date: Date.new(2021, 4, 30),
    description: "Built and maintained client websites, integrated APIs, and optimized database queries."
  }
])

resume.educations.create!([
  {
    institution: Faker::University.name,
    degree: "Computer Science",
    start_year: 2014,
    end_year: 2018
  }
])
