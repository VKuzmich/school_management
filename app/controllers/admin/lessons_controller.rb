class Admin::LessonsController < Admin::BaseController

  skip_before_action :set_active_main_menu_item, only: :sort

  before_action :set_course, except: :sort
  before_action :set_lesson, only: [:edit, :update, :destroy]

  def index
    @lessons = @course.lessons.order(:position).page(params[:page])
  end

  def new
    add_breadcrumb "Новый Курс", [:new, :admin, @course, :lesson]

    @lesson = @course.lessons.build
  end

  def create
    @lesson = @course.lessons.build(lesson_params)

    if @lesson.save
      redirect_to [:admin, @course, :lessons], notice: 'Lesson успешно создан'
    else
      add_breadcrumb "Новый Lesson", [:new, :admin, @course, :lesson]

      flash.now[:alert] = 'Не удалось создать Lesson'
      render :new
    end
  end

  def edit
    add_breadcrumb "Редактировать #{@lesson.name}", [:edit, :admin, @course, @lesson]
  end

  def update
    if @lesson.update(lesson_params)
      redirect_to [:admin, @course, :lessons], notice: 'Lesson успешно изменен'
    else
      add_breadcrumb "Редактировать #{@lesson.name}", [:edit, :admin, @course, @lesson]

      flash.now[:alert] = 'Не удалось изменить Lesson', [:admin, @lesson]
      render :edit
    end
  end

  def destroy
    if @lesson.destroy
      redirect_to [:admin, @course, :lessons], notice: 'Lesson успешно удален'
    else
      redirect_to [:admin, @course, :lessons], alert: "Не удалось удалить Lesson"
    end
  end

  def sort
    params[:lesson].each_with_index do |id, index|
      Lesson.find(id).update!(position: index + 1)
    end

    head :no_content
  end

  private

  def set_course
    @course = Course.find(params[:course_id ])

    add_breadcrumb 'Course', admin_courses_path
    add_breadcrumb @course.name, [:admin, @course, :lessons]
  end

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def set_active_main_menu_item
    @main_menu[:courses][:active] = true
  end

  def lesson_params
    params.require(:lesson).permit(:name, :description)
  end
end
