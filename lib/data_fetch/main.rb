require 'rest_client'
require 'socket'

module DataFetch
  module Main
    def self.get_restaurents
      begin
        res = File.read("#{Rails.root}/public/cue_data.json")
        res = ActiveSupport::JSON.decode(res)
        return res
      rescue Exception => e
        Rails.logger.info 'Bad Request' + e.message
        return
      end
    end
  end
  
  def self.included(receiver)
    receiver.extend ClassMethods
  end
  
end


