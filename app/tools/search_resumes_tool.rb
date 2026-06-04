class SearchResumesTool < RubyLLM::Tool
  description "Searches resumes by keyword in name, work_experiences or main_tech_skill."
  param :query, desc: "The keyword to search for"

  def execute(query:)
    resumes = Resume.all
    query.split.each do |word|
      resumes = resumes.where("name ILIKE :q OR work_experiences ILIKE :q OR main_tech_skill ILIKE :q", q: "%#{word}%")
    end
    return "No resumes found for '{query}'" if resumes.empty?

    resumes.map do |resume|
      { id: resume.id, name: resume.name, main_tech_skill: resume.main_tech_skill,
        work_experiences: resume.work_experiences.truncate(200) }
    end
  end
end
