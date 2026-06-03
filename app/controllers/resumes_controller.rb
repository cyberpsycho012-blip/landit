class ResumesController < ApplicationController
  def index
    @resumes = Resume.all
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)
    if @resume.save
      redirect_to resume_path(@resume), notice: "Resume created!"
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
      redirect_to resume_path(@resume), notice: "Resume created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @resume = Resume.find(params[:id])
  end

  private

  def resume_params
    params.require(:resume).permit(:name, :education, :main_tech_skill, :secondary_tech_skills, :soft_skills,
                                   :languages, :years_of_experience, :work_experiences)
  end
end
