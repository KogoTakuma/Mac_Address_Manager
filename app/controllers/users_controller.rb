class UsersController < ApplicationController
    def index()
    @users = User.all
    send_data @users.generate_csv, filename: "users-#{Time.zone.now.strftime('%Y%m%d%S')}.csv"
        #format.csvの場合は、つまり/user.csvになっている場合はという意味。その場合は後述の処理をする。ここではsend dataをしているので、データをブラウザからダウンロードされるようにしている

    end    

    def import 
        @user  = User.all
        @user.import(params[:file])  #現在のuserのtaskにimportを発動させる
        redirect_to rails_admin_path, notice: "タスクを追加しました"
    end
    def pre_import 
    end
    
end
