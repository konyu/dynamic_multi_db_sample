require 'httpclient'
require 'parallel'

class Inspection
  def self.insert_model_settings_ver
    client = HTTPClient.new
    Parallel.each([1, 2], in_threads: 2) do |i|
      1000.times do
        if i == 1
          client.post('http://localhost:3000/channging_model', 'user[name]' => 'other_db_model')
        else
          client.post('http://localhost:3000/channging_model', 'user[name]' => 'other_db_model')
        end
      end
    end
  end

  def self.insert_contoller_settings_ver
    client = HTTPClient.new
    Parallel.each([1, 2], in_threads: 2) do |i|
      1000.times do
        if i == 1
          client.post('http://localhost:3000/channging_ctrl', 'user[name]' => 'develop_db_controller')
        else
          client.post('http://localhost:3000/channging_ctrl', 'user[name]' => 'other_db_controller')
        end
      end
    end
  end
end
