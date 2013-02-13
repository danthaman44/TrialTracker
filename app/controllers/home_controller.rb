class HomeController < ApplicationController
  def index
      logger.info("testing!")
      puts("testing")
  end
  def join_event
      logger.info("******** Joining Event!**********")
  end
end
