User.destroy_all
Resume.destroy_all

user = User.create!(
  first_name: "John",
  last_name: "Doe",
  email: "john.doe@example.com",
  password: "123456",
)

Resume.create!(
    name: "resume ruby",
    education: "9 weeks at lewagon",
    languages: "french, portugese, polish, english",
    main_tech_skill: "ruby, css, html",
    years_of_experience: 5,
    secondary_tech_skills: "figma",
    soft_skills: "Team work",
    work_experiences: " 01.2026 - 04.2026 working at le wagon",
    user: user
)

Resume.create!(
  name: "resume javascript",
  education: "7 years studies in computer sience at the montreal university",
  languages: "french, porutgese, polish, english",
  main_tech_skill: "javascript, figma, css",
  years_of_experience: 10,
  secondary_tech_skills: "python",
  soft_skills: "team work and problem comprention",
  work_experiences: " 04.2006 - 06.2010 working for a tech company",
  user: user
)
