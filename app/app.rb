require 'bundler'
Bundler.require

require 'csv'
require 'tempfile'
# require 'pry'
require 'sinatra'
require 'sinatra/base'

class App < Sinatra::Base

  configure do
    # 静的コンテンツ参照のためのパス設定
    set :public_dir, File.dirname(__FILE__) + '/public'
  end

  get '/' do
    slim :index
  end

  get '/convert_tsv_to_csv' do
    slim :convert
  end

  post '/convert_tsv_to_csv' do
    filename = params[:file][:filename]
    input_tsv = params[:file][:tempfile]
    output_csv = Tempfile.new('csv')
    output_csv.close

    CSV.open(output_csv.path, "w") do |csv|
      File.open(input_tsv.path) do |f|
        f.each_line do |tsv|
          csv << tsv.chomp.force_encoding("cp932").split(/\t/)
        end
      end
    end

    # CSV データ読み取り
    res = File.read(output_csv.path)

    # tempfile 削除
    output_csv.close!

    content_type 'application/csv'
    attachment "#{filename}.csv"
    res
  end
end