class ApplicationController < ActionController::Base
  before_action :load_copy_data


  private
  def load_copy_data
    if File.exists?('copy.json')
      begin
        data = File.read('copy.json')
        @copy_data = JSON.parse(data)
      rescue Exception => e 
        puts "Exception: #{e.message}"
      end
    else
      render json: '***Please run task `rails import_copy_base:copy_data` before continuing', status: 404
    end
  end
end
