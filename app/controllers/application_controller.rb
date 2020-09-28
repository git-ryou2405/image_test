class ApplicationController < ActionController::Base
  # logger
  def debug_log(argument)
    Rails.application.config.another_logger.debug(argument)
  end
end
