require 'pry'
class UsersController < Clearance::UsersController
  
  def create
    @user = ::User.new params[:user]
    if @user.save
      ::ClearanceMailer.deliver_confirmation @user
      flash_notice_after_create
      redirect_to(url_after_create)
    else
      render :template => 'users/new'
    end
  end

  def url_after_create
    '/users/demographics'
  end
  
  def demographics
    if signed_in?
      @user = current_user
      @ages = Age.all
      @countries = Country.all
      @education_levels = EducationLevel.all
      @experience_years = ExperienceYears.all
      @organization_types = OrganizationType.all
      @field_of_studies = FieldOfStudy.all
      @computational_resources = ComputationalResources.all
      @software_hours = SoftwareHours.all
      @number_of_users = NumberOfUsers.all
      @programming_languages = ProgrammingLanguage.all
      @team_sizes = TeamSize.all
    else
      redirect_to :action => "create"
    end
  end
  
  def update
    if signed_in?
      current_user.age_id = params[:user][:age_id]
      current_user.country_id = params[:user][:country_id]
      current_user.education_level_id = params[:user][:education_level_id]
      current_user.education_field = params[:user][:education_field]
      current_user.software_experience_years_id = params[:user][:software_experience_years_id]
      current_user.domain_experience_years_id = params[:user][:domain_experience_years_id]
      current_user.organization_type_id = params[:user][:organization_type_id]
      current_user.position = params[:user][:position]
      current_user.institution = params[:user][:institution]
      current_user.field_of_studies_id = params[:user][:field_of_studies_id]
      current_user.computational_resources_id = params[:user][:computational_resources_id]
      current_user.hours_using_software_id = params[:user][:hours_using_software_id]
      current_user.hours_developing_software_id = params[:user][:hours_developing_software_id]
      current_user.number_of_users_id = params[:user][:number_of_users_id]
      current_user.team_size_id = params[:user][:team_size_id]
      current_user.programming_language_ids = params[:user][:programming_language_ids]
      
      if current_user.save
        session[:standard_flash] = "Your profile has been updated."
      end
      
      @user = current_user
      @ages = Age.all
      @countries = Country.all
      @education_levels = EducationLevel.all
      @experience_years = ExperienceYears.all
      @organization_types = OrganizationType.all
      @field_of_studies = FieldOfStudy.all
      @computational_resources = ComputationalResources.all
      @software_hours = SoftwareHours.all
      @number_of_users = NumberOfUsers.all
      @programming_languages = ProgrammingLanguage.all
      @team_sizes = TeamSize.all
      
      render :template => 'users/demographics'
    else
      redirect_to :action => "create"
    end
  end
  
end
