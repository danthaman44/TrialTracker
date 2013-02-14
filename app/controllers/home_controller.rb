class HomeController < ApplicationController
  def index
      logger.info("testing!")
      puts("testing")
  end
  def join_event
      logger.info("******** Joining Event!**********")
  end
  def insert_subject
      logger.info("****** Inserting Subject! ******")
      #// call ashwin's db stuff
      enrolled = params['enrolled']
      logger.info(enrolled)
      #redirect_to index
   end
end
