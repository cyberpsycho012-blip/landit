class ResumesController < ApplicationController
  before_action :set_resumes

  def index
    @resumes = current_user.resumes
    @resume = if params[:resume_id].present?
                @resumes.find(params[:resume_id])
              else
                @resumes.last
              end
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)
    @resume.user = current_user
    if @resume.save
      redirect_to resumes_path, notice: "Resume created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @resume = Resume.find(params[:id])
  end

  def update
    @resume = Resume.find(params[:id])
    if @resume.update(resume_params)
      redirect_to resumes_path, notice: "Resume created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy

    redirect_to resumes_path
  end

  private

  def resume_params
    params.require(:resume).permit(:name, :education, :main_tech_skill, :secondary_tech_skills, :soft_skills,
                                   :languages, :years_of_experience, :work_experiences)
  end

  def set_resumes
    @resumes = current_user.resumes
  end
end
