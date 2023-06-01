class ElectronicsController < ApplicationController
  def index
    @electronics = Electronic.all
    send_data @electronics.generate_csv, filename: "electronics-#{Time.zone.now.strftime('%Y%m%d%S')}.csv"
        #format.csvの場合は、つまり/electronic.csvになっている場合はという意味。その場合は後述の処理をする。ここではsend dataをしているので、データをブラウザからダウンロードされるようにしている
  end
end
