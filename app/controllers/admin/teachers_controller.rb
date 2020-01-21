class Admin::TeachersController < Admin::BaseController
  add_breadcrumb 'Teachers', :admin_teachers_path
  before_action :set_teacher, only: [:edit, :update, :destroy]

  def index
    @teachers = Teacher.order(id: :desc).page(params[:page])
  end

  def new
    add_breadcrumb 'New Teacher', new_admin_teacher_path
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      redirect_to admin_teachers_path, notice: "Teacher was added"
    else
      add_breadcrumb 'New Teacher', new_admin_teacher_path
      flash.now[:alert] = 'Could not create teacher'
      render :new
    end
  end

  def edit
    add_breadcrumb "Edit Teacher #{@teacher.decorate.full_name}", [:edit, :admin, @teacher]
  end

  def update
    if @teacher.update(teacher_params)
      redirect_to admin_teachers_path, notice: "Teacher was edited"
    else
      add_breadcrumb "Edit Teacher #{@teacher.decorate.full_name}", [:admin, @teacher]

      flash.now[:alert] = 'Could not edit teacher'
      render :edit
    end
  end

  def destroy
    if @teacher.destroy
      redirect_to admin_teachers_path, notice: 'Teacher was successfully deleted'
    else
      redirect_to admin_teachers_path, alert: 'Could not delete teacher'
    end
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def set_active_main_menu_item
    @main_menu[:teachers][:active] = true
  end

  def teacher_params
    params.require(:teacher).permit(:first_name, :last_name, :description)
  end

end
