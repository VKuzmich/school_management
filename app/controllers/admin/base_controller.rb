class Admin::BaseController < ApplicationController
  layout 'admin'
  protect_from_forgery prepend: true, with: :exception
  before_action :authenticate_admin!
  before_action :set_main_menu, except: :destroy
  before_action :set_active_main_menu_item, except: :destroy

  private

  def set_main_menu
    @main_menu = { teachers: { name: 'Teacher', path: admin_teachers_path },
                   disciplines: { name: 'Discipline', path: admin_disciplines_path }}
  end
end