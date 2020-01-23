class Admin::BaseController < ApplicationController
  layout 'admin'
  protect_from_forgery prepend: true, with: :exception
  before_action :authenticate_admin!
  before_action :set_main_menu, except: :destroy
  before_action :set_active_main_menu_item, except: :destroy

  respond_to :html
  private

  def set_main_menu
    @main_menu = { courses: { name: 'Курсы', path: admin_courses_path },
                   teachers: { name: 'Преподаватели', path: admin_teachers_path },
                   disciplines: { name: 'Дисциплины', path: admin_disciplines_path },
                   #admins: { name: 'Админы', path: admin_admins_path }
    }
  end
end