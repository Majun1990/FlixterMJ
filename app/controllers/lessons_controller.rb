class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_enrolled_in_current_lesson, only: [:show]
  
  def show

  end

  private

  def require_enrolled_in_current_lesson
    if current_lesson.section.course.user != current_user.enrolled_in?
      redirect_to course_path(current_course), alert: 'You are not enrolled'
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])    
  end

end
