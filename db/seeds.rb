Chat.destroy_all
User.destroy_all
Resume.destroy_all

user1 = User.create!(
  first_name: "Beata",
  last_name: "B.",
  email: "b.wierzbicka90@gmail.com",
  password: "123456",
)

# user2 = User.create!(
#   first_name: "jane",
#   last_name: "doe",
#   email: "janedoe@example.com",
#   password: "123456",
# )

Resume.create!(
    name: "resume ruby",
    education: "AI Software development April - June 2026
                Le Wagon Montreal
                - Completed a 9-week full-time intensive AI
                  Software Development bootcamp
                - Worked with HTML5, CSS3, Bootstrap,
                  JavaScript, SQL, Git, GitHub, Heroku, and
                  Ruby on Rails
                - Gained hands-on experience with modern AI
                  tools and technologies including OpenAI
                  APIs, Cloudinary, Elasticsearch, Algolia,
                  WebSockets, ActionCable, LLMs, AI agents,
                  and AI-powered text/image/document processing
                - Developed an AI Assistant during a one- week project sprint
                - Co-developed OnJase, a full-stack web
                  application, in a team of five during a two-week project sprint

                Engineering Management majoring in Information Technology in Management
                2009 - 2013
                Gdansk University of Technology, Poland

                Bachelor's Degree of Engineering - Global Business Engineering
                2011 - 2012
                VIA University Collage, Horsens, Denmark
                ERASMUS Exchange Program",
    languages: "Polish",
    main_tech_skill: "ruby, css, html",
    years_of_experience: 5,
    secondary_tech_skills: "figma",
    soft_skills: "Team work",
    work_experiences: "Barista APR 2025 - DEC 2025
                      Café Bazin & Café Replika — Montreal, Canada
                      - Delivered high-quality customer service in fast-paced café environments
                      - Managed multitasking during peak hours while maintaining attention to detail
                      - Worked collaboratively with team members to ensure smooth daily operations

                      Trade Assistant JUL 2023 - SEP 2024
                      Dynamic Total Services — Perth, Australia
                      - Followed strict safety procedures while performing maintenance work on
                        mining equipment across Western Australia
                      - Assisted with troubleshooting and repair tasks in high-pressure industrial
                        environments
                      - Developed strong problem-solving and teamwork skills

                      Plant Operator DEC 2022 - MAR 2023
                      Esperance Quality Grains — Esperance, Australia
                      - Operated industrial machinery and performed routine maintenance and
                        troubleshooting
                      - Coordinated export preparation for 100-150 shipping containers monthly
                        while maintaining quality standards
                      - Worked efficiently in time-sensitive operational environments

                      Hospitality & Customer Service Roles 2018 - 2022
                      Australia & USA
                      - Delivered customer service in high-volume cafés, restaurants, and hotel
                        environments
                      - Trained and supervised staff members
                      - Managed POS systems, cash handling, inventory, and daily operations
                        Built strong communication, organization, and multitasking skills in fast-paced
                        teams

                      Operations Manager SEP 2015 - JAN 2018
                      PMT Dance Studio — New York City, USA
                      - Managed daily studio operations, scheduling, and customer communications
                      - Coordinated instructors, bookings, and multiple program schedules
                      - Maintained company website and social media updates
                      - Created promotional materials and supported business organization",
    user: user1
)

Resume.create!(
  name: "resume javascript",
  education: "to-do",
  languages: "french, porutgese, polish, english",
  main_tech_skill: "javascript, figma, css",
  years_of_experience: 10,
  secondary_tech_skills: "python",
  soft_skills: "team work and problem comprention",
  work_experiences: "Barista APR 2025 - DEC 2025
                      Café Bazin & Café Replika — Montreal, Canada
                      - Delivered high-quality customer service in fast-paced café environments
                      - Managed multitasking during peak hours while maintaining attention to detail
                      - Worked collaboratively with team members to ensure smooth daily operations

                      Trade Assistant JUL 2023 - SEP 2024
                      Dynamic Total Services — Perth, Australia
                      - Followed strict safety procedures while performing maintenance work on
                        mining equipment across Western Australia
                      - Assisted with troubleshooting and repair tasks in high-pressure industrial
                        environments
                      - Developed strong problem-solving and teamwork skills

                      Plant Operator DEC 2022 - MAR 2023
                      Esperance Quality Grains — Esperance, Australia
                      - Operated industrial machinery and performed routine maintenance and
                        troubleshooting
                      - Coordinated export preparation for 100-150 shipping containers monthly
                        while maintaining quality standards
                      - Worked efficiently in time-sensitive operational environments

                      Hospitality & Customer Service Roles 2018 - 2022
                      Australia & USA
                      - Delivered customer service in high-volume cafés, restaurants, and hotel
                        environments
                      - Trained and supervised staff members
                      - Managed POS systems, cash handling, inventory, and daily operations
                        Built strong communication, organization, and multitasking skills in fast-paced
                        teams

                      Operations Manager SEP 2015 - JAN 2018
                      PMT Dance Studio — New York City, USA
                      - Managed daily studio operations, scheduling, and customer communications
                      - Coordinated instructors, bookings, and multiple program schedules
                      - Maintained company website and social media updates
                      - Created promotional materials and supported business organization",
  user: user1
)
#done1
