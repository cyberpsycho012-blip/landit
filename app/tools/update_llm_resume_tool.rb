class UpdateLlmResumeTool < RubyLLM::Tool
  description "Updates current resume with llm for the current user."
  param :resume_id, desc: "The ID of the resume", type: :integer
  param :extra_education, desc: "The new education I want to add to the resume"
  param :extra_work_experience, desc: "The new work experience I want to add to the resume"

  def execute(resume_id:, extra_education:, extra_work_experience:)
    resume = Resume.find(resume_id)
    chat = RubyLLM.chat # it will take longer since we call the chat several times.
    modifiedresume = Resume.update!(
      education: chat.ask("Add the #{extra_education} to #{resume.education}. Do not add any additional comment").content,
      work_experiences: chat.ask("Add the #{extra_work_experience}  to  #{resume.work_experiences}. Do not add any additional comment").content
    )
    "The resume was updated with llm successfully"
  rescue ActiveRecord::RecordNotFound
    { error: "Resume not found" }
  rescue ActiveRecord::RecordInvalid => e
    { error: e.message }
  end
end
