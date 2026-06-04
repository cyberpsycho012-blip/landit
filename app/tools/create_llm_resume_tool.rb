class CreateLlmResumeTool < RubyLLM::Tool
  description "Creates a modified llm version of the resume for the current user on a given resume."
  param :resume_id, desc: "The ID of the resume", type: :integer
  param :user_first_name, desc: "The first name of the current user."

  def initialize(user:)
    @user = user
  end

  def execute(resume_id:, user_first_name:)
    resume = Resume.find(resume_id)
    chat = RubyLLM.chat # it will take longer since we call the chat several times.
    modifiedresume = Resume.create!(
      education: chat.ask("Create an improved version of this education #{resume.education}. Do not give me options. Select the best option.").content,
      languages: resume.languages,
      main_tech_skill: resume.main_tech_skill,
      name: "#{resume.name} modified llm version",
      secondary_tech_skills: resume.secondary_tech_skills,
      soft_skills: resume.soft_skills,
      user_id: resume.user_id,
      work_experiences: chat.ask("Create an improved version of these work experiences #{resume.work_experiences}. Do not give me options. Select the best option.").content,
      years_of_experience: resume.years_of_experience
    )
    "The llm resume was modified successfully"
  rescue ActiveRecord::RecordNotFound
    { error: "Resume not found" }
  rescue ActiveRecord::RecordInvalid => e
    { error: e.message }
  end
end
